import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:alora/core/config/app_sizes.dart';

class ApartmentDetailsShimmer extends StatelessWidget {
  const ApartmentDetailsShimmer({super.key});

  Widget get _line => Container(
        height: 12,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Card image
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          const SizedBox(height: 16),

          // Title line
          Container(height: 20, width: 150, color: Colors.white),
          const SizedBox(height: 8),

          // Description lines
          _line,
          const SizedBox(height: 4),
          _line,
          const SizedBox(height: 4),
          _line,
          const SizedBox(height: 16),

          // Horizontal image shimmer
          SizedBox(
            height: 100,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (_, __) => Container(
                width: 100,
                height: 100,
                color: Colors.white,
              ),
              separatorBuilder: (_, __) => const SizedBox(width: 12),
            ),
          ),
          const SizedBox(height: 16),

          // Chip shimmer
          Wrap(
            spacing: 8,
            children: List<Container>.generate(4, (_) {
              return Container(
                width: 100,
                height: 40,
                margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
              );
            }),
          ),
          const SizedBox(height: 24),

          // TextField and dropdown shimmer
          Column(
            children: List<Column>.generate(3, (_) {
              return Column(
                children: <Widget>[
                  Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              );
            }),
          ),

          // Bottom Button
          Container(
            height: 48,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
          )
        ],
      ),
    );
  }
}