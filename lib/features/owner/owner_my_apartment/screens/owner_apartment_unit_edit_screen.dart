import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/config/app_sizes.dart';
import 'package:alora/core/config/app_strings.dart';
import 'package:alora/core/extensions/context_extensions.dart';
import 'package:alora/core/widgets/custom_app_bar.dart';
import 'package:alora/core/widgets/custom_button.dart';
import 'package:alora/core/widgets/custom_text_field.dart';
import 'package:alora/shared/widgets/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/owner_my_apartment_controller.dart';

class OwnerApartmentUnitEditScreen extends GetView<OwnerMyApartmentController> {
  const OwnerApartmentUnitEditScreen({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: AppStrings.createAccount,
        showBackBtn: true,
        elevation: 0.0,
        backgroundColor: AppColors.whiteColor,
      ),
      backgroundColor: AppColors.surfaceColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.screenHorizontal),
          child: Column(
            children: <Widget>[
              const SizedBox(height: AppSizes.spaceBetweenItems,),
              Container(
                width: context.screenWidth,
                padding: const EdgeInsets.symmetric(horizontal: AppSizes.md),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: AppSizes.dividerThick,
                    color: AppColors.borderColor
                  ),
                  borderRadius: BorderRadius.circular(AppSizes.borderRadiusMd)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: AppSizes.spaceBetweenItems,),
                    Text(
                      "Unit Name",
                      style: context.txtTheme.titleMedium
                    ),
                    const SizedBox(height: AppSizes.md,),

                    CustomDropdown<String>(
                      options: const <String>["Studio", "Bed Room", "2 Bed Room", "Pent House"],
                      displayString: (String value) => value,
                    ),

                    const SizedBox(height: AppSizes.spaceBetweenItems,),

                    CustomButton(
                      onTap: () => Get.back(), 
                      text: AppStrings.update
                    ),
                    
                    const SizedBox(height: AppSizes.spaceBetweenItems,),
                  ],
                ),
              ),
              const SizedBox(height: AppSizes.spaceBetweenSections,),
            ],
          ),
        ),
      ),
    );
  }
}
