import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:alora/core/config/app_sizes.dart';

class UserShimmer extends StatelessWidget {
  const UserShimmer({super.key});

  Widget buildRowShimmer({required double iconSize}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: iconSize,
          height: iconSize,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle
          ),
        ),
        const SizedBox(width: AppSizes.md),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 10,
                width: 60,
                color: Colors.white,
              ),
              const SizedBox(height: AppSizes.xs),
              Container(
                height: 14,
                width: double.infinity,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          buildRowShimmer(iconSize: 24.0), // Name
          const SizedBox(height: AppSizes.spaceBetweenItems),

          buildRowShimmer(iconSize: 20.0), // Email
          const SizedBox(height: AppSizes.spaceBetweenItems),

          buildRowShimmer(iconSize: 24.0), // Phone
          const SizedBox(height: AppSizes.spaceBetweenItems),

          buildRowShimmer(iconSize: 24.0), // Address
        ],
      ),
    );
  }
}
