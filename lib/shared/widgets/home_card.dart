import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/config/app_icons.dart';
import 'package:alora/core/config/app_sizes.dart';
import 'package:alora/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class HomeCard extends StatelessWidget {
  final String text;
  final String svgAsset;
  final VoidCallback onTapCallback;

  const HomeCard({
    super.key,
    required this.text,
    required this.svgAsset,
    required this.onTapCallback,
    });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTapCallback,
      child: Card(
        color: AppColors.whiteColor,
        elevation: 2.0,
        child: Column(
          children: <Widget>[
            const SizedBox(height: AppSizes.spaceBetweenItems),
            Container(
              padding: const EdgeInsets.all(AppSizes.md),
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.primaryColor,
                  width: AppSizes.dividerHeight
                ),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30.0),
                  topLeft: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0),
                  topRight: Radius.circular(2.0)
                )
              ),
              child: SvgPicture.asset(
                svgAsset,
                width: 32.0,
                height: 32.0,
                colorFilter: const ColorFilter.mode(AppColors.primaryColor, BlendMode.srcATop),
              ),
            ),
      
            const Divider(
              thickness: AppSizes.dividerHeight,
              color: AppColors.dividerColor,
            ),
      
            const SizedBox(height: AppSizes.sm),
      
            Text(
              text,
              style: context.txtTheme.titleMedium
            ),
      
            const SizedBox(height: AppSizes.spaceBetweenItems),
          ],
        ),
      ),
    );
  }
}