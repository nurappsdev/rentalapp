import 'package:alora/core/config/app_images.dart';
import 'package:alora/core/widgets/custom_app_background.dart';
import 'package:alora/features/auth/controllers/verify_email_controller.dart';
import 'package:alora/features/auth/widgets/verify_email_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends GetView<VerifyEmailController> {
  const VerifyEmailScreen({super.key});

 @override
  Widget build(BuildContext context) {
    return CustomAppBackground(
      backgroundImage: AppImages.authBackground,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        bottomNavigationBar: VerifyEmailCard(verifyEmailController: controller)),
    );
  }
}