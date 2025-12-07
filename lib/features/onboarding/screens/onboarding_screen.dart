import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/config/app_images.dart';
import 'package:alora/core/config/app_sizes.dart';
import 'package:alora/core/config/app_strings.dart';
import 'package:alora/core/extensions/context_extensions.dart';
import 'package:alora/core/extensions/widget_extensions.dart';
import 'package:alora/core/routes/app_routes.dart';
import 'package:alora/core/widgets/custom_app_background.dart';
import 'package:alora/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/onboarding_controller.dart';

class OnboardingScreen extends GetView<OnboardingController> {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppBackground(
      backgroundImage: AppImages.onboardingBackground,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: context.screenHeight * .4),
              const OnboardingCard(),
              const SizedBox(height: AppSizes.spaceBetweenSections),
            ],
          ),
        ),
      ),
    );
  }
}

class OnboardingCard extends StatelessWidget {
  const OnboardingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(AppSizes.md),
      padding: const EdgeInsets.all(AppSizes.md),
      decoration: BoxDecoration(
        color: AppColors.blue50.withValues(alpha: .8),
        borderRadius: BorderRadius.circular(AppSizes.borderRadiusXxxL),
        border: Border.all(color: AppColors.whiteColor, width: AppSizes.dividerThick),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Image.asset(AppImages.appLogo, width: 110).centered,

          const SizedBox(height: AppSizes.spaceBetweenSections),

          Text(
            AppStrings.onboardingCardTitle,
            textAlign: TextAlign.center,
            style: context.txtTheme.headlineMedium,
          ),

          const SizedBox(height: AppSizes.spaceBetweenSections),

          SizedBox(
            width: context.screenWidth * .7,
            child: Text(
              AppStrings.onboardingCardSubTitle,
              textAlign: TextAlign.center,
              style: context.txtTheme.labelLarge,
            ),
          ),

          const SizedBox(height: AppSizes.spaceBetweenSections),

          CustomButton(
            onTap: Get.find<OnboardingController>().handleGetStartedBefore,
            text: AppStrings.getStarted,
          ),

          const SizedBox(height: AppSizes.spaceBetweenItems),
        ],
      ),
    );
  }
}
