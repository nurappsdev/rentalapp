import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/config/app_icons.dart';
import 'package:alora/core/config/app_sizes.dart';
import 'package:alora/core/config/app_strings.dart';
import 'package:alora/core/extensions/context_extensions.dart';
import 'package:alora/core/routes/app_routes.dart';
import 'package:alora/core/widgets/custom_button.dart';
import 'package:alora/core/widgets/custom_pin_code_text_field.dart';
import 'package:alora/features/auth/controllers/verify_email_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class VerifyEmailCard extends StatelessWidget {
  final VerifyEmailController verifyEmailController;

  const VerifyEmailCard({
    super.key,
    required this.verifyEmailController
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
            AppStrings.verifyEmailTitle,
            style: context.txtTheme.headlineSmall,
          ),

          const SizedBox(height: AppSizes.sm,),

          Text(
            AppStrings.verifyEmailSubTitle,
            style: context.txtTheme.bodySmall,
          ),

          const SizedBox(height: AppSizes.lg,),

          // form fields

          CustomPinCodeTextField(
            textEditingController: TextEditingController(),
          ),

          const SizedBox(height: AppSizes.spaceBetweenItems,),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: AppSizes.xs,
            children: <Widget>[
              SvgPicture.asset(
                AppIcons.clockIcon
              ),

              Obx(() {
                final int minutes = verifyEmailController.secondsRemaining.value ~/ 60;
                final int seconds = verifyEmailController.secondsRemaining.value % 60;
                return Center(
                  child: Text(
                    "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}",
                     style: context.txtTheme.bodyLarge,
                  ),
                );
              }),
            ],
          ),

          const SizedBox(height: AppSizes.spaceBetweenItems,),

          CustomButton(
            onTap: () => Get.toNamed(AppRoutes.resetPasswordRoute), 
            text: AppStrings.verifyEmail
          ),

          const SizedBox(height: AppSizes.spaceBetweenSections,),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: AppSizes.xs,
            children: <Widget>[
              Text(
                AppStrings.didNotRecieveCode,
                style: context.txtTheme.labelLarge
              ),
              GestureDetector(
                onTap: (){
                  if(verifyEmailController.secondsRemaining.value <= 0){
                    verifyEmailController.secondsRemaining.value = 25;
                    verifyEmailController.startCountdown();
                  }
                },
                child: Text(
                  AppStrings.resendCode,
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
          )
        ],
      ),
    );
  }
}