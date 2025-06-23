import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/config/app_sizes.dart';
import 'package:alora/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CrewShimmer extends StatelessWidget {
  const CrewShimmer({
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
        return Container(
          alignment: Alignment.center,
          width: context.screenWidth,
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.md, vertical: AppSizes.md),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSizes.borderRadiusMd),
            border: Border.all(
                width: .5,
                color: AppColors.dividerColor,
            ),
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
              
              // Main Info
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Image Placeholder
                  ClipRRect(
                    borderRadius: BorderRadius.circular(AppSizes.borderRadiusMd),
                    child: Shimmer.fromColors(
                      baseColor: AppColors.greyColor.withValues(alpha: .3),
                      highlightColor: AppColors.greyColor.withValues(alpha: 0.1),
                      child: Container(
                        width: 60,
                        height: 60,
                        color: AppColors.greyColor,
                      ),
                    ),
                  ),

                  const SizedBox(width: AppSizes.sm),

                  // Text Placeholder
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _shimmerLine(100, 18),
                      const SizedBox(height: AppSizes.xs),
                      _shimmerLine(80, 14),
                    ],
                  ),
                ],
              ),

              // "Details" Placeholder
              Positioned(
                bottom: 10,
                right: 10,
                child: Shimmer.fromColors(
                  baseColor: AppColors.greyColor.withValues(alpha: 0.3),
                  highlightColor: AppColors.greyColor.withValues(alpha: 0.1),
                  child: _shimmerLine(60, 14),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Widget _shimmerLine(double width, double height) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: AppColors.greyColor,
        borderRadius: BorderRadius.circular(AppSizes.borderRadiusSm),
      ),
    );
  }
}