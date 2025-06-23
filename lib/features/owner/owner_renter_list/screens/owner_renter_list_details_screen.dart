import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/config/app_icons.dart';
import 'package:alora/core/config/app_sizes.dart';
import 'package:alora/core/config/app_strings.dart';
import 'package:alora/core/extensions/context_extensions.dart';
import 'package:alora/core/widgets/custom_app_bar.dart';
import 'package:alora/core/widgets/custom_network_image.dart';
import 'package:alora/features/owner/owner_maintenance_crew/models/maintenance_crew_model.dart';
import 'package:alora/shared/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../controllers/owner_renter_list_controller.dart';

class OwnerRenterListDetailsScreen extends GetView<OwnerRenterListController> {
  const OwnerRenterListDetailsScreen({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: AppStrings.renterDetails,
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      userdetails(context, UserModel(name: "Alax Tom", profileImage: MaintenanceCrewModel.userImage, phoneNumber: "2381912315", email: "support@gmail.com", address: "Dhaka")),
                    ],
                  ),
                ),
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
                  user.address,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: context.txtTheme.bodyMedium,
                )
              ],
            ),
          ],
        ),

        const SizedBox(height: AppSizes.spaceBetweenItems,),

      ],
    );
  }
}