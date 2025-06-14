import 'package:alora/core/config/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/utils/helper_method.dart';

class RowEndText extends StatelessWidget {
  const RowEndText({
    super.key,
    required this.label,
    this.isUnderLine = true,
    this.color = AppColors.textBlackColor,
    this.onPress = HelperMethod.emptyCallback,
  });

  final String label;
  final Color color;
  final bool isUnderLine;
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
              color: color,
              decoration: isUnderLine ? TextDecoration.underline : null,
              decorationColor: AppColors.blackColor,
              decorationThickness: AppSizes.dividerHeight
            ),
          ),
        )
      ],
    );
  }
}