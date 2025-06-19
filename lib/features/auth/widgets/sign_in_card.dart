import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/config/app_icons.dart';
import 'package:alora/core/config/app_sizes.dart';
import 'package:alora/core/config/app_strings.dart';
import 'package:alora/core/enums/role_type.dart';
import 'package:alora/core/extensions/context_extensions.dart';
import 'package:alora/core/routes/app_routes.dart';
import 'package:alora/core/widgets/custom_button.dart';
import 'package:alora/core/widgets/custom_text_field.dart';
import 'package:alora/core/widgets/row_end_text.dart';
import 'package:alora/features/auth/controllers/sign_in_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SignInCard extends StatelessWidget {
  final SignInController signInController;
  const SignInCard({
    super.key,
    required this.signInController
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
            AppStrings.signInTitle,
            style: context.txtTheme.headlineSmall,
          ),

          const SizedBox(height: AppSizes.sm,),

          Text(
            AppStrings.signInSubTitle,
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

          RowEndText(
            onPress: () => Get.toNamed(AppRoutes.takingEmailRoute),
            label: AppStrings.forgotPasswordQuestion
          ),

          const SizedBox(height: AppSizes.spaceBetweenSections,),

          Obx(
            ()=> CustomButton(
              loading: signInController.isLoading.value,
              onTap: signInController.handleSignIn, 
              text: AppStrings.signIn
            ),
          ),

          const SizedBox(height: AppSizes.spaceBetweenSections,),

          Obx(
            (){
              if(signInController.roleType.value == RoleType.crew){
                return const SizedBox.shrink();
              }
              return Row(
                mainAxisAlignment: MainAxisAlignment.start,
                spacing: AppSizes.xs,
                children: <Widget>[
                  Text(
                    AppStrings.doNotHaveAcc,
                    style: context.txtTheme.labelLarge
                  ),
                  GestureDetector(
                    onTap: () => Get.offAllNamed(AppRoutes.signUpRoute),
                    child: Text(
                      AppStrings.signUp,
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
              );
            } ,
          ),
          
        ],
      ),
    );
  }
}