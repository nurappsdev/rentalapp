import 'package:flutter/material.dart';
import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/themes/app_check_box_theme.dart';
import 'package:alora/core/themes/app_text_theme.dart';

class LightTheme{
  LightTheme._();
  static final ThemeData lightTheme = ThemeData(
    fontFamily: "RedHatDisplay",
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor).copyWith( brightness: Brightness.light),
    brightness: Brightness.light,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.backgroundColor,
    dividerColor: AppColors.dividerColor,
    textTheme: AppTextTheme.lightTextTheme,
    checkboxTheme: AppCheckBoxTheme.lightCheckBoxTheme
  );
}
