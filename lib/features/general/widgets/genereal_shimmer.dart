import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:alora/core/config/app_sizes.dart';

class GenerealShimmer extends StatelessWidget {
  const GenerealShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          Container(
            height: 12,
            width: 100,
            color: Colors.white,
          ),

          const SizedBox(height: AppSizes.xs,),
          
          Container(
            height: 12,
            width: 150,
            color: Colors.white,
          ),
          const SizedBox(height: AppSizes.spaceBetweenItems),

          Container(
            height: 14,
            width: double.infinity,
            color: Colors.white,
          ),
          const SizedBox(height: 6),
          Container(
            height: 14,
            width: double.infinity,
            color: Colors.white,
          ),
          const SizedBox(height: 6),
          Container(
            height: 14,
            width: double.infinity,
            color: Colors.white,
          ),
          const SizedBox(height: 6),
          Container(
            height: 14,
            width: double.infinity,
            color: Colors.white,
          ),
          const SizedBox(height: 6),
          Container(
            height: 14,
            width: double.infinity,
            color: Colors.white,
          ),
          const SizedBox(height: 6),
          Container(
            height: 14,
            width: double.infinity,
            color: Colors.white,
          ),
          const SizedBox(height: 6),
          Container(
            height: 14,
            width: double.infinity,
            color: Colors.white,
          ),
          const SizedBox(height: 6),
          Container(
            height: 14,
            width: double.infinity,
            color: Colors.white,
          ),
          const SizedBox(height: 6),
          Container(
            height: 14,
            width: double.infinity,
            color: Colors.white,
          ),
          const SizedBox(height: 6),
          Container(
            height: 14,
            width: double.infinity,
            color: Colors.white,
          ),
          const SizedBox(height: 6),
          Container(
            height: 14,
            width: MediaQuery.of(context).size.width * 0.8,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
