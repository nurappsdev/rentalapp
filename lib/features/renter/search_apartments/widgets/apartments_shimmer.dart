import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/config/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ApartmentsShimmer extends StatelessWidget {
  const ApartmentsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 6,
      separatorBuilder: (_, _) => const SizedBox(height: AppSizes.spaceBetweenItems,),
      itemBuilder: (_, _) {
        return Card(
          color: AppColors.whiteColor,
          elevation: 2.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.borderRadiusXxxL),
          ),
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Image placeholder
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(AppSizes.borderRadiusXxxL),
                    topRight: Radius.circular(AppSizes.borderRadiusXxxL),
                  ),
                  child: Container(
                    height: 200.0,
                    width: double.infinity,
                    color: Colors.white,
                  ),
                ),
          
                const SizedBox(height: AppSizes.md),
          
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppSizes.md),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // Title placeholder
                      Container(
                        height: 15.0,
                        width: 160.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(AppSizes.borderRadiusMd),
                        ),
                      ),
          
                      const SizedBox(height: AppSizes.md),
          
                      // Apartment name placeholder
                      Container(
                        height: 14.0,
                        width: 120.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(AppSizes.borderRadiusMd),
                        ),
                      ),
          
                      const SizedBox(height: AppSizes.md),
          
                      // Location placeholder
                      Container(
                        height: 14.0,
                        width: 140.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(AppSizes.borderRadiusMd),
                        ),
                      ),
                    ],
                  ),
                ),
          
                const SizedBox(height: AppSizes.md),
              ],
            ),
          ),
        );
      },
    );
  }
}