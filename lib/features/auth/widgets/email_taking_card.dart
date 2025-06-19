import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/config/app_icons.dart';
import 'package:alora/core/config/app_sizes.dart';
import 'package:alora/core/config/app_strings.dart';
import 'package:alora/core/extensions/context_extensions.dart';
import 'package:alora/core/routes/app_routes.dart';
import 'package:alora/core/widgets/custom_button.dart';
import 'package:alora/core/widgets/custom_text_field.dart';
import 'package:alora/features/auth/controllers/taking_email_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class EmailTakingCard extends StatelessWidget {
  final TakingEmailController takingEmailController;

  const EmailTakingCard({
    super.key,
    required this.takingEmailController
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
            AppStrings.emailTakingTitle,
            style: context.txtTheme.headlineSmall,
          ),

          const SizedBox(height: AppSizes.sm,),

          Text(
            AppStrings.emailTakingSubTitle,
            style: context.txtTheme.bodySmall,
          ),

          const SizedBox(height: AppSizes.lg,),

          // form fields
          
          Text(
            AppStrings.emailAddressLabel,
            style: context.txtTheme.titleMedium,
          ),

          const SizedBox(height: AppSizes.md,),

          CustomTextField(
            controller: TextEditingController(),
            hintText: AppStrings.emailAddressHint,
            prefixIcon: SvgPicture.asset(AppIcons.emailPrefixIcon),
            isBorder: true,
          ),

          const SizedBox(height: AppSizes.spaceBetweenSections,),

          CustomButton(
            onTap: () => Get.toNamed(AppRoutes.verifyEmailRoute), 
            text: AppStrings.sendOtp
          ),

          const SizedBox(height: AppSizes.spaceBetweenSections,),
          
        ],
      ),
    );
  }
}