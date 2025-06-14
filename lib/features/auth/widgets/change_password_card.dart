import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/config/app_icons.dart';
import 'package:alora/core/config/app_sizes.dart';
import 'package:alora/core/config/app_strings.dart';
import 'package:alora/core/routes/app_routes.dart';
import 'package:alora/core/utils/custom_bottom_sheet.dart';
import 'package:alora/core/widgets/custom_button.dart';
import 'package:alora/core/widgets/custom_text_field.dart';
import 'package:alora/features/auth/controllers/change_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ChangePasswordCard extends StatelessWidget {
  final ChangePasswordController changePasswordController;
  const ChangePasswordCard({
    super.key,
    required this.changePasswordController
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
          // form fields
          
          Text(
            AppStrings.oldPasswordLabel,
            style: context.textTheme.titleMedium,
          ),

          const SizedBox(height: AppSizes.spaceBetweenInputs,),

          CustomTextField(
            controller: TextEditingController(),
            hintText: AppStrings.oldPasswordHint,
            prefixIcon: SvgPicture.asset(AppIcons.passwordPrefixIcon),
            isBorder: true,
            isPassword: true,
          ),

          const SizedBox(height: AppSizes.spaceBetweenInputs,),


          Text(
            AppStrings.newPasswordLabel,
            style: context.textTheme.titleMedium,
          ),

          const SizedBox(height: AppSizes.md,),

          CustomTextField(
            controller: TextEditingController(),
            hintText: AppStrings.newPasswordHint,
            prefixIcon: SvgPicture.asset(AppIcons.passwordPrefixIcon),
            isBorder: true,
            isPassword: true,
          ),

          const SizedBox(height: AppSizes.spaceBetweenInputs,),


          Text(
            AppStrings.confirmPasswordLabel,
            style: context.textTheme.titleMedium,
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
          
        ],
      ),
    );
  }
}

