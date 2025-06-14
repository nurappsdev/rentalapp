import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:alora/core/config/app_sizes.dart';

class MaintenanceDetailsShimmer extends StatelessWidget {
  const MaintenanceDetailsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: AppSizes.spaceBetweenItems),

            // Large rectangular placeholder (for image)
            Container(
              width: double.infinity,
              height: 180,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(AppSizes.borderRadiusMd),
              ),
            ),

            const SizedBox(height: AppSizes.spaceBetweenItems),

            // Two lines simulating apartment name and location
            Container(
              height: 20,
              width: 150,
              color: Colors.white,
            ),
            const SizedBox(height: AppSizes.xs),
            Container(
              height: 16,
              width: 120,
              color: Colors.white,
            ),

            const SizedBox(height: AppSizes.spaceBetweenItems),

            const Divider(thickness: AppSizes.dividerThick),

            const SizedBox(height: AppSizes.spaceBetweenItems),

            // Description title placeholder
            Container(
              height: 18,
              width: 100,
              color: Colors.white,
            ),
            const SizedBox(height: AppSizes.xs),

            // Description text lines
            Container(height: 14, width: double.infinity, color: Colors.white),
            const SizedBox(height: 6),
            Container(height: 14, width: double.infinity, color: Colors.white),
            const SizedBox(height: 6),
            Container(height: 14, width: MediaQuery.of(context).size.width * 0.7, color: Colors.white),

            const SizedBox(height: AppSizes.spaceBetweenItems),

            // Issue images title placeholder
            Container(
              height: 18,
              width: 120,
              color: Colors.white,
            ),
            const SizedBox(height: AppSizes.xs),

            // Horizontal list of square shimmer blocks for images
            SizedBox(
              height: 100,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                separatorBuilder: (_, __) => const SizedBox(width: AppSizes.md),
                itemBuilder: (_, __) => Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(AppSizes.borderRadiusMd),
                  ),
                ),
              ),
            ),

            const SizedBox(height: AppSizes.spaceBetweenItems),

            // Issue videos title placeholder
            Container(
              height: 18,
              width: 100,
              color: Colors.white,
            ),
            const SizedBox(height: AppSizes.xs),

            // Horizontal list of rectangles for video placeholders
            SizedBox(
              height: 150,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 2,
                separatorBuilder: (_, __) => const SizedBox(width: AppSizes.md),
                itemBuilder: (_, __) => Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(AppSizes.borderRadiusMd),
                  ),
                ),
              ),
            ),

            const SizedBox(height: AppSizes.spaceBetweenItems),

            const Divider(thickness: AppSizes.dividerThick),

            const SizedBox(height: AppSizes.spaceBetweenItems),

            // User details title placeholder
            Container(
              height: 22,
              width: 140,
              color: Colors.white,
            ),

            const SizedBox(height: AppSizes.spaceBetweenItems),

            // User info rows placeholders
            Row(
              children: <Widget>[
                // Profile image circle
                Container(
                  width: 32,
                  height: 32,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: AppSizes.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(height: 14, width: 80, color: Colors.white),
                      const SizedBox(height: AppSizes.xs),
                      Container(height: 12, width: double.infinity, color: Colors.white),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: AppSizes.spaceBetweenItems),

            // Email row placeholder
            Row(
              children: <Widget>[
                Container(
                  width: 24,
                  height: 24,
                  color: Colors.white,
                ),
                const SizedBox(width: AppSizes.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(height: 14, width: 80, color: Colors.white),
                      const SizedBox(height: AppSizes.xs),
                      Container(height: 12, width: double.infinity, color: Colors.white),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: AppSizes.spaceBetweenItems),

            // Phone row placeholder
            Row(
              children: <Widget>[
                Container(
                  width: 24,
                  height: 24,
                  color: Colors.white,
                ),
                const SizedBox(width: AppSizes.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(height: 14, width: 80, color: Colors.white),
                      const SizedBox(height: AppSizes.xs),
                      Container(height: 12, width: double.infinity, color: Colors.white),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: AppSizes.spaceBetweenSections),

            // Accept button placeholder
            Container(
              height: 48,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(AppSizes.borderRadiusMd),
              ),
            ),

            const SizedBox(height: AppSizes.spaceBetweenSections),
          ],
        ),
      ),
    );
  }
}
