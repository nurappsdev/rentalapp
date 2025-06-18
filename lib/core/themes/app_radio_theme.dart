import 'package:alora/core/config/app_colors.dart';
import 'package:flutter/material.dart';

class AppRadioTheme{
  AppRadioTheme._();
  static const RadioThemeData radioThemeLight = RadioThemeData(
    fillColor: WidgetStatePropertyAll<Color>(AppColors.primaryColor),
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap
  );

  static const RadioThemeData radioThemeDark = RadioThemeData(
    fillColor: WidgetStatePropertyAll<Color>(AppColors.primaryColor),
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap
  );

}