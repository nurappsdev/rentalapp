import 'package:flutter/material.dart';
import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/config/app_sizes.dart';

class AppTextTheme{
  AppTextTheme._();
  static const TextTheme lightTextTheme = TextTheme(

    // display text theme
    displayLarge: TextStyle(fontSize: AppSizes.fontSizeL, fontWeight: FontWeight.bold, color: AppColors.textBlackColor),
    displayMedium: TextStyle(fontSize: AppSizes.fontSizeXxxL, fontWeight: FontWeight.w600, color: AppColors.textBlackColor),
    displaySmall:  TextStyle(fontSize: AppSizes.fontSizeXxl, fontWeight: FontWeight.w600, color: AppColors.textBlackColor),

    // headline text theme
    headlineLarge: TextStyle(fontSize: AppSizes.fontSizeXxxL, fontWeight: FontWeight.w700, color: AppColors.textBlackColor),
    headlineMedium: TextStyle(fontSize: AppSizes.fontSizeXxl, fontWeight: FontWeight.w700, color: AppColors.textBlackColor),
    headlineSmall: TextStyle(fontSize: AppSizes.fontSizeXl, fontWeight: FontWeight.w700, color: AppColors.textBlackColor),

    // title text theme
    titleLarge: TextStyle(fontSize: AppSizes.fontSizeLg, fontWeight: FontWeight.w700, color: AppColors.textBlackColor),
    titleMedium: TextStyle(fontSize: AppSizes.fontSizeMd, fontWeight: FontWeight.w700, color: AppColors.textBlackColor),
    titleSmall: TextStyle(fontSize: AppSizes.fontSizeSm, fontWeight: FontWeight.w400, color: AppColors.textBlackColor),

    // body text theme
    bodyLarge: TextStyle(fontSize: AppSizes.fontSizeMd, fontWeight: FontWeight.w500, color: AppColors.textBlackColor),
    bodyMedium: TextStyle(fontSize: AppSizes.fontSizeSm, fontWeight: FontWeight.w500, color: AppColors.textBlackColor),
    bodySmall: TextStyle(fontSize: AppSizes.fontSizeXs, fontWeight: FontWeight.w500, color: AppColors.greyColor),

    // label text theme
    labelLarge: TextStyle(fontSize: AppSizes.fontSizeSm, fontWeight: FontWeight.w400, color: AppColors.textBlackColor),
    labelMedium: TextStyle(fontSize: AppSizes.fontSizeXs, fontWeight: FontWeight.w400, color: AppColors.textBlackColor),
    labelSmall: TextStyle(fontSize: AppSizes.fontSizeXxs, fontWeight: FontWeight.w400, color: AppColors.textBlackColor),

  );

  static const TextTheme darkTextTheme = TextTheme(

    // display text theme
    displayLarge: TextStyle(fontSize: AppSizes.fontSizeL, fontWeight: FontWeight.bold, color: AppColors.textBlackColor),
    displayMedium: TextStyle(fontSize: AppSizes.fontSizeXxxL, fontWeight: FontWeight.w600, color: AppColors.textBlackColor),
    displaySmall:  TextStyle(fontSize: AppSizes.fontSizeXxl, fontWeight: FontWeight.w600, color: AppColors.textBlackColor),

    // headline text theme
    headlineLarge: TextStyle(fontSize: AppSizes.fontSizeXxxL, fontWeight: FontWeight.w700, color: AppColors.textBlackColor),
    headlineMedium: TextStyle(fontSize: AppSizes.fontSizeXxl, fontWeight: FontWeight.w700, color: AppColors.textBlackColor),
    headlineSmall: TextStyle(fontSize: AppSizes.fontSizeXl, fontWeight: FontWeight.w700, color: AppColors.textBlackColor),

    // title text theme
    titleLarge: TextStyle(fontSize: AppSizes.fontSizeLg, fontWeight: FontWeight.w700, color: AppColors.textBlackColor),
    titleMedium: TextStyle(fontSize: AppSizes.fontSizeMd, fontWeight: FontWeight.w700, color: AppColors.textBlackColor),
    titleSmall: TextStyle(fontSize: AppSizes.fontSizeSm, fontWeight: FontWeight.w400, color: AppColors.textBlackColor),

    // body text theme
    bodyLarge: TextStyle(fontSize: AppSizes.fontSizeMd, fontWeight: FontWeight.w500, color: AppColors.textBlackColor),
    bodyMedium: TextStyle(fontSize: AppSizes.fontSizeSm, fontWeight: FontWeight.w500, color: AppColors.textBlackColor),
    bodySmall: TextStyle(fontSize: AppSizes.fontSizeXs, fontWeight: FontWeight.w500, color: AppColors.greyColor),

    // label text theme
    labelLarge: TextStyle(fontSize: AppSizes.fontSizeSm, fontWeight: FontWeight.w400, color: AppColors.textBlackColor),
    labelMedium: TextStyle(fontSize: AppSizes.fontSizeXs, fontWeight: FontWeight.w400, color: AppColors.textBlackColor),
    labelSmall: TextStyle(fontSize: AppSizes.fontSizeXxs, fontWeight: FontWeight.w400, color: AppColors.textBlackColor),
  );
}

