import 'package:alora/core/config/app_icons.dart';
import 'package:alora/core/config/app_sizes.dart';
import 'package:alora/core/config/app_strings.dart';
import 'package:alora/core/extensions/context_extensions.dart';
import 'package:alora/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class DeleteBottomSheet extends StatelessWidget {
  final VoidCallback onDeleteCallBack;
  const DeleteBottomSheet({
    super.key,
    required this.onDeleteCallBack
  });


  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SvgPicture.asset(AppIcons.deleteBottomSheetIcon),

            const SizedBox(height: AppSizes.spaceBetweenItems),

            Text(
              AppStrings.deleteBottomSheetTitle,
              style: context.txtTheme.bodyLarge,
            ),

            const SizedBox(height: AppSizes.sm),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                AppStrings.deleteBottomSheetSubTitle, 
                style: context.txtTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
            ),

            const SizedBox(height: AppSizes.spaceBetweenSections),
            Row(
              spacing: AppSizes.sm,
              children: <Widget>[
                Expanded(
                  child: CustomButton(
                    onTap: () => Get.back(), 
                    text: AppStrings.no,
                    isOutline: true,
                  ),
                ),
                Expanded(
                  child: CustomButton(
                    onTap: onDeleteCallBack, 
                    text: AppStrings.yes
                  ),
                ),
              ],
            )
          ],
        ),
    );
  }
}