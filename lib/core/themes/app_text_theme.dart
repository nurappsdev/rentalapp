import 'package:flutter/material.dart';
import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/config/app_sizes.dart';

class AppTextTheme{
  AppTextTheme._();
  static const TextTheme lightTextTheme = TextTheme(

    // display text theme
    displayLarge: TextStyle(fontSize: AppSizes.fontSizeL, fontWeight: FontWeight.bold, color: AppColors.textWhiteColor),
    displayMedium: TextStyle(fontSize: AppSizes.fontSizeXxxL, fontWeight: FontWeight.w600, color: AppColors.textWhiteColor),
    displaySmall:  TextStyle(fontSize: AppSizes.fontSizeXxl, fontWeight: FontWeight.w600, color: AppColors.textWhiteColor),

    // headline text theme
    headlineLarge: TextStyle(fontSize: AppSizes.fontSizeL, fontWeight: FontWeight.w500, color: AppColors.textWhiteColor),
    headlineMedium: TextStyle(fontSize: AppSizes.fontSizeXxl, fontWeight: FontWeight.w700, color: AppColors.textWhiteColor),
    headlineSmall: TextStyle(fontSize: AppSizes.fontSizeXl, fontWeight: FontWeight.w600, color: AppColors.textWhiteColor),

    // title text theme
    titleLarge: TextStyle(fontSize: AppSizes.fontSizeLg, fontWeight: FontWeight.w600, color: AppColors.textWhiteColor),
    titleMedium: TextStyle(fontSize: AppSizes.fontSizeMd, fontWeight: FontWeight.w500, color: AppColors.textWhiteColor),
    titleSmall: TextStyle(fontSize: AppSizes.fontSizeSm, fontWeight: FontWeight.w400, color: AppColors.textWhiteColor),

    // body text theme
    bodyLarge: TextStyle(fontSize: AppSizes.fontSizeLg, fontWeight: FontWeight.w600, color: AppColors.textWhiteColor),
    bodyMedium: TextStyle(fontSize: AppSizes.fontSizeMd, fontWeight: FontWeight.w400, color: AppColors.textWhiteColor),
    bodySmall: TextStyle(fontSize: AppSizes.fontSizeSm, fontWeight: FontWeight.w400, color: AppColors.greyColor),

    // label text theme
    labelLarge: TextStyle(fontSize: AppSizes.fontSizeSm, fontWeight: FontWeight.w500, color: AppColors.textWhiteColor),
    labelMedium: TextStyle(fontSize: AppSizes.fontSizeXs, fontWeight: FontWeight.w400, color: AppColors.textWhiteColor),
    labelSmall: TextStyle(fontSize: AppSizes.fontSizeXxs, fontWeight: FontWeight.w400, color: AppColors.textWhiteColor),

  );

  static const TextTheme darkTextTheme = TextTheme(

    // display text theme
    displayLarge: TextStyle(fontSize: AppSizes.fontSizeL, fontWeight: FontWeight.bold, color: AppColors.textWhiteColor),
    displayMedium: TextStyle(fontSize: AppSizes.fontSizeXxxL, fontWeight: FontWeight.w600, color: AppColors.textWhiteColor),
    displaySmall:  TextStyle(fontSize: AppSizes.fontSizeXxl, fontWeight: FontWeight.w600, color: AppColors.textWhiteColor),

    // headline text theme
    headlineLarge: TextStyle(fontSize: AppSizes.fontSizeL, fontWeight: FontWeight.w500, color: AppColors.textWhiteColor),
    headlineMedium: TextStyle(fontSize: AppSizes.fontSizeXxl, fontWeight: FontWeight.w700, color: AppColors.textWhiteColor),
    headlineSmall: TextStyle(fontSize: AppSizes.fontSizeXl, fontWeight: FontWeight.w600, color: AppColors.textWhiteColor),

    // title text theme
    titleLarge: TextStyle(fontSize: AppSizes.fontSizeLg, fontWeight: FontWeight.w600, color: AppColors.textWhiteColor),
    titleMedium: TextStyle(fontSize: AppSizes.fontSizeMd, fontWeight: FontWeight.w500, color: AppColors.textWhiteColor),
    titleSmall: TextStyle(fontSize: AppSizes.fontSizeSm, fontWeight: FontWeight.w400, color: AppColors.textWhiteColor),

    // body text theme
    bodyLarge: TextStyle(fontSize: AppSizes.fontSizeLg, fontWeight: FontWeight.w600, color: AppColors.textWhiteColor),
    bodyMedium: TextStyle(fontSize: AppSizes.fontSizeMd, fontWeight: FontWeight.w400, color: AppColors.textWhiteColor),
    bodySmall: TextStyle(fontSize: AppSizes.fontSizeSm, fontWeight: FontWeight.w400, color: AppColors.greyColor),

    // label text theme
    labelLarge: TextStyle(fontSize: AppSizes.fontSizeSm, fontWeight: FontWeight.w500, color: AppColors.textWhiteColor),
    labelMedium: TextStyle(fontSize: AppSizes.fontSizeXs, fontWeight: FontWeight.w400, color: AppColors.textWhiteColor),
    labelSmall: TextStyle(fontSize: AppSizes.fontSizeXxs, fontWeight: FontWeight.w400, color: AppColors.textWhiteColor),
  );
}

