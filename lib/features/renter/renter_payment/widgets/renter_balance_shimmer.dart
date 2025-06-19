import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/config/app_sizes.dart';

class RenterBalanceShimmer extends StatelessWidget {
  const RenterBalanceShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.greyColor.withValues(alpha: 0.2),
      highlightColor: AppColors.greyColor.withValues(alpha: 0.1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // status container
          Container(
            padding: const EdgeInsets.symmetric(horizontal: AppSizes.md, vertical: AppSizes.sm),
            decoration: BoxDecoration(
              color: AppColors.greyColor.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(AppSizes.borderRadiusSm),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _shimmerBox(height: 16, width: 80),
                _shimmerBox(height: 16, width: 100),
              ],
            ),
          ),

          const SizedBox(height: AppSizes.spaceBetweenItems),

          // multiple shimmer rows (for bills)
          for (int i = 0; i < 6; i++) ...<Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _shimmerBox(height: 16, width: 160),
                _shimmerBox(height: 16, width: 40),
              ],
            ),
            const SizedBox(height: AppSizes.sm),
            const Divider(thickness: 0.5, color: AppColors.dividerColor),
            const SizedBox(height: AppSizes.sm),
          ],

          const SizedBox(height: AppSizes.spaceBetweenSections),

          // total due
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              _shimmerBox(height: 20, width: 100),
              const SizedBox(width: 8),
              _shimmerBox(height: 20, width: 60),
            ],
          ),

          const SizedBox(height: AppSizes.spaceBetweenItems),

          // shimmer transaction card or buttons
          Container(
            padding: const EdgeInsets.all(AppSizes.md),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(AppSizes.borderRadiusMd),
              border: Border.all(color: AppColors.dividerColor, width: AppSizes.dividerHeight),
            ),
            child: Row(
              children: <Widget>[
                _shimmerBox(height: 32, width: 32), // icon
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _shimmerBox(height: 16, width: 100),
                      const SizedBox(height: 4),
                      _shimmerBox(height: 14, width: 150),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: AppSizes.spaceBetweenSections),
        ],
      ),
    );
  }

  Widget _shimmerBox({required double height, required double width}) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6.0),
      ),
    );
  }
}
