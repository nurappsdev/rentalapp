import 'package:alora/core/config/app_icons.dart';
import 'package:alora/core/config/app_sizes.dart';
import 'package:alora/core/config/app_strings.dart';
import 'package:alora/core/extensions/context_extensions.dart';
import 'package:alora/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class CongratulationSheet extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onProceedCallback;

  const CongratulationSheet({
    super.key,
    required this.title,
    required this.description,
    required this.onProceedCallback,
  });


  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SvgPicture.asset(AppIcons.congratulationIcon),

            const SizedBox(height: AppSizes.spaceBetweenItems),

            Text(
              title,
              style: context.txtTheme.titleLarge,
            ),

            const SizedBox(height: AppSizes.sm),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                description, 
                style: context.txtTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
            ),

            const SizedBox(height: AppSizes.spaceBetweenSections),
            CustomButton(
              onTap: onProceedCallback, 
              text: AppStrings.proceed
            ),
          ],
        ),
    );
  }
}