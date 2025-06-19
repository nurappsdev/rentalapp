import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/config/app_icons.dart';
import 'package:alora/core/config/app_sizes.dart';
import 'package:alora/core/config/app_strings.dart';
import 'package:alora/core/extensions/context_extensions.dart';
import 'package:alora/core/extensions/widget_extensions.dart';
import 'package:alora/core/widgets/custom_app_bar.dart';
import 'package:alora/core/widgets/custom_button.dart';
import 'package:alora/core/widgets/custom_network_image.dart';
import 'package:alora/core/widgets/profile_image.dart';
import 'package:alora/shared/models/maintenance_model.dart';
import 'package:alora/shared/widgets/empty_maintenance_details.dart';
import 'package:alora/shared/widgets/maintenance_details_shimmer.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../controllers/maintenance_details_controller.dart';

class MaintenanceDetailsScreen extends GetView<MaintenanceDetailsController> {
  const MaintenanceDetailsScreen({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    final dynamic arguments = Get.arguments;
    controller.updateMaintenanceId = arguments != null ? (arguments as Map<String, dynamic>)['maintenance_id'] : '';
    final String type = arguments != null ? (arguments as Map<String, dynamic>)['type'] ?? '' : '';

    return Scaffold(
      appBar: const CustomAppBar(
        showBackBtn: true,
        elevation: 0.0,
        title: AppStrings.maintenanceDetails,
      ),
      backgroundColor: AppColors.surfaceColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.screenHorizontal),
          child: Column(
            children: <Widget>[
              const SizedBox(height: AppSizes.spaceBetweenItems,),
              // notification list with handling loading and empty state
              
              Obx((){
                if(controller.maintenanceLoading.value){
                  return const MaintenanceDetailsShimmer();
                }
                else if(controller.maintenance.value == null){
                  return const EmptyMaintenanceDetails().centered;
                }
                final MaintenanceModel maintenance = controller.maintenance.value!;
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

                        header2(context, maintenance),

                        const SizedBox(height: AppSizes.spaceBetweenItems,),

                        const Divider(
                          thickness: AppSizes.dividerThick,
                        ),

                        // description layout
                        Text(
                          AppStrings.description,
                          style: context.textTheme.bodyLarge,
                        ),
                    
                        const SizedBox(height: AppSizes.xs,),
                    
                        Text(
                          maintenance.description,
                          style: context.textTheme.bodySmall,
                        ),

                        const SizedBox(height: AppSizes.spaceBetweenItems,),

                        // issue image layout
                        Text(
                          AppStrings.issueImage,
                          style: context.textTheme.bodyLarge,
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
                          style: context.textTheme.bodyLarge,
                        ),
                    
                        const SizedBox(height: AppSizes.xs,),
                    
                        Obx(() {
                          if (controller.videoItems.isEmpty) {
                            return const SizedBox.shrink();
                          }
                          return SizedBox(
                            height: 150.0,
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: controller.videoItems.length,
                              itemBuilder: (BuildContext context, int index) {
                                final VideoItemModel item = controller.videoItems[index];
                            
                                return VisibilityDetector(
                                  key: Key('video_$index'),
                                  onVisibilityChanged: (VisibilityInfo info) {
                                    if (info.visibleFraction > 0.5) {
                                      controller.playOnly(index);
                                    }
                                  },
                                  child: Container(
                                    width: context.screenWidth * .8,
                                    height: 150.0,
                                    decoration: BoxDecoration(
                                      color: AppColors.greyColor,
                                      borderRadius: BorderRadius.circular(AppSizes.borderRadiusMd)
                                    ),
                                    child: item.initialized
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

                        const Divider(
                          thickness: AppSizes.dividerThick,
                        ),

                        const SizedBox(height: AppSizes.spaceBetweenItems,),

                        // user details layout
                        userdetails(context, maintenance),

                        const SizedBox(height: AppSizes.spaceBetweenItems,),

                        const Divider(
                          thickness: AppSizes.dividerThick,
                        ),

                        const SizedBox(height: AppSizes.spaceBetweenItems,),

                         if(type == "maintenance") 
                          CustomButton(
                            onTap: () => Get.back(), 
                            text: AppStrings.accept
                          )
                        else if(type == "maintenance_recent")
                          CustomButton(
                            onTap: () => Get.back(), 
                            text: AppStrings.resolvingIssue
                          )
                        else if(type == "maintenance_resolved") ...<Widget>[
                          Text(
                            AppStrings.resolvingIssueDate,
                            style: context.textTheme.labelMedium?.copyWith(
                              color: AppColors.primaryColor
                            ),
                          ),
                          const SizedBox(height: AppSizes.sm,),
                          Text(
                            "Sat 12 April 2025  8.30 PM",
                            style: context.textTheme.labelLarge
                          ),
                        ],
                        const SizedBox(height: AppSizes.spaceBetweenItems,),
                      ],
                    ),
                  ),
                );
              }),

              const SizedBox(height: AppSizes.spaceBetweenSections,),
            ],
          ),
        ),
      ),
    );
  }

  Column userdetails(BuildContext context, MaintenanceModel maintenance) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          AppStrings.userDetails,
          style: context.textTheme.titleMedium,
        ),
        const SizedBox(height: AppSizes.spaceBetweenItems,),

        Row(
          children: <Widget>[
            ProfileImage(
              imageUrl: maintenance.userUserImage,
              width: 32.0,
              height: 32.0,
              borderWidth: AppSizes.dividerHeight,
              borderColor: AppColors.blackColor,
            ),
            const SizedBox(width: AppSizes.md,),

            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  AppStrings.name,
                  style: context.textTheme.labelSmall,
                ),
            
                const SizedBox(height: AppSizes.xs,),
            
                Text(
                  maintenance.userName,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: context.textTheme.bodySmall,
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
              width: 24.0,
              height: 24.0,
            ),
            const SizedBox(width: AppSizes.md,),

            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  AppStrings.email,
                  style: context.textTheme.labelSmall,
                ),
            
                const SizedBox(height: AppSizes.xs,),
            
                Text(
                  maintenance.userEmail,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: context.textTheme.bodySmall,
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
                  style: context.textTheme.labelSmall,
                ),
            
                const SizedBox(height: AppSizes.xs,),
            
                Text(
                  maintenance.userPhoneNumber,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: context.textTheme.bodySmall,
                )
              ],
            ),
          ],
        )

      ],
    );
  }

  Row header1(BuildContext context, MaintenanceModel maintenance) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                AppStrings.apartmentName,
                style: context.textTheme.labelSmall,
              ),
          
              const SizedBox(height: AppSizes.xs,),
          
              Text(
                maintenance.apartmentName,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: context.textTheme.bodySmall,
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
                AppStrings.location,
                style: context.textTheme.labelSmall,
              ),
          
              const SizedBox(height: AppSizes.xs,),
              
              Text(
                maintenance.apartmentLocation,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: context.textTheme.bodySmall,
              )
            ],
          ),
        )
      ],
    );
  }

  Row header2(BuildContext context, MaintenanceModel maintenance) {
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
                style: context.textTheme.labelSmall,
              ),
          
              const SizedBox(height: AppSizes.xs,),
          
              Text(
                "${maintenance.apartmentRoomNumber} (${maintenance.floor})",
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: context.textTheme.bodySmall,
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
                AppStrings.location,
                style: context.textTheme.labelSmall,
              ),
          
              const SizedBox(height: AppSizes.xs,),
              
              Text(
                maintenance.apartmentLocation,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: context.textTheme.bodySmall,
              )
            ],
          ),
        )
      ],
    );
  }
}
