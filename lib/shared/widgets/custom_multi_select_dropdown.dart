import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomMultiSelectDropdown<T> extends StatefulWidget {
  final List<T> options;
  final Function(List<T>)? onChanged;
  final String Function(T) displayString;
  final String? hint;
  final List<T>? initialSelected;
  final Color? borderColor;

  const CustomMultiSelectDropdown({
    super.key,
    required this.options,
    required this.displayString,
    this.onChanged,
    this.hint,
    this.initialSelected,
    this.borderColor,
  });

  @override
  State<CustomMultiSelectDropdown<T>> createState() => _CustomMultiSelectDropdownState<T>();
}

class _CustomMultiSelectDropdownState<T> extends State<CustomMultiSelectDropdown<T>> {
  List<T> _selectedOptions = <T>[];
  bool _isOpen = false;
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;

  // 👇 Notifier to trigger real-time rebuilds in overlay
  late final ValueNotifier<List<T>> _selectionNotifier;

  @override
  void initState() {
    super.initState();
    _selectionNotifier = ValueNotifier<List<T>>(<T>[]);
    if (widget.initialSelected != null) {
      _selectedOptions = List<T>.from(widget.initialSelected!);
    }
    _selectionNotifier.value = _selectedOptions;
    if (widget.onChanged != null) {
      widget.onChanged!(_selectedOptions);
    }
  }

  @override
  void dispose() {
    _selectionNotifier.dispose();
    _removeOverlay();
    super.dispose();
  }

  void _toggleDropdown() {
    if (_isOpen) {
      _removeOverlay();
    } else {
      _showOverlay();
    }
    setState(() {
      _isOpen = !_isOpen;
    });
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  void _showOverlay() {
    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
  }

  void _toggleOption(T option) {
    setState(() {
      if (_selectedOptions.contains(option)) {
        _selectedOptions.remove(option);
      } else {
        _selectedOptions.add(option);
      }
    });
    _selectionNotifier.value = _selectedOptions; // 👈 Notify overlay to rebuild
    if (widget.onChanged != null) {
      widget.onChanged!(_selectedOptions);
    }
  }

  OverlayEntry _createOverlayEntry() {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final Size size = renderBox.size;

    return OverlayEntry(
      builder:
          (BuildContext context) => Positioned(
            width: size.width,
            child: CompositedTransformFollower(
              link: _layerLink,
              showWhenUnlinked: false,
              offset: Offset(0.0, size.height),
              child: Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(12.0),
                color: Colors.white,
                child: Container(
                  constraints: const BoxConstraints(maxHeight: 250),
                  // 👇 Rebuild list when selection changes
                  child: ValueListenableBuilder<List<T>>(
                    valueListenable: _selectionNotifier,
                    builder: (BuildContext context, List<T> selectedList, Widget? child) {
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemCount: widget.options.length,
                        itemBuilder: (BuildContext context, int index) {
                          final T option = widget.options[index];
                          final bool isSelected = selectedList.contains(option);
                          return InkWell(
                            onTap: () => _toggleOption(option),
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                              color: isSelected ? const Color(0xFFE0E0E0) : Colors.white,
                              child: Row(
                                children: <Widget>[
                                  if (isSelected)
                                    Icon(
                                      Icons.check,
                                      color: Theme.of(context).primaryColor,
                                      size: 18,
                                    ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      widget.displayString(option),
                                      style: TextStyle(
                                        color: isSelected ? Colors.black : Colors.black87,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: SizedBox(
        width: Get.width,
        child: GestureDetector(
          onTap: _toggleDropdown,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(color: widget.borderColor ?? Colors.grey.shade300),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Text(
                    _selectedOptions.isEmpty
                        ? widget.hint ?? "Select options"
                        : _selectedOptions.map((T opt) => widget.displayString(opt)).join(', '),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: _selectedOptions.isEmpty ? Colors.grey : Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
                Icon(
                  _isOpen ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                  color: Colors.black,
                  size: 28,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
