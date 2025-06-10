import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/utils/helper_method.dart';

class RowEndText extends StatelessWidget {
  const RowEndText({
    super.key,
    required this.label,
    this.color = AppColors.primaryColor,
    this.onPress = HelperMethod.emptyCallback,
  });

  final String label;
  final Color color;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        GestureDetector(
          onTap: onPress,
          child: Text(
            label,
            style: context.textTheme.labelLarge?.copyWith(
                color: color
            ),
          ),
        )
      ],
    );
  }
}