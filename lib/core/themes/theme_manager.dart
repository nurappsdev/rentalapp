import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alora/core/config/app_constants.dart';
import 'package:alora/core/storage/secure_storage_service.dart';
import 'package:alora/core/utils/logger_utils.dart';

class ThemeManager extends GetxController {
  final SecureStorageService _storage;

  ThemeManager(this._storage);
  final Rx<ThemeMode> _themeMode = ThemeMode.system.obs;

  Brightness getBrightness(BuildContext context) {
    if (_themeMode.value == ThemeMode.system) {
      return MediaQuery.of(context).platformBrightness;
    }
    return _themeMode.value == ThemeMode.dark ? Brightness.dark : Brightness.light;
  }

  bool isDarkMode(BuildContext context) {
    return getBrightness(context) == Brightness.dark;
  }

  ThemeMode get currentThemeMode => _themeMode.value;

  @override
  void onInit() {
    super.onInit();
    _loadTheme();
  }

  void toggleTheme(ThemeMode mode) {
    _themeMode.value = mode;
    _saveTheme(mode);
    Get.changeThemeMode(mode);
  }

  Future<void> _loadTheme() async{
    debugPrint("Checking Storage...");
    final String? savedTheme = await _storage.read(AppConstants.themeMode);
    debugPrint("Loaded Theme from Storage: $savedTheme");
    if (savedTheme != null) {
      switch (savedTheme) {
        case AppConstants.lightMode:
          _themeMode.value = ThemeMode.light;
          break;
        case AppConstants.darkMode:
          _themeMode.value = ThemeMode.dark;
          break;
        default:
          _themeMode.value = ThemeMode.system;
      }
    } else {
      debugPrint("Theme is NULL. Defaulting to system.");
      _themeMode.value = ThemeMode.system;
    }
  }

  Future<void> _saveTheme(ThemeMode mode) async {
    String themeString =  AppConstants.systemMode;
    if (mode == ThemeMode.light) {
      themeString = AppConstants.lightMode;
    } else if (mode == ThemeMode.dark) {
      themeString = AppConstants.darkMode;
    }
    LoggerUtils.info("Stored Theme Mode: $themeString");
    await _storage.write(AppConstants.themeMode, themeString);
    LoggerUtils.info("Stored Theme Mode after same: ${await _storage.read(AppConstants.themeMode)}");
  }
}
