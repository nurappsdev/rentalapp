import 'package:alora/core/config/app_images.dart';
import 'package:alora/core/widgets/custom_app_background.dart';
import 'package:alora/features/auth/controllers/reset_password_controller.dart';
import 'package:alora/features/auth/widgets/reset_password_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordScreen extends GetView<ResetPasswordController> {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppBackground(
      backgroundImage: AppImages.authBackground,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        bottomNavigationBar: ResetPasswordCard(resetPasswordController: controller)),
    );
  }
}


