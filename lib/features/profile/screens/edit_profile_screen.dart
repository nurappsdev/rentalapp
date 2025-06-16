import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/config/app_sizes.dart';
import 'package:alora/core/config/app_strings.dart';
import 'package:alora/core/widgets/custom_app_bar.dart';
import 'package:alora/core/widgets/custom_button.dart';
import 'package:alora/features/profile/controllers/profile_controller.dart';
import 'package:alora/features/profile/widgets/edit_profile_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileScreen extends GetView<ProfileController> {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: const CustomAppBar(
        showBackBtn: true,
        title: AppStrings.editPersonalDetails,
        backgroundColor: AppColors.whiteColor,
        elevation: 0.0,
      ),
      backgroundColor: AppColors.surfaceColor,
      body: EditProfileCard(profileController: controller),
      bottomNavigationBar:  Container(
        padding: const EdgeInsets.all(AppSizes.screenHorizontal),
        margin: const EdgeInsets.all(AppSizes.sm),
        child: CustomButton(
          onTap: () => Get.back(), 
          text: AppStrings.updateProfile
        ),
      ),
    );
  }
}