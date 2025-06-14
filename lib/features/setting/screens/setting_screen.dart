import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/config/app_icons.dart';
import 'package:alora/core/config/app_sizes.dart';
import 'package:alora/core/config/app_strings.dart';
import 'package:alora/core/enums/general_type.dart';
import 'package:alora/core/routes/app_routes.dart';
import 'package:alora/core/widgets/custom_app_bar.dart';
import 'package:alora/features/setting/controllers/setting_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SettingScreen extends GetView<SettingController> {
  const SettingScreen({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        showBackBtn: true,
        title: AppStrings.setting,
        backgroundColor: AppColors.whiteColor,
        elevation: 0.0,
      ),
      backgroundColor: AppColors.surfaceColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.screenHorizontal, vertical: AppSizes.spaceBetweenItems),
        child: ListView(
          children: <Container>[

            // privacy policy layout
            Container(
              margin: const EdgeInsets.only(bottom: AppSizes.md),
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.borderColor,
                ),
                borderRadius: BorderRadius.circular(AppSizes.borderRadiusLg)
              ),
              child: ListTile(
                onTap: () => Get.toNamed(AppRoutes.generalRoute, arguments: <String, GeneralType>{"generalType": GeneralType.privacyPolicy}),
                leading: SvgPicture.asset(AppIcons.privacyPolicyIcon),
                title: Text(
                  AppStrings.privacyPolicy,
                  style: context.textTheme.bodyLarge,
                ),
                trailing: SvgPicture.asset(AppIcons.nextIcon),
              ),
            ),

            // terms and condition layout
            Container(
              margin: const EdgeInsets.only(bottom: AppSizes.md),
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.borderColor,
                ),
                borderRadius: BorderRadius.circular(AppSizes.borderRadiusLg)
              ),
              child: ListTile(
                onTap: () => Get.toNamed(AppRoutes.generalRoute, arguments: <String, GeneralType>{"generalType": GeneralType.termsAndCondition}),
                leading: SvgPicture.asset(AppIcons.termsConditionIcon),
                title: Text(
                  AppStrings.termsAndConditions,
                  style: context.textTheme.bodyLarge,
                ),
                trailing: SvgPicture.asset(AppIcons.nextIcon),
              ),
            ),

            // about us layout
            Container(
              margin: const EdgeInsets.only(bottom: AppSizes.md),
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.borderColor,
                ),
                borderRadius: BorderRadius.circular(AppSizes.borderRadiusLg)
              ),
              child: ListTile(
                onTap: () => Get.toNamed(AppRoutes.generalRoute, arguments: <String, GeneralType>{"generalType": GeneralType.aboutUs}),
                leading: SvgPicture.asset(AppIcons.termsConditionIcon),
                title: Text(
                  AppStrings.aboutUs,
                  style: context.textTheme.bodyLarge,
                ),
                trailing: SvgPicture.asset(AppIcons.nextIcon),
              ),
            )
          ],
        ),
      ),
    );
  }
}
