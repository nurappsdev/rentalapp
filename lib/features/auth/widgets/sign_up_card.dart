import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/config/app_icons.dart';
import 'package:alora/core/config/app_sizes.dart';
import 'package:alora/core/config/app_strings.dart';
import 'package:alora/core/extensions/context_extensions.dart';
import 'package:alora/core/routes/app_routes.dart';
import 'package:alora/core/widgets/custom_button.dart';
import 'package:alora/core/widgets/custom_text_field.dart';
import 'package:alora/features/auth/controllers/sign_up_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SignUpCard extends StatelessWidget {
  final SignUpController signUpController;
  const SignUpCard({
    super.key,
    required this.signUpController
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
            AppStrings.signUpTitle,
            style: context.txtTheme.headlineSmall,
          ),

          const SizedBox(height: AppSizes.sm,),

          Text(
            AppStrings.signUpSubTitle,
            style: context.txtTheme.bodySmall,
          ),

          const SizedBox(height: AppSizes.lg,),

          // form fields

          Text(
            AppStrings.usernameLabel,
            style: context.txtTheme.titleMedium,
          ),

          const SizedBox(height: AppSizes.md,),

          CustomTextField(
            controller: TextEditingController(),
            hintText: AppStrings.usernameHint,
            prefixIcon: SvgPicture.asset(AppIcons.userNamePrefixIcon),
            isBorder: true,
          ),

          const SizedBox(height: AppSizes.md,),
          
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

          const SizedBox(height: AppSizes.md,),


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

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: AppSizes.xs,
            children: <Widget>[
              Obx(
                () => Checkbox(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  value: signUpController.isAgreementAccepted.value, 
                  onChanged: (bool? value) => signUpController.updateAgreementStatus = value,
                ),
              ),
              Expanded(
                child: Text(
                  AppStrings.termsAndConditionsAgreement,
                  style: context.txtTheme.labelSmall
                ),
              ),
              const SizedBox(width: AppSizes.lg,)
            ],
          ),

          const SizedBox(height: AppSizes.spaceBetweenSections,),

          CustomButton(
            onTap: (){}, 
            text: AppStrings.signIn
          ),

          const SizedBox(height: AppSizes.spaceBetweenSections,),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: AppSizes.xs,
            children: <Widget>[
              Text(
                AppStrings.alreadyHaveAcc,
                style: context.txtTheme.labelLarge
              ),
              GestureDetector(
                onTap: () => Get.offAllNamed(AppRoutes.signInRoute),
                child: Text(
                  AppStrings.signIn,
                  style: context.txtTheme.labelLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.textBlackColor,
                    decoration: TextDecoration.underline,
                    decorationColor: AppColors.blackColor,
                    decorationThickness: AppSizes.dividerHeight
                  ),
                ),
              )
            ],
          ),
          
        ],
      ),
    );
  }
}