import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/config/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SubscriptionShimmer extends StatelessWidget {
  const SubscriptionShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.0,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        separatorBuilder: (_, _) => const SizedBox(width: AppSizes.spaceBetweenItems,),
        itemBuilder: (_, _) {
          return Center(
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.topCenter,
              children: <Widget>[
                // Main card
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  padding: const EdgeInsets.all(AppSizes.md),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(AppSizes.borderRadiusXxl),
                    border: Border.all(color: AppColors.dividerColor, width: .5),
                  ),
                  child: SizedBox(
                    width: 150.0,
                    child: Shimmer.fromColors(
                      baseColor: AppColors.greyColor.withValues(alpha: 0.5),
                      highlightColor: AppColors.greyColor.withValues(alpha: 0.5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          _shimmerLine(width: 40, height: 24), // Duration Number
                          const SizedBox(height: AppSizes.spaceBetweenItems),
                          _shimmerLine(width: 60, height: 16), // Duration
                          const SizedBox(height: AppSizes.spaceBetweenItems),
                          _shimmerLine(width: 80, height: 12), // Unit Type
                          const SizedBox(height: AppSizes.spaceBetweenItems),
                          _shimmerLine(width: 60, height: 18), // Unit Name
                          const SizedBox(height: AppSizes.spaceBetweenItems),
                          _shimmerLine(width: 50, height: 24), // Price
                        ],
                      ),
                    ),
                  ),
                ),
                
                // Badge
                Positioned(
                  top: 0,
                  child: Shimmer.fromColors(
                    baseColor: AppColors.greyColor.withValues(alpha: 0.5),
                    highlightColor: AppColors.greyColor.withValues(alpha: 0.3),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: AppSizes.md, vertical: AppSizes.sm),
                      decoration: BoxDecoration(
                        color: AppColors.greyColor,
                        borderRadius: BorderRadius.circular(AppSizes.borderRadiusXxxL),
                      ),
                      child: _shimmerLine(width: 80, height: 16),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
   Widget _shimmerLine({required double width, required double height}) {
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