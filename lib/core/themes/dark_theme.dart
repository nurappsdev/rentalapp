import 'package:flutter/material.dart';
import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/themes/app_check_box_theme.dart';
import 'package:alora/core/themes/app_text_theme.dart';

/// [DarkTheme] change the color from light to dark if needed
class DarkTheme{
  DarkTheme._();
  static final ThemeData darkTheme = ThemeData(
    fontFamily: "RedHatDisplay",
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor).copyWith( brightness: Brightness.dark),
    brightness: Brightness.dark,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.backgroundColor,
    textTheme: AppTextTheme.darkTextTheme,
    checkboxTheme: AppCheckBoxTheme.darkCheckBoxTheme
  );
}
