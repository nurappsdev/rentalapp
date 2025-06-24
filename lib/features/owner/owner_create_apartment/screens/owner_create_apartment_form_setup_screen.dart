import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/config/app_icons.dart';
import 'package:alora/core/config/app_sizes.dart';
import 'package:alora/core/config/app_strings.dart';
import 'package:alora/core/extensions/context_extensions.dart';
import 'package:alora/core/extensions/widget_extensions.dart';
import 'package:alora/core/routes/app_routes.dart';
import 'package:alora/core/utils/custom_bottom_sheet.dart';
import 'package:alora/core/widgets/custom_app_bar.dart';
import 'package:alora/core/widgets/custom_button.dart';
import 'package:alora/core/widgets/custom_network_image.dart';
import 'package:alora/core/widgets/custom_rounded_inner_icon.dart';
import 'package:alora/core/widgets/custom_text_field.dart';
import 'package:alora/shared/models/maintenance_model.dart';
import 'package:alora/shared/widgets/custom_file_upload_layout.dart';
import 'package:alora/shared/widgets/delete_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../controllers/owner_create_apartment_controller.dart';

class OwnerCreateApartmentFormSetupScreen extends GetView<OwnerCreateApartmentController> {
  const OwnerCreateApartmentFormSetupScreen({
    super.key
  });

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
                      "Form Submission Fee",
                      style: context.txtTheme.titleMedium
                    ),
                    const SizedBox(height: AppSizes.md,),

                    CustomTextField(
                      controller: TextEditingController(),
                      isBorder: true,
                      hintText: "12.99",
                      borderRadius: 12.0,
                    ),
                    const SizedBox(height: AppSizes.spaceBetweenItems,),

                    Text(
                      "Submit Income Tax Doc",
                      style: context.txtTheme.titleMedium
                    ),

                    Row(
                      spacing: AppSizes.sm,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        // option visa
                        Obx(
                          () => Radio<bool>(
                            value: true,
                            groupValue: controller.isSubmitIncomeTaxDoc.value,
                            onChanged: (bool? value) => controller.updateSubmitIncomeTaxDoc = value,
                          ),
                        ),
                        Text(
                          AppStrings.yes,
                          style: context.txtTheme.titleMedium
                        ),

                        // option paypal
                        Obx(
                          () => Radio<bool>(
                            value: false,
                            groupValue: controller.isSubmitIncomeTaxDoc.value,
                            onChanged: (bool? value) => controller.updateSubmitIncomeTaxDoc = value,
                          ),
                        ),
                        Text(
                          AppStrings.no,
                          style: context.txtTheme.titleMedium
                        ),
                      ],
                    ),

                    const SizedBox(height: AppSizes.spaceBetweenItems,),

                    Text(
                      "Submit Id Card",
                      style: context.txtTheme.titleMedium
                    ),

                    Row(
                      spacing: AppSizes.sm,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        // option visa
                        Obx(
                          () => Radio<bool>(
                            value: true,
                            groupValue: controller.isSubmitIdCard.value,
                            onChanged: (bool? value) => controller.updateSubmitIdCard = value,
                          ),
                        ),
                        Text(
                          AppStrings.yes,
                          style: context.txtTheme.titleMedium
                        ),

                        // option paypal
                        Obx(
                          () => Radio<bool>(
                            value: false,
                            groupValue: controller.isSubmitIdCard.value,
                            onChanged: (bool? value) => controller.updateSubmitIdCard = value,
                          ),
                        ),
                        Text(
                          AppStrings.no,
                          style: context.txtTheme.titleMedium
                        ),
                      ],
                    ),

                    const SizedBox(height: AppSizes.spaceBetweenItems,),


                    Text(
                      "Submit Credit Application Doc",
                      style: context.txtTheme.titleMedium
                    ),

                    Row(
                      spacing: AppSizes.sm,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        // option visa
                        Obx(
                          () => Radio<bool>(
                            value: true,
                            groupValue: controller.isSubmitCreditApplicationDoc.value,
                            onChanged: (bool? value) => controller.updateSubmitCreditApplicationDoc = value,
                          ),
                        ),
                        Text(
                          AppStrings.yes,
                          style: context.txtTheme.titleMedium
                        ),

                        // option paypal
                        Obx(
                          () => Radio<bool>(
                            value: false,
                            groupValue: controller.isSubmitCreditApplicationDoc.value,
                            onChanged: (bool? value) => controller.updateSubmitCreditApplicationDoc = value,
                          ),
                        ),
                        Text(
                          AppStrings.no,
                          style: context.txtTheme.titleMedium
                        ),
                      ],
                    ),



                    const SizedBox(height: AppSizes.spaceBetweenSections,),
                    const SizedBox(height: AppSizes.spaceBetweenSections,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      spacing: AppSizes.md,
                      children: <Widget>[
                        Expanded(child: CustomButton(onTap: () => Get.toNamed(AppRoutes.ownerCreateApartmentRoute), text: "Next"))
                      ],
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
