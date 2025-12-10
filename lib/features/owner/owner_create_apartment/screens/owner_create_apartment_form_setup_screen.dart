// ignore_for_file: deprecated_member_use

import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/config/app_icons.dart';
import 'package:alora/core/config/app_sizes.dart';
import 'package:alora/core/config/app_strings.dart';
import 'package:alora/core/extensions/context_extensions.dart';
import 'package:alora/core/extensions/list_extensions.dart';
import 'package:alora/core/extensions/widget_extensions.dart';
import 'package:alora/core/routes/app_routes.dart';
import 'package:alora/core/utils/custom_bottom_sheet.dart';
import 'package:alora/core/widgets/custom_app_bar.dart';
import 'package:alora/core/widgets/custom_button.dart';
import 'package:alora/core/widgets/custom_network_image.dart';
import 'package:alora/core/widgets/custom_rounded_inner_icon.dart';
import 'package:alora/core/widgets/custom_text_field.dart';
import 'package:alora/shared/models/maintenance_model.dart';
import 'package:alora/shared/widgets/custom_dropdown.dart';
import 'package:alora/shared/widgets/custom_file_upload_layout.dart';
import 'package:alora/shared/widgets/custom_multi_select_dropdown.dart';
import 'package:alora/shared/widgets/delete_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../controllers/owner_create_apartment_controller.dart';

