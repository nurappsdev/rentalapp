import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/routes/app_navigation.dart';
import 'core/di/app_bindings.dart';
import 'core/routes/app_routes.dart';
import 'core/storage/secure_storage_service.dart';
import 'core/themes/theme.dart';
import 'core/themes/theme_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put<ThemeManager>(ThemeManager(SecureStorageService()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Alora Rental Application',
      theme: AppTheme.getTheme(ThemeMode.light),
      darkTheme: AppTheme.getTheme(ThemeMode.dark),
      themeMode: Get.find<ThemeManager>().currentThemeMode,
      initialRoute: AppRoutes.homeRenterRoute,
      getPages: AppNavigation.routes,
      initialBinding: AppBindings(),
      builder: (BuildContext context, Widget? child) {
        return child == null
            ? const Scaffold(body: Center(child: Text("Something Wrong")))
            : SafeArea(top: false, child: child);
      },
    );
  }
}
