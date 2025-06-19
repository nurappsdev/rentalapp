import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      this.color,
      this.textColor,
      this.textStyle,
      this.padding = EdgeInsets.zero,
      required this.onTap,
      required this.text,
      this.loading = false,
      this.width,
      this.fontSize,
      this.height,
      this.isOutline = false,
      this.borderColor,
      this.borderRadius,
      });

  final Function() onTap;
  final String text;
  final bool loading;
  final double? height;
  final double? width;
  final double? fontSize;
  final double? borderRadius;
  final Color? color;
  final Color? textColor;
  final EdgeInsetsGeometry padding;
  final TextStyle? textStyle;
  final bool isOutline;
  final Color? borderColor;


  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: padding,
        child: ElevatedButton(
          onPressed: loading ? () {} : onTap,
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                side: isOutline
                    ? BorderSide(color: borderColor ?? AppColors.primaryColor, width: 1.0, style: BorderStyle.solid,  strokeAlign: BorderSide.strokeAlignCenter)
                    : BorderSide.none,
                borderRadius: BorderRadius.circular(borderRadius ?? 12.0),
            ),
            backgroundColor: isOutline ? Colors.transparent : (color ?? AppColors.primaryColor),
            foregroundColor: isOutline ? (borderColor ?? Colors.transparent) : Colors.white,
            surfaceTintColor: Colors.transparent,
            shadowColor: Colors.transparent,

            minimumSize: Size(width ?? Get.width, height ?? 48.0),
          ),
          child: loading
              ? const SizedBox(
                  height: 20.0,
                  width: 20.0,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                )
              : Text(
                  text,
                  style: context.txtTheme.titleMedium?.copyWith(
                    color: isOutline ? (borderColor ?? AppColors.primaryColor) : (textColor ?? AppColors.textWhiteColor),
                ),
          ),
        ));
  }
}

