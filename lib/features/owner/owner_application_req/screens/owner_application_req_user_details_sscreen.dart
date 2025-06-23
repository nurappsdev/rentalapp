import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/config/app_icons.dart';
import 'package:alora/core/config/app_sizes.dart';
import 'package:alora/core/config/app_strings.dart';
import 'package:alora/core/extensions/context_extensions.dart';
import 'package:alora/core/extensions/date_time_extensions.dart';
import 'package:alora/core/extensions/widget_extensions.dart';
import 'package:alora/core/widgets/custom_app_bar.dart';
import 'package:alora/core/widgets/custom_button.dart';
import 'package:alora/core/widgets/custom_network_image.dart';
import 'package:alora/shared/models/maintenance_model.dart';
import 'package:alora/shared/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../controllers/owner_application_req_controller.dart';

class OwnerApplicationReqUserDetailsscreen extends GetView<OwnerApplicationReqController> {
  const OwnerApplicationReqUserDetailsscreen({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: AppStrings.userDetails,
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

              Card(
                color: AppColors.whiteColor,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(AppSizes.md),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppSizes.borderRadiusMd),
                    border: Border.all(
                      color: AppColors.greyColor,
                      width: AppSizes.dividerHeight
                    )
                  ),
                  child: userdetails(context, UserModel(name: "Alax tom", profileImage: MaintenanceModel.userImage, phoneNumber: "1345743456", email: "support@gmail.com", address: "Dhaka Bd")),
                ),
              ),

              const SizedBox(height: AppSizes.spaceBetweenSections,),

              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Income Tax Doc",
                    style: context.txtTheme.bodyLarge,
                  ),

                  const SizedBox(height: AppSizes.sm,),

                  Container(
                    alignment: Alignment.center,
                    width: context.screenWidth,
                    height: 200.0,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor.withValues(alpha: .3),
                      borderRadius: BorderRadius.circular(AppSizes.borderRadiusMd)
                    ),
                  ),
                ],
              ),

              const SizedBox(height: AppSizes.spaceBetweenSections,),

              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Id Card (Front Side)",
                    style: context.txtTheme.bodyLarge,
                  ),

                  const SizedBox(height: AppSizes.sm,),

                  Container(
                    alignment: Alignment.center,
                    width: context.screenWidth,
                    height: 200.0,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor.withValues(alpha: .3),
                      borderRadius: BorderRadius.circular(AppSizes.borderRadiusMd)
                    ),
                  ),
                ],
              ),

              const SizedBox(height: AppSizes.spaceBetweenSections,),

              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Id Card (Back Side)",
                    style: context.txtTheme.bodyLarge,
                  ),

                  const SizedBox(height: AppSizes.sm,),

                  Container(
                    alignment: Alignment.center,
                    width: context.screenWidth,
                    height: 200.0,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor.withValues(alpha: .3),
                      borderRadius: BorderRadius.circular(AppSizes.borderRadiusMd)
                    ),
                  ),
                ],
              ),

              const SizedBox(height: AppSizes.spaceBetweenSections,),

              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Credit Application Doc",
                    style: context.txtTheme.bodyLarge,
                  ),

                  const SizedBox(height: AppSizes.sm,),

                  Container(
                    alignment: Alignment.center,
                    width: context.screenWidth,
                    height: 200.0,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor.withValues(alpha: .3),
                      borderRadius: BorderRadius.circular(AppSizes.borderRadiusMd)
                    ),
                  ),
                ],
              ),

              


              const SizedBox(height: AppSizes.spaceBetweenSections,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                spacing: AppSizes.md,
                children: <Widget>[
                  Expanded(
                    child: CustomButton(
                      onTap: () => Get.back(), 
                      isOutline: true,
                      text: AppStrings.deny
                    ),
                  ),

                  Expanded(
                    child: CustomButton(
                      onTap: () => Get.back(), 
                      text: AppStrings.accept
                    ),
                  )
                ],
              ),


              const SizedBox(height: AppSizes.spaceBetweenSections,),
            ],
          ),
        ),
      ),
    );
  }

  Column userdetails(BuildContext context, UserModel user) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            CustomNetworkImage(
              imageUrl: user.profileImage, 
              height: 30.0, 
              width: 30.0
            ),
            const SizedBox(width: AppSizes.md,),

            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  AppStrings.name,
                  style: context.txtTheme.labelMedium,
                ),
            
                const SizedBox(height: AppSizes.xs,),
            
                Text(
                  user.name,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: context.txtTheme.bodyMedium,
                )
              ],
            ),
          ],
        ),

        const SizedBox(height: AppSizes.spaceBetweenItems,),

        Row(
          children: <Widget>[
            SvgPicture.asset(
              AppIcons.emailPrefixIcon,
              width: 20.0,
              height: 20.0,
            ),
            const SizedBox(width: AppSizes.md,),

            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  AppStrings.email,
                  style: context.txtTheme.labelMedium,
                ),
            
                const SizedBox(height: AppSizes.xs,),
            
                Text(
                  user.email,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: context.txtTheme.bodyMedium,
                )
              ],
            ),
          ],
        ),

        const SizedBox(height: AppSizes.spaceBetweenItems,),

        Row(
          children: <Widget>[
            SvgPicture.asset(
              AppIcons.phonePrefixIcon,
              width: 24.0,
              height: 24.0,
            ),
            const SizedBox(width: AppSizes.md,),

            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  AppStrings.phoneNo,
                  style: context.txtTheme.labelMedium,
                ),
            
                const SizedBox(height: AppSizes.xs,),
            
                Text(
                  user.phoneNumber,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: context.txtTheme.bodyMedium,
                )
              ],
            ),
          ],
        ),
        const SizedBox(height: AppSizes.spaceBetweenItems,),

        Row(
          children: <Widget>[
            SvgPicture.asset(
              AppIcons.dateIcon,
              width: 24.0,
              height: 24.0,
            ),
            const SizedBox(width: AppSizes.md,),

            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  AppStrings.expectedMovingDate,
                  style: context.txtTheme.labelMedium,
                ),
            
                const SizedBox(height: AppSizes.xs,),
            
                Text(
                  DateTime.now().formattedDate,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: context.txtTheme.bodyMedium,
                )
              ],
            ),
          ],
        ),

      ],
    );
  }
}
