import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/config/app_images.dart';
import 'package:alora/core/extensions/context_extensions.dart';
import 'package:alora/core/extensions/widget_extensions.dart';
import 'package:alora/features/splash/widgets/circle_reveal_clipper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/splash_controller.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surfaceColor,
      body: Stack(
        children: <Widget>[
          // centered app logo
          Image.asset(
            AppImages.appLogo, 
            width: context.screenWidth * .6
          ).centered,

          // radius or circular expand animation
          Obx(() {
            if (!controller.startReveal.value) {
              return const SizedBox.shrink();
            }

            return AnimatedBuilder(
              animation: controller.radiusAnimation,
              builder: (_, __) {
                return ClipPath(
                  clipper: CircleRevealClipper(
                    centerOffset: MediaQuery.of(context).size.center(Offset.zero),
                    radius: controller.radiusAnimation.value,
                  ),
                  child: Container(
                    color: AppColors.primaryColor,
                    child:  Image.asset(
                      AppImages.appLogo,
                      color: AppColors.whiteColor, 
                    ).centered,
                  ),
                );
              },
            );
          }),
        ],
      ),
    );
  }
}
