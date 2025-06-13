import 'dart:ui';
import 'package:alora/core/config/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:alora/core/config/app_colors.dart';

class CustomRoundedInnerIcon extends StatelessWidget {
  const CustomRoundedInnerIcon({
    super.key,
    required this.icon,
    this.bgColor = Colors.transparent,
    this.borderColor = AppColors.primaryColor,
    this.iconColor = AppColors.primaryColor,
    this.isBorder = true,
    this.isBlur = false,
    this.boxShape = BoxShape.circle,
    this.iconSize = 16.0,
    this.containerSize = 24.0,
    this.onTap = _emptyCallback,
  });
  final Color bgColor;
  final Color iconColor;
  final double iconSize;
  final double containerSize;
  final Color borderColor;
  final bool isBorder;
  final bool isBlur;
  final String icon;
  final BoxShape boxShape;
  final VoidCallback onTap;
  static void _emptyCallback() {}

  @override
  Widget build(BuildContext context) {
    return !isBlur ? GestureDetector(
      onTap: onTap,
      child: Container(
          width: containerSize,
          height: containerSize,
          padding: const EdgeInsets.all(4.0),
          decoration: BoxDecoration(
            color: bgColor,
            shape: boxShape,
            border: isBorder ? Border.all(
              width: 1,
              color: borderColor,
            ) : null,
            borderRadius: BorderRadius.circular(AppSizes.sm)
          ),
          child: SvgPicture.asset(icon, width: iconSize, height: iconSize, colorFilter: ColorFilter.mode(iconColor, BlendMode.srcATop,))
      ),
    ) : GestureDetector(
      onTap: onTap,
      child: Container(
        width: containerSize,
        height: containerSize,
        decoration: BoxDecoration(
          shape: boxShape,
          border: isBorder
              ? Border.all(width: 1, color: borderColor)
              : null,
          borderRadius: BorderRadius.circular(AppSizes.sm)
        ),
        child: Stack(
          children: <Widget>[
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: bgColor.withValues(alpha: 0.2),
                  shape: boxShape,
                  border: isBorder
                      ? Border.all(width: 1, color: borderColor)
                      : null,
                  borderRadius: BorderRadius.circular(AppSizes.sm)
                ),
              ),
            ),
      
            Center(
              child: SvgPicture.asset(
                icon,
                width: iconSize,
                height: iconSize,
                colorFilter: ColorFilter.mode(iconColor, BlendMode.srcATop),
              ),
            ),
          ],
        ),
      ),
    );
  }
}