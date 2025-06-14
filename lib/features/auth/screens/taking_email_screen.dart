import 'package:alora/core/config/app_images.dart';
import 'package:alora/core/widgets/custom_app_background.dart';
import 'package:alora/features/auth/controllers/taking_email_controller.dart';
import 'package:alora/features/auth/widgets/email_taking_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TakingEmailScreen extends GetView<TakingEmailController> {
  const TakingEmailScreen({super.key});

 @override
  Widget build(BuildContext context) {
    return CustomAppBackground(
      backgroundImage: AppImages.authBackground,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        bottomNavigationBar: EmailTakingCard(takingEmailController: controller)),
    );
  }
}