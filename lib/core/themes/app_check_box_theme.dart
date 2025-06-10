import 'package:flutter/material.dart';
import 'package:alora/core/config/app_colors.dart';

class AppCheckBoxTheme{
  AppCheckBoxTheme._();

  static CheckboxThemeData lightCheckBoxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(
        side: const BorderSide(
           color: AppColors.primaryColor,
        ),
        borderRadius: BorderRadius.circular(4)
    ),
    checkColor: WidgetStateProperty.resolveWith((Set<WidgetState> states) {
      if(states.contains(WidgetState.selected)) {
        return AppColors.whiteColor;
      } else {
        return AppColors.primaryColor;
      }
    }),
    fillColor: WidgetStateProperty.resolveWith((Set<WidgetState> states) {
      if(states.contains(WidgetState.selected)) {
        return AppColors.primaryColor;
      } else {
        return Colors.transparent;
      }
    }),
  );

  static CheckboxThemeData darkCheckBoxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(
        side: const BorderSide(
          color: AppColors.primaryColor,
        ),
        borderRadius: BorderRadius.circular(4)
    ),
    checkColor: WidgetStateProperty.resolveWith((Set<WidgetState> states) {
      if(states.contains(WidgetState.selected)) {
        return AppColors.whiteColor;
      } else {
        return AppColors.primaryColor;
      }
    }),
    fillColor: WidgetStateProperty.resolveWith((Set<WidgetState> states) {
      if(states.contains(WidgetState.selected)) {
        return AppColors.primaryColor;
      } else {
        return Colors.transparent;
      }
    }),
  );
}