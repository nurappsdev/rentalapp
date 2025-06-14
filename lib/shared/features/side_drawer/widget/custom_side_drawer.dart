import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/config/app_icons.dart';
import 'package:alora/core/config/app_sizes.dart';
import 'package:alora/core/config/app_strings.dart';
import 'package:alora/core/enums/role_type.dart';
import 'package:alora/core/routes/app_routes.dart';
import 'package:alora/core/utils/custom_bottom_sheet.dart';
import 'package:alora/core/utils/custom_loader.dart';
import 'package:alora/core/widgets/custom_button.dart';
import 'package:alora/core/widgets/custom_rounded_inner_icon.dart';
import 'package:alora/core/widgets/rounded_profile_card.dart';
import 'package:alora/shared/features/side_drawer/controllers/custom_side_drawer_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CustomSideDrawer extends StatelessWidget {
  const CustomSideDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final CustomSideDrawerController controller = Get.put(CustomSideDrawerController());
    return Drawer(
      backgroundColor: AppColors.surfaceColor,
      child: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSizes.screenHorizontal),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                
                // header section
                const SizedBox(height: AppSizes.spaceBetweenSections,),
                Obx(
                  () => RoundedProfileImage(
                    imageUrl: controller.user.value?.profileImage,
                    height: 100.0,
                    width: 100.0,
                    borderWidth: AppSizes.dividerThick,
                    borderColor: AppColors.primaryColor,
                  ),
                ),
                  
                const SizedBox(height: AppSizes.md,),
                  
                Obx(
                  () => Text(
                    controller.user.value?.name ?? "Unknown",
                    style: context.textTheme.titleMedium,
                  ),
                ),
                  
                const SizedBox(height: AppSizes.xs,),
                  
                Text(
                  AppStrings.viewProfile,
                  style: context.textTheme.labelMedium?.copyWith(
                    color: AppColors.textPrimaryColor,
                    decoration: TextDecoration.underline,
                    decorationColor: AppColors.primaryColor
                  ),
                ),

                const SizedBox(height: AppSizes.spaceBetweenSections,),

                const Divider(
                  thickness: AppSizes.dividerHeight,
                ),
                
                const SizedBox(height: AppSizes.sm,),
                
                // items section
                Obx((){
                  if(controller.isRoleLoading.value){
                    return const CustomLoading(size: 28,);
                  }
                  else{
                    if(controller.isRoleTypeMatch(RoleType.crew).value){
                      return Column(
                        children: <Widget>[
                           ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: const CustomRoundedInnerIcon(
                              icon: AppIcons.maintenanceIcon,
                              containerSize: 32.0,
                              bgColor: AppColors.primaryColor,
                              iconColor: AppColors.whiteColor,
                            ),
                            title: Text(
                              AppStrings.myMaintenance,
                              style: context.textTheme.bodyMedium,
                            ),
                          ),

                          ListTile(
                            onTap: () => Get.toNamed(AppRoutes.contactUsRoute),
                            contentPadding: EdgeInsets.zero,
                            leading: const CustomRoundedInnerIcon(
                              icon: AppIcons.contactUsIcon,
                              containerSize: 32.0,
                              bgColor: AppColors.primaryColor,
                              iconColor: AppColors.whiteColor,
                            ),
                            title: Text(
                              AppStrings.contactUs,
                              style: context.textTheme.bodyMedium,
                            ),
                          ),
                        ],
                      );
                    }
                    else if(controller.isRoleTypeMatch(RoleType.rentar).value){
                       return Text(
                        "Nothing Implemanted for rentar",
                        style: context.textTheme.titleMedium,
                      );
                    }
                    else if(controller.isRoleTypeMatch(RoleType.owner).value){
                       return Text(
                        "Nothing Implemanted for owner",
                        style: context.textTheme.titleMedium,
                      );
                    }
                    else{
                      return Text(
                        "Something is Wrong!",
                        style: context.textTheme.titleMedium,
                      );
                    }
                  }
                }),



                ListTile(
                  onTap: () => Get.toNamed(AppRoutes.settingRoute),
                  contentPadding: EdgeInsets.zero,
                  leading: const CustomRoundedInnerIcon(
                    icon: AppIcons.settingsIcon,
                    containerSize: 32.0,
                    bgColor: AppColors.primaryColor,
                    iconColor: AppColors.whiteColor,
                  ),
                  title: Text(
                    AppStrings.setting,
                    style: context.textTheme.bodyMedium,
                  ),
                ),


                const Divider(
                  thickness: AppSizes.dividerHeight,
                ),
            
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const CustomRoundedInnerIcon(
                    icon: AppIcons.logoutIcon,
                    containerSize: 32.0,
                    bgColor: AppColors.primaryColor,
                    iconColor: AppColors.whiteColor,
                  ),
                  title: Text(
                    AppStrings.logout,
                    style: context.textTheme.bodyMedium,
                  ),
                  onTap: (){
                    CustomBottomSheet.showCustomBottomSheet(
                      context: context, 
                      child: LogoutBottomSheet(controller: controller,)
                    );
                  },
                ),
            
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LogoutBottomSheet extends StatelessWidget {
  final CustomSideDrawerController controller;
  const LogoutBottomSheet({
    super.key,
    required this.controller
  });


  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SvgPicture.asset(AppIcons.logoutBottomSheetIcon),

            const SizedBox(height: AppSizes.spaceBetweenItems),

            Text(
              AppStrings.logoutBottmSheetTitle,
              style: context.textTheme.bodyLarge,
            ),

            const SizedBox(height: AppSizes.sm),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                AppStrings.logoutBottmSheetSubTitle, 
                style: context.textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
            ),

            const SizedBox(height: AppSizes.spaceBetweenSections),
            Row(
              spacing: AppSizes.sm,
              children: <Widget>[
                Expanded(
                  child: CustomButton(
                    onTap: () => Get.back(), 
                    text: AppStrings.no,
                    isOutline: true,
                  ),
                ),
                Expanded(
                  child: Obx(
                    () => CustomButton(
                      loading: controller.isLogoutLoading.value,
                      onTap: controller.handleLogout, 
                      text: AppStrings.yes
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
    );
  }
}