import 'package:flutter/material.dart';
import 'package:alora/core/config/app_images.dart';
import 'package:alora/core/config/app_sizes.dart';

class CustomAppBackground extends StatelessWidget {
  final Widget child;
  final String backgroundImage;
  final bool isBorderRadius;

  const CustomAppBackground({
    super.key,
    required this.child,
    this.isBorderRadius = false,
    this.backgroundImage = AppImages.appBackground,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(backgroundImage),
          fit: BoxFit.cover,
        ),
        borderRadius: isBorderRadius ? const BorderRadius.only(
          topLeft: Radius.circular(AppSizes.borderRadiusXxl),
          topRight: Radius.circular(AppSizes.borderRadiusXxl),
        ) : null,
      ),
      child: child,
    );
  }
}
