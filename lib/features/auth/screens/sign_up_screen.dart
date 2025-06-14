import 'package:alora/core/config/app_images.dart';
import 'package:alora/core/widgets/custom_app_background.dart';
import 'package:alora/features/auth/controllers/sign_up_controller.dart';
import 'package:alora/features/auth/widgets/sign_up_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends GetView<SignUpController> {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppBackground(
      backgroundImage: AppImages.authBackground,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        bottomNavigationBar: SignUpCard(signUpController: controller)),
    );
  }
}


