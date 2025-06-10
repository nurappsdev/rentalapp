import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/utils/helper_method.dart';

class CustomRichText extends StatelessWidget {
  const CustomRichText({
    super.key,
    required this.firstLabel,
    required this.secondLabel,
    this.isExpanded = false,
    this.onPress = HelperMethod.emptyCallback,
  });

  final String firstLabel;
  final String secondLabel;
  final VoidCallback onPress;
  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    return isExpanded ? Expanded(
      child: RichText(
        text: TextSpan(
          text: firstLabel,
          style: context.textTheme.bodySmall,
          children: <TextSpan>[
            TextSpan(
              text: " $secondLabel",
              style: context.textTheme.bodySmall?.copyWith(
                  color: AppColors.primaryColor
              ),
              recognizer: TapGestureRecognizer()..onTap = onPress
            ),
          ],
        ),
      ),
    ) : RichText(
      text: TextSpan(
        text: firstLabel,
        style: context.textTheme.bodySmall,
        children: <TextSpan>[
          TextSpan(
              text: " $secondLabel",
              style: context.textTheme.bodySmall?.copyWith(
                  color: AppColors.primaryColor
              ),
              recognizer: TapGestureRecognizer()..onTap = onPress
          ),
        ],
      ),
    );
  }
}
