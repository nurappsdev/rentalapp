import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/config/app_sizes.dart';
import 'package:alora/core/config/app_strings.dart';
import 'package:alora/core/extensions/context_extensions.dart';
import 'package:alora/core/extensions/date_time_extensions.dart';
import 'package:alora/core/extensions/widget_extensions.dart';
import 'package:alora/core/routes/app_routes.dart';
import 'package:alora/core/widgets/custom_network_image.dart';
import 'package:alora/features/crew/maintenance/controllers/maintenance_controller.dart';
import 'package:alora/features/renter/renter_maintenance/controllers/renter_maintenance_controller.dart';
import 'package:alora/features/renter/renter_maintenance/model/renter_maintenance_model.dart';
import 'package:alora/shared/widgets/empty_maintenance.dart';
import 'package:alora/shared/widgets/maintenance_card.dart';
import 'package:alora/shared/widgets/maintenance_shimmer.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visibility_detector/visibility_detector.dart';

class RequestCard extends StatelessWidget {
  final RenterMaintenanceModel maintenance;
  final RenterMaintenanceController controller;
  final bool isPast;
  final int index;

  const RequestCard({
    super.key,
    required this.maintenance,
    required this.controller,
    required this.isPast,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
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
            header1(context, maintenance),

            const SizedBox(height: AppSizes.spaceBetweenItems,),

            const Divider(
              thickness: AppSizes.dividerThick,
            ),

            // description layout
            Text(
              AppStrings.description,
              style: context.txtTheme.bodyLarge,
            ),
        
            const SizedBox(height: AppSizes.xs,),
        
            Text(
              maintenance.description,
              style: context.txtTheme.bodySmall,
            ),

            const SizedBox(height: AppSizes.spaceBetweenItems,),


            // issue image layout
            Text(
              AppStrings.issueImage,
              style: context.txtTheme.bodyLarge,
            ),
        
            const SizedBox(height: AppSizes.xs,),


            SizedBox(
              height: 100.0,
              child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: maintenance.issueImages.length,
                itemBuilder: (_, int index){
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(AppSizes.borderRadiusMd),
                    child: CustomNetworkImage(
                      imageUrl: maintenance.issueImages[index],
                      width: 100.0,
                      height: double.infinity,
                      boxShape: BoxShape.rectangle,
                    ),
                  );
                },
                separatorBuilder: (_,_) => const SizedBox(width: AppSizes.md,),
              ),
            ),
            const SizedBox(height: AppSizes.spaceBetweenItems,),
            // issue video layout
            Text(
              AppStrings.issueVideo,
              style: context.txtTheme.bodyLarge,
            ),
        
            const SizedBox(height: AppSizes.xs,),
        
            Obx(() {
              if (isPast ? controller.pastMaintenanceList.isEmpty : controller.openMaintenanceList.isEmpty) {
                return const SizedBox.shrink();
              }
              return SizedBox(
                height: 150.0,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: isPast ? controller.pastMaintenanceList.length : controller.openMaintenanceList.length,
                  itemBuilder: (BuildContext context, int i) {
                    final VideoItemModel? item;
                    if(isPast){
                      item = controller.pastRequestVideoItems[index]?[i];
                    }
                    else{
                      item = controller.openRequestVideoItems[index]?[i];
                    }                
                    return VisibilityDetector(
                      key: Key('video_$index$i]'),
                      onVisibilityChanged: (VisibilityInfo info) {
                        if (info.visibleFraction > 0.5) {
                          controller.playOnly(index, i, isPast);
                        }
                      },
                      child: Container(
                        width: context.screenWidth * .8,
                        margin: const EdgeInsets.only(right: AppSizes.sm),
                        height: 150.0,
                        decoration: BoxDecoration(
                          color: AppColors.greyColor,
                          borderRadius: BorderRadius.circular(AppSizes.borderRadiusMd)
                        ),
                        child: (item != null && item.initialized == true)
                            ? AspectRatio(
                              aspectRatio: item.chewieController.videoPlayerController.value.aspectRatio,
                              child: Chewie(controller: item.chewieController),
                            )
                            : const Center(child: CircularProgressIndicator()),
                      ),
                    );
                  },
                ),
              );
            }),

            const SizedBox(height: AppSizes.spaceBetweenItems,),
          ],
        ),
      ),
    );
  }
  Row header1(BuildContext context, RenterMaintenanceModel maintenance) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                AppStrings.apartmentRoomNo,
                style: context.txtTheme.labelSmall,
              ),
          
              const SizedBox(height: AppSizes.xs,),
          
              Text(
                maintenance.apartmentRoomNumber,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: context.txtTheme.bodySmall,
              )
            ],
          ),
        ),

        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                AppStrings.issueDate,
                style: context.txtTheme.labelSmall,
              ),
          
              const SizedBox(height: AppSizes.xs,),
              
              Text(
                maintenance.issueDate.formattedDate,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: context.txtTheme.bodySmall,
              )
            ],
          ),
        )
      ],
    );
  }
}