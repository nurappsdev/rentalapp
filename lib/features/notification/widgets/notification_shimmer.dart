import 'package:alora/core/config/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class NotificationShimmer extends StatelessWidget {
  const NotificationShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 10,
      itemBuilder: (_, _){
        return Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Simulate the rounded icon background
              Container(
                height: 48.0,
                width: 48.0,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),

              const SizedBox(width: AppSizes.sm),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 14.0,
                      width: double.infinity,
                      color: Colors.white,
                    ),
                    const SizedBox(height: AppSizes.sm),

                    Container(
                      height: 12.0,
                      width: MediaQuery.of(context).size.width * 0.6,
                      color: Colors.white,
                    ),
                    const SizedBox(height: AppSizes.sm),

                    Container(
                      height: 10.0,
                      width: 100.0,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (_, int index){
        return Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Column(
            children: <Widget>[
              const SizedBox(height: AppSizes.sm,),
              if((index + 1) != 10) ...<Widget>[
                const Divider(
                  thickness: .5,
                ),
                const SizedBox(height: AppSizes.sm,),
              ]
            ],
          ),
        );
      },
    );
  }
}
