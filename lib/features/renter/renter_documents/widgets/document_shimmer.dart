import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/config/app_sizes.dart';
import 'package:alora/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DocumentShimmer extends StatelessWidget {
  const DocumentShimmer({
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
            height: 200.0,
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(AppSizes.borderRadiusMd),
            ),
            child: Container(
              width: 32.0,
              height: 32.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          ),
        );
      },
    );
  }
}