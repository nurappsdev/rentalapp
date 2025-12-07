import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/config/app_sizes.dart';
import 'package:alora/core/themes/app_text_theme.dart';
import 'package:flutter/material.dart';

class AppTabBarTheme {
  AppTabBarTheme._();

  static TabBarThemeData tabBarThemeLight = TabBarThemeData(
    labelColor: AppColors.textBlackColor,
    dividerHeight: 0.0,
    indicatorSize: TabBarIndicatorSize.tab,
    labelStyle: AppTextTheme.lightTextTheme.bodyMedium?.copyWith(color: AppColors.primaryColor),
    unselectedLabelStyle: AppTextTheme.lightTextTheme.bodyMedium,
    unselectedLabelColor: AppColors.textSecondaryColor,
    indicator: const UnderlineTabIndicator(
      borderSide: BorderSide(color: AppColors.primaryColor, width: AppSizes.xs),
    ),
  );

  static TabBarThemeData tabBarThemeDark = TabBarThemeData(
    labelColor: AppColors.textBlackColor,
    dividerHeight: 0.0,
    indicatorSize: TabBarIndicatorSize.tab,
    labelStyle: AppTextTheme.darkTextTheme.bodyMedium?.copyWith(color: AppColors.primaryColor),
    unselectedLabelStyle: AppTextTheme.darkTextTheme.bodyMedium,
    unselectedLabelColor: AppColors.textSecondaryColor,
    indicator: const UnderlineTabIndicator(
      borderSide: BorderSide(color: AppColors.primaryColor, width: AppSizes.xs),
    ),
  );
}
