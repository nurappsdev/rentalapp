import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/config/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class RequestShimmer extends StatelessWidget {
  const RequestShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 6,
      separatorBuilder: (_, _) => const SizedBox(height: AppSizes.spaceBetweenItems,),
      itemBuilder: (_, int index){
        return Card(
          color: AppColors.whiteColor,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(AppSizes.md),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSizes.borderRadiusMd),
              border: Border.all(
                color: AppColors.greyColor,
                width: AppSizes.dividerHeight,
              ),
            ),
            child: Shimmer.fromColors(
              baseColor: AppColors.greyColor.withValues(alpha: 0.3),
              highlightColor: AppColors.greyColor.withValues(alpha: 0.1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Header rows
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      _shimmerBox(height: 12, width: 100),
                      _shimmerBox(height: 12, width: 80),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      _shimmerBox(height: 14, width: 100),
                      _shimmerBox(height: 14, width: 60),
                    ],
                  ),

                  const SizedBox(height: AppSizes.spaceBetweenItems),
                  const Divider(thickness: AppSizes.dividerThick),

                  _shimmerLabel("Description"),
                  const SizedBox(height: 4),
                  _shimmerBox(height: 14, width: double.infinity),
                  const SizedBox(height: 4),
                  _shimmerBox(height: 14, width: double.infinity),

                  const SizedBox(height: AppSizes.spaceBetweenItems),

                  _shimmerLabel("Issue Image"),
                  const SizedBox(height: 8),

                  SizedBox(
                    height: 100.0,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      separatorBuilder: (_, __) => const SizedBox(width: AppSizes.md),
                      itemBuilder: (_, __) => ClipRRect(
                        borderRadius: BorderRadius.circular(AppSizes.borderRadiusMd),
                        child: Container(
                          height: 100,
                          width: 100,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: AppSizes.spaceBetweenItems),

                  _shimmerLabel("Issue Video"),
                  const SizedBox(height: 8),

                  Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(AppSizes.borderRadiusMd),
                    ),
                  ),

                  const SizedBox(height: AppSizes.spaceBetweenItems),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _shimmerBox({required double height, required double width}) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }

  Widget _shimmerLabel(String label) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      height: 16,
      width: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}