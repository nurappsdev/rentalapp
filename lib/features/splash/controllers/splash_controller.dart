import 'package:alora/core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashController extends GetxController with GetSingleTickerProviderStateMixin {
  
  late AnimationController animationController;
  late Animation<double> radiusAnimation;
  final RxBool startReveal = false.obs;


  
  /// [onInit] Lifecycle method called when the controller is initialized.
  ///
  /// Resets loading states, clears existing data, and triggers and more..
  /// initial fetch
  /// 
  @override
  void onInit() {
    super.onInit();
    startReveal.value = false;
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    radiusAnimation = Tween<double>(begin: 0, end: 1000).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeInOutCubic),
    );

    // Delay 2 seconds before reveal
    Future<void>.delayed(const Duration(seconds: 2), () {
      startReveal.value = true;
      animationController.forward();

      animationController.addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed) {
          Get.offAllNamed(AppRoutes.onboardingRoute);
        }
      });
    });
  }


  /// [dispose] Lifecycle method called when the controller is destroyed.
  ///
  /// Cleans up by resetting loading states and clearing lists and more...
  @override
  void dispose() {
    animationController.dispose();
    startReveal.value = false;
    super.dispose();
  }
}
