import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/config/app_sizes.dart';
import 'package:alora/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class EventShimmer extends StatelessWidget {
  const EventShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 6,
      separatorBuilder: (_, _) => const SizedBox(height: AppSizes.spaceBetweenItems,),
      itemBuilder: (_, int index){
        return Shimmer.fromColors(
          baseColor: AppColors.greyColor.withValues(alpha: 0.3),
          highlightColor: AppColors.greyColor.withValues(alpha: 0.1),
          child: Container(
            alignment: Alignment.center,
            width: context.screenWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSizes.borderRadiusMd),
              border: Border.all(
                width: AppSizes.dividerHeight,
                color: AppColors.dividerColor,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Image placeholder
                ClipRRect(
                  borderRadius:
                      BorderRadius.circular(AppSizes.borderRadiusMd),
                  child: Container(
                    width: context.screenWidth,
                    height: 170.0,
                    color: AppColors.greyColor,
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Container(
                              height: 40.0,
                              width: 40.0,
                              decoration: const BoxDecoration(
                                color: AppColors.greyColor,
                                shape: BoxShape.circle
                              ),
                            ),
                        
                            const SizedBox(width: AppSizes.md),
                        
                            // Title placeholder
                            Container(
                              height: 40.0,
                              width: 40.0,
                              decoration: const BoxDecoration(
                                color: AppColors.greyColor,
                                shape: BoxShape.circle
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: AppSizes.spaceBetweenItems),

                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: AppSizes.md),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // Date placeholder
                      Container(
                        height: 16.0,
                        width: context.screenWidth * 0.3,
                        color: AppColors.greyColor,
                      ),

                      const SizedBox(height: AppSizes.sm),

                      // Title placeholder
                      Container(
                        height: 18.0,
                        width: context.screenWidth * 0.5,
                        color: AppColors.greyColor,
                      ),

                      const SizedBox(height: AppSizes.sm),

                      // Description placeholder
                      Container(
                        height: 14.0,
                        width: context.screenWidth * 0.7,
                        color: AppColors.greyColor,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: AppSizes.spaceBetweenSections),
              ],
            ),
          ),
        );
      },
    );
  }
}