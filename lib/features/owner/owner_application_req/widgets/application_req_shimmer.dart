import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/config/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ApplicationReqShimmer extends StatelessWidget {
  const ApplicationReqShimmer({super.key});

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
          child: Container(
            padding: const EdgeInsets.all(AppSizes.sm),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSizes.borderRadiusMd),
              border: Border.all(
                color: AppColors.greyColor,
                width: AppSizes.dividerHeight,
              ),
            ),
            child: Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 90.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(AppSizes.borderRadiusMd),
                    ),
                  ),

                  const Divider(thickness: AppSizes.dividerHeight),

                  const SizedBox(height: AppSizes.sm),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        height: 16.0,
                        width: 150.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(AppSizes.borderRadiusMd)
                        ),
                      ),

                      const SizedBox(height: AppSizes.sm),

                      Container(
                        height: 20.0,
                        width: 100.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: AppSizes.sm),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}