import 'package:alora/core/widgets/custom_button.dart';
import 'package:alora/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResolveTicket extends StatelessWidget {
  final VoidCallback onYes;
  final VoidCallback onNo;

  const ResolveTicket({super.key, required this.onYes, required this.onNo});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      backgroundColor: Colors.white,
      insetPadding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'Resolve Ticket',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          const SizedBox(height: 16),
          Row(
            children: <Widget>[
              Expanded(child: CustomButton(onTap: onNo, text: 'No', isOutline: true)),
              const SizedBox(width: 16),
              Expanded(child: CustomButton(onTap: onYes, text: 'Yes')),
            ],
          ),
          const SizedBox(height: 16),
          CustomTextField(
            hintText: "Type Note",
            maxLines: 6,
            minLines: 4,
            isBorder: true,
            controller: TextEditingController(),
          ),
          const SizedBox(height: 20),
          CustomButton(
            onTap: () {
              Get.back(); // Close the dialog
            },
            text: 'Submit',
          ),
        ],
      ),
    );
  }
}
