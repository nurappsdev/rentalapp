import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/config/app_icons.dart';
import 'package:alora/core/config/app_images.dart';
import 'package:alora/core/config/app_sizes.dart';
import 'package:alora/core/config/app_strings.dart';
import 'package:alora/core/extensions/context_extensions.dart';
import 'package:alora/core/extensions/widget_extensions.dart';
import 'package:alora/core/routes/app_routes.dart';
import 'package:alora/core/widgets/custom_app_background.dart';
import 'package:alora/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../controllers/onboarding_controller.dart';

class OnboardingAfterLoginScreen extends GetView<OnboardingController> {
  const OnboardingAfterLoginScreen({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surfaceColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSizes.screenHorizontal),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: AppSizes.spaceBetweenSections,),
                SvgPicture.asset(
                  AppIcons.onbaordingIcon
                ).centered,
            
                const SizedBox(height: AppSizes.spaceBetweenSections,),
            
                Text(
                  AppStrings.onboardingAfterLoginDesc,
                  style: context.txtTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ).centered,
            
                const SizedBox(height: AppSizes.spaceBetweenSections,),
            
                Obx(
                  () => CustomButton(
                    loading: controller.isLoading.value,
                    onTap: controller.handleGetStarted, 
                    text: AppStrings.getStarted
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}