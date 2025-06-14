import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/config/app_icons.dart';
import 'package:alora/core/config/app_sizes.dart';
import 'package:alora/core/config/app_strings.dart';
import 'package:alora/core/extensions/widget_extensions.dart';
import 'package:alora/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import '../controllers/contact_us_controller.dart';

class ContactUsScreen extends GetView<ContactUsController> {
  const ContactUsScreen({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        showBackBtn: true,
        title: AppStrings.contactUs,
        backgroundColor: AppColors.whiteColor,
        elevation: 0.0,
      ),
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.screenHorizontal),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: AppSizes.spaceBetweenSections,),
              Container(
                padding: const EdgeInsets.all(28.0),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primaryColor
                ),
                child: SvgPicture.asset(
                  AppIcons.emailPrefixIcon,
                  width: 32.0,
                  height: 32.0,
                  colorFilter: const ColorFilter.mode(AppColors.whiteColor, BlendMode.srcATop),
                ),
              ).centered,
              
              const SizedBox(height: AppSizes.md,),
              
              Obx(
                () {
                  if(controller.isLoading.value){
                    return loader();
                  }
                  return Text(
                    controller.email.value ?? "Not Found",
                    style: context.textTheme.bodyLarge,
                  );
                },
              ),
              
              const SizedBox(height: AppSizes.spaceBetweenSections,),

              const Divider(
                thickness: AppSizes.dividerThick,
              ),

              const SizedBox(height: AppSizes.spaceBetweenSections,),

              Container(
                padding: const EdgeInsets.all(28.0),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primaryColor
                ),
                child: SvgPicture.asset(
                  AppIcons.phonePrefixIcon,
                  width: 32.0,
                  height: 32.0,
                  colorFilter: const ColorFilter.mode(AppColors.whiteColor, BlendMode.srcATop),
                ),
              ).centered,
              
              const SizedBox(height: AppSizes.md,),
              
              Obx(
                () {
                  if(controller.isLoading.value){
                    return loader();
                  }
                  return Text(
                    controller.phone.value ?? "Not Found",
                    style: context.textTheme.bodyLarge,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Shimmer loader() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        height: 15.0,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: AppSizes.screenHorizontal),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppSizes.borderRadiusMd),
        ),
      ),
    );
  }
}
