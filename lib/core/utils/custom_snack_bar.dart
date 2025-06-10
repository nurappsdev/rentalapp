import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alora/core/config/app_sizes.dart';
part 'package:alora/core/enums/snack_bar_type.dart';

/// A utility class to show customized snack bars using GetX.
///
/// The snack bar can be styled as success, error, warning, or info with icons,
/// colors, and positions preconfigured.
///
/// Example usage:
/// ```dart
/// CustomSnackBar.show(
///   message: 'Profile updated successfully',
///   type: SnackBarType.success,
/// );
/// ```
class CustomSnackBar {
  /// Private constructor to prevent instantiation.
  CustomSnackBar._();

  /// Displays a customized snack bar.
  ///
  /// [message] is the content of the snack bar.
  /// [snackPosition] determines where the snack bar appears on screen.
  /// [type] defines the style (success, error, warning, info).
  /// [duration] controls how long the snack bar remains visible.
  static void show({
    required String message,
    SnackPosition snackPosition = SnackPosition.TOP,
    SnackBarType type = SnackBarType.info,
    Duration duration = const Duration(seconds: 2),
  }) {
    final Color bgColor;
    final IconData icon;
    final String title;

    switch (type) {
      case SnackBarType.success:
        bgColor = Colors.green;
        icon = Icons.check_circle;
        title = "Success";
        break;
      case SnackBarType.error:
        bgColor = Colors.red;
        icon = Icons.error;
        title = "Error";
        break;
      case SnackBarType.warning:
        bgColor = Colors.orange;
        icon = Icons.warning;
        title = "Warning";
        break;
      case SnackBarType.info:
        bgColor = Colors.blue;
        icon = Icons.info;
        title = "Info";
        break;
    }

    Get.snackbar(
      title,
      message,
      snackPosition: snackPosition,
      backgroundColor: bgColor,
      colorText: Colors.white,
      borderRadius: AppSizes.borderRadiusLg,
      padding: const EdgeInsets.symmetric(
        vertical: AppSizes.lg,
        horizontal: AppSizes.xl,
      ),
      icon: Icon(icon, color: Colors.white),
      duration: duration,
      isDismissible: true,
      snackStyle: SnackStyle.FLOATING,
      overlayBlur: 12.0,
      overlayColor: bgColor.withValues(alpha: 0.1),
    );
  }
}
