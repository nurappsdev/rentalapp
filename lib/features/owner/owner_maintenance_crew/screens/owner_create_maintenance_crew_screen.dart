import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../controllers/owner_maintenance_crew_controller.dart';
import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/config/app_icons.dart';
import 'package:alora/core/config/app_sizes.dart';
import 'package:alora/core/config/app_strings.dart';
import 'package:alora/core/extensions/context_extensions.dart';
import 'package:alora/core/utils/date_picker_utils.dart';
import 'package:alora/core/utils/image_picker_utils.dart';
import 'package:alora/core/widgets/custom_app_bar.dart';
import 'package:alora/core/widgets/custom_button.dart';
import 'package:alora/core/widgets/custom_text_field.dart';

class OwnerCreateMaintenanceCrewScreen extends GetView<OwnerMaintenanceCrewController> {
  const OwnerCreateMaintenanceCrewScreen({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: AppStrings.createAccount,
        showBackBtn: true,
        elevation: 0.0,
        backgroundColor: AppColors.whiteColor,
      ),
      backgroundColor: AppColors.surfaceColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.screenHorizontal),
          child: Column(
            children: <Widget>[
              const SizedBox(height: AppSizes.spaceBetweenItems,),
              Container(
                width: context.screenWidth,
                padding: const EdgeInsets.symmetric(horizontal: AppSizes.md),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: AppSizes.dividerThick,
                    color: AppColors.borderColor
                  )
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: AppSizes.spaceBetweenItems,),
                    Text(
                      "Crew Name",
                      style: context.txtTheme.titleMedium
                    ),
                    const SizedBox(height: AppSizes.md,),

                    CustomTextField(
                      controller: TextEditingController(),
                      isBorder: true,
                      hintText: "Enter Username",
                      borderRadius: 12.0,
                      prefixIcon: SvgPicture.asset(AppIcons.userNamePrefixIcon),
                    ),


                    const SizedBox(height: AppSizes.spaceBetweenItems,),
                    Text(
                      "Email",
                      style: context.txtTheme.titleMedium
                    ),
                    const SizedBox(height: AppSizes.md,),

                    CustomTextField(
                      controller: TextEditingController(),
                      isBorder: true,
                      hintText: "Enter Email",
                      borderRadius: 12.0,
                      prefixIcon: SvgPicture.asset(AppIcons.emailPrefixIcon),
                    ),

                    const SizedBox(height: AppSizes.spaceBetweenItems,),
                    Text(
                      "Address",
                      style: context.txtTheme.titleMedium
                    ),
                    const SizedBox(height: AppSizes.md,),

                    CustomTextField(
                      controller: TextEditingController(),
                      isBorder: true,
                      hintText: "Enter Address",
                      borderRadius: 12.0,
                      prefixIcon: SvgPicture.asset(AppIcons.locationPrefixIcon),
                    ),

                    const SizedBox(height: AppSizes.spaceBetweenItems,),

                    Text(
                      "Password",
                      style: context.txtTheme.titleMedium
                    ),
                    const SizedBox(height: AppSizes.md,),

                    CustomTextField(
                      controller: TextEditingController(),
                      isBorder: true,
                      hintText: "Enter Password",
                      borderRadius: 12.0,
                      isPassword: true,
                      prefixIcon: SvgPicture.asset(AppIcons.lockIcon),
                    ),

                    const SizedBox(height: AppSizes.spaceBetweenItems,),

                    Text(
                      "Confirm Password",
                      style: context.txtTheme.titleMedium
                    ),
                    const SizedBox(height: AppSizes.md,),

                    CustomTextField(
                      controller: TextEditingController(),
                      isBorder: true,
                      hintText: "Enter Confirm Password",
                      borderRadius: 12.0,
                      isPassword: true,
                      prefixIcon: SvgPicture.asset(AppIcons.lockIcon),
                    ),

                    const SizedBox(height: AppSizes.spaceBetweenItems,),

                    CustomButton(
                      onTap: () => Get.back(), 
                      text: AppStrings.createAccount
                    ),
                    
                    const SizedBox(height: AppSizes.spaceBetweenItems,),
                  ],
                ),
              ),
              const SizedBox(height: AppSizes.spaceBetweenSections,),
            ],
          ),
        ),
      ),
    );
  }
}