class OwnerCreateApartmentFormSetupScreen extends GetView<OwnerCreateApartmentController> {
  const OwnerCreateApartmentFormSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: AppStrings.formInformationSetup,
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
              const SizedBox(height: AppSizes.spaceBetweenItems),
              Container(
                width: context.screenWidth,
                padding: const EdgeInsets.symmetric(horizontal: AppSizes.md),
                decoration: BoxDecoration(
                  border: Border.all(width: AppSizes.dividerThick, color: AppColors.borderColor),
                  borderRadius: BorderRadius.circular(AppSizes.borderRadiusMd),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: AppSizes.spaceBetweenItems),
                    Text("Set Application fee", style: context.txtTheme.titleMedium),
                    const SizedBox(height: AppSizes.sm),

                    CustomTextField(
                      controller: TextEditingController(),
                      isBorder: true,
                      hintText: "12.99",
                      borderRadius: 12.0,
                    ),

                    Text(
                      "Select accepted forms of proof of income",
                      style: context.txtTheme.titleMedium,
                    ),
                    const SizedBox(height: AppSizes.sm),

                    CustomDropdown<String>(
                      options: controller.propOfIncomesSet,
                      displayString: (String value) => value,
                      onChanged: (String value) {
                        controller.propOfIncomes.removeDuplicates();
                        controller.propOfIncomes.add(value);
                        controller.propOfIncomes.removeDuplicates();
                      },
                    ),

                    const SizedBox(height: AppSizes.spaceBetweenItems),

                    Obx(() {
                      if (controller.propOfIncomes.isEmpty) {
                        return const SizedBox.shrink();
                      }
                      return SizedBox(
                        height: 30.0,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.propOfIncomes.length,
                          separatorBuilder:
                              (BuildContext context, int index) => const SizedBox(width: 8.0),
                          itemBuilder:
                              (BuildContext context, int index) => Container(
                                padding: const EdgeInsets.all(4.0),
                                decoration: BoxDecoration(
                                  color: AppColors.primaryColor.withValues(alpha: .2),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      controller.propOfIncomes[index],
                                      style: context.txtTheme.bodyMedium,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        controller.propOfIncomes.removeWhere(
                                          (String value) =>
                                              value == controller.propOfIncomes[index],
                                        );
                                      },
                                      child: const Icon(Icons.cancel, color: AppColors.orange),
                                    ),
                                  ],
                                ),
                              ),
                        ),
                      );
                    }),

                    const SizedBox(height: AppSizes.xs),

                    Row(
                      children: <Widget>[
                        Obx(
                          () => Checkbox(
                            value: controller.isMinimumIncomeEnable.value,
                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            onChanged: (bool? value) {
                              controller.updateMinimumIncomeEnable = value;
                            },
                          ),
                        ),
                        Text("Enable minimum expected Income", style: context.txtTheme.titleMedium),
                      ],
                    ),

                    const SizedBox(height: AppSizes.sm),

                    CustomTextField(
                      controller: TextEditingController(),
                      isBorder: true,
                      borderRadius: 12.0,
                    ),

                    const SizedBox(height: AppSizes.sm),

                    Text("Select pay history length", style: context.txtTheme.titleMedium),

                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        spacing: AppSizes.sm,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          // option visa
                          Obx(
                            () => Radio<String>(
                              value: "1 Month",
                              groupValue: controller.isSubmitIncomeTaxDoc.value,
                              onChanged:
                                  (String? value) => controller.updateSubmitIncomeTaxDoc = value,
                            ),
                          ),
                          Text("1 Month", style: context.txtTheme.titleMedium),

                          // option paypal
                          Obx(
                            () => Radio<String>(
                              value: "2 Month",
                              groupValue: controller.isSubmitIncomeTaxDoc.value,
                              onChanged:
                                  (String? value) => controller.updateSubmitIncomeTaxDoc = value,
                            ),
                          ),

                          Text("2 Month", style: context.txtTheme.titleMedium),

                          Obx(
                            () => Radio<String>(
                              value: "3 Month",
                              groupValue: controller.isSubmitIncomeTaxDoc.value,
                              onChanged:
                                  (String? value) => controller.updateSubmitIncomeTaxDoc = value,
                            ),
                          ),
                          Text("3 Month", style: context.txtTheme.titleMedium),
                        ],
                      ),
                    ),

                    const SizedBox(height: AppSizes.spaceBetweenItems),

                    Text(
                      "Select accepted forms of proof of ID",
                      style: context.txtTheme.titleMedium,
                    ),
                    const SizedBox(height: AppSizes.spaceBetweenItems),

                    CustomDropdown<String>(
                      options: controller.propOfIncomesSet1,
                      displayString: (String value) => value,
                      onChanged: (String value) {
                        controller.propOfIncomes1.removeDuplicates();
                        controller.propOfIncomes1.add(value);
                        controller.propOfIncomes1.removeDuplicates();
                      },
                    ),

                    const SizedBox(height: AppSizes.spaceBetweenItems),

                    Obx(() {
                      if (controller.propOfIncomes.isEmpty) {
                        return const SizedBox.shrink();
                      }
                      return SizedBox(
                        height: 30.0,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.propOfIncomes1.length,
                          separatorBuilder:
                              (BuildContext context, int index) => const SizedBox(width: 8.0),
                          itemBuilder:
                              (BuildContext context, int index) => Container(
                                padding: const EdgeInsets.all(4.0),
                                decoration: BoxDecoration(
                                  color: AppColors.primaryColor.withValues(alpha: .2),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      controller.propOfIncomes1[index],
                                      style: context.txtTheme.bodyMedium,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        controller.propOfIncomes1.removeWhere(
                                          (String value) =>
                                              value == controller.propOfIncomes1[index],
                                        );
                                      },
                                      child: const Icon(Icons.cancel, color: AppColors.orange),
                                    ),
                                  ],
                                ),
                              ),
                        ),
                      );
                    }),

                    const SizedBox(height: AppSizes.xs),

                    Row(
                      children: <Widget>[
                        Obx(
                          () => Checkbox(
                            value: controller.isUtilizeCreditApplication.value,
                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            onChanged: (bool? value) {
                              controller.updateUtilizeCreditApplication = value;
                            },
                          ),
                        ),
                        Text("Enable minimum expected Income", style: context.txtTheme.titleMedium),
                      ],
                    ),

                    const SizedBox(height: AppSizes.spaceBetweenSections),
                    const SizedBox(height: AppSizes.spaceBetweenSections),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      spacing: AppSizes.md,
                      children: <Widget>[
                        Expanded(
                          child: CustomButton(
                            onTap: () => Get.toNamed(AppRoutes.ownerCreateApartmentRoute),
                            text: "Next",
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: AppSizes.spaceBetweenItems),
                  ],
                ),
              ),
              const SizedBox(height: AppSizes.spaceBetweenSections),
            ],
          ),
        ),
      ),
    );
  }
}
