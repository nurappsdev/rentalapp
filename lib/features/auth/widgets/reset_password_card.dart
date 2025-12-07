import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/config/app_icons.dart';
import 'package:alora/core/config/app_sizes.dart';
import 'package:alora/core/config/app_strings.dart';
import 'package:alora/core/extensions/context_extensions.dart';
import 'package:alora/core/routes/app_routes.dart';
import 'package:alora/core/utils/custom_bottom_sheet.dart';
import 'package:alora/core/widgets/custom_button.dart';
import 'package:alora/core/widgets/custom_text_field.dart';
import 'package:alora/features/auth/controllers/reset_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ResetPasswordCard extends StatelessWidget {
  final ResetPasswordController resetPasswordController;
  const ResetPasswordCard({
    super.key,
    required this.resetPasswordController
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(AppSizes.screenHorizontal),
      padding: const EdgeInsets.all(AppSizes.screenHorizontal),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(AppSizes.borderRadiusXxxL)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          // title & subtitle
          Text(
            AppStrings.resetPasswordTitle,
            style: context.txtTheme.headlineSmall,
          ),

          const SizedBox(height: AppSizes.sm,),

          Text(
            AppStrings.resetPasswordSubTitle,
            style: context.txtTheme.bodySmall,
          ),

          const SizedBox(height: AppSizes.lg,),

          // form fields
          
          Text(
            AppStrings.passwordLabel,
            style: context.txtTheme.titleMedium,
          ),

          const SizedBox(height: AppSizes.md,),

          CustomTextField(
            controller: TextEditingController(),
            hintText: AppStrings.passwordHint,
            prefixIcon: SvgPicture.asset(AppIcons.passwordPrefixIcon),
            isBorder: true,
            isPassword: true,
          ),

          const SizedBox(height: AppSizes.md,),


          Text(
            AppStrings.confirmPasswordLabel,
            style: context.txtTheme.titleMedium,
          ),

          const SizedBox(height: AppSizes.md,),

          CustomTextField(
            controller: TextEditingController(),
            hintText: AppStrings.confirmPasswordHint,
            prefixIcon: SvgPicture.asset(AppIcons.passwordPrefixIcon),
            isBorder: true,
            isPassword: true,
          ),

          const SizedBox(height: AppSizes.spaceBetweenSections,),

          CustomButton(
            onTap: (){
              CustomBottomSheet.showCustomBottomSheet(
                context: context, 
                isDismissible: false,
                child: const ResetPassBottomSheet()
              );
            }, 
            text: AppStrings.resetPassword
          ),

          const SizedBox(height: AppSizes.spaceBetweenSections,),
          
        ],
      ),
    );
  }
}


class ResetPassBottomSheet extends StatelessWidget {
  const ResetPassBottomSheet({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SvgPicture.asset(AppIcons.resetPassBottomSheetIcon),

            const SizedBox(height: AppSizes.spaceBetweenItems),

            Text(
              AppStrings.resetPasswordBottomSheetTitle,
              style: context.txtTheme.bodyLarge,
            ),

            const SizedBox(height: AppSizes.sm),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                AppStrings.resetPasswordBottomSheetSubTitle, 
                style: context.txtTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
            ),

            const SizedBox(height: AppSizes.spaceBetweenSections),
            CustomButton(
              onTap: () => Get.offAllNamed(AppRoutes.signInRoute), 
              text: AppStrings.backToSignIn
            ),
          ],
        ),
    );
  }
}