import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/config/app_icons.dart';
import 'package:alora/core/config/app_sizes.dart';
import 'package:alora/core/config/app_strings.dart';
import 'package:alora/core/extensions/context_extensions.dart';
import 'package:alora/core/extensions/date_time_extensions.dart';
import 'package:alora/core/extensions/widget_extensions.dart';
import 'package:alora/core/routes/app_routes.dart';
import 'package:alora/core/utils/custom_bottom_sheet.dart';
import 'package:alora/core/widgets/custom_app_bar.dart';
import 'package:alora/core/widgets/custom_button.dart';
import 'package:alora/core/widgets/custom_network_image.dart';
import 'package:alora/core/widgets/custom_text_field.dart';
import 'package:alora/shared/widgets/delete_bottom_sheet.dart';
import '../models/maintenance_crew_model.dart';
import '../widgets/crew_info_shimmer.dart';
import '../widgets/empty_crew_info.dart';
import 'package:flutter_svg/svg.dart';
import '../controllers/owner_maintenance_crew_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OwnerMaintenanceCrewDetailsScreen extends GetView<OwnerMaintenanceCrewController> {
  const OwnerMaintenanceCrewDetailsScreen({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? arguments = Get.arguments;
    controller.updateCrewId = arguments?['id'];
    controller.hanldeRetriveSingleCrew();

    return Scaffold(
      appBar: const CustomAppBar(
        title: AppStrings.crewDetails,
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
                      Obx((){
                        if(controller.singleCrewLoading.value){
                          return const CrewInfoShimmer();
                        }
                        else if(controller.singleCrew.value == null){
                          return const EmptyCrewInfo().centered;
                        }
                        final MaintenanceCrewModel crew = controller.singleCrew.value!;
                        return userdetails(context, crew);
                      }),

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

  Column userdetails(BuildContext context, MaintenanceCrewModel crew) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            CustomNetworkImage(
              imageUrl: crew.image, 
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
                  crew.name,
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
                  crew.email,
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
                  crew.phone,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: context.txtTheme.bodyMedium,
                )
              ],
            ),
          ],
        ),

        const SizedBox(height: AppSizes.spaceBetweenItems,),

        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Last issue solving  date",
              style: context.txtTheme.labelMedium,
            ),
        
            const SizedBox(height: AppSizes.xs,),
        
            Text(
              crew.lastIssueResolvingDate.formattedDateTime12,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: context.txtTheme.bodyMedium,
            )
          ],
        ),

        const SizedBox(height: AppSizes.spaceBetweenItems,),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CustomButton(
              onTap: (){
                CustomBottomSheet.showCustomBottomSheet(
                  context: context, 
                  child: DeleteBottomSheet(
                    onDeleteCallBack: (){
                      Get.back();
                      Get.back();
                    }
                  ),
                );
              }, 
              isOutline: true,
              width: 100.0,
              text: AppStrings.deleteCrew
            ),
          ],
        ),

        const SizedBox(height: AppSizes.spaceBetweenItems,),

      ],
    );
  }
}
