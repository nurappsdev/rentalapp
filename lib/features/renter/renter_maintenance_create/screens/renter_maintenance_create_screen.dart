// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/config/app_icons.dart';
import 'package:alora/core/config/app_images.dart';
import 'package:alora/core/config/app_sizes.dart';
import 'package:alora/core/config/app_strings.dart';
import 'package:alora/core/enums/payment_option.dart';
import 'package:alora/core/extensions/context_extensions.dart';
import 'package:alora/core/routes/app_routes.dart';
import 'package:alora/core/utils/custom_bottom_sheet.dart';
import 'package:alora/core/utils/date_picker_utils.dart';
import 'package:alora/core/utils/image_picker_utils.dart';
import 'package:alora/core/widgets/custom_app_bar.dart';
import 'package:alora/core/widgets/custom_button.dart';
import 'package:alora/core/widgets/custom_text_field.dart';
import 'package:alora/core/widgets/dotted_border.dart';
import 'package:alora/shared/features/payment/widget/payment_card.dart';
import 'package:alora/shared/widgets/congratulation_sheet.dart';
import 'package:alora/shared/widgets/custom_dropdown.dart';
import 'package:alora/shared/widgets/custom_file_upload_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../controllers/renter_maintenance_create_controller.dart';

class RenterMaintenanceCreateScreen extends GetView<RenterMaintenanceCreateController> {
  const RenterMaintenanceCreateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        showBackBtn: true,
        elevation: 0.0,
        title: "Create Request",
        backgroundColor: AppColors.whiteColor,
      ),
      backgroundColor: AppColors.surfaceColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.screenHorizontal),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Please provide us with some information about your maintenance issue. ",
                style: context.txtTheme.titleMedium,
              ),
              const SizedBox(height: AppSizes.spaceBetweenItems),

              Container(
                width: context.screenWidth,
                padding: const EdgeInsets.symmetric(horizontal: AppSizes.md),
                decoration: BoxDecoration(
                  border: Border.all(width: AppSizes.dividerThick, color: AppColors.borderColor),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: AppSizes.spaceBetweenItems),
                    Text("Unit Name", style: context.txtTheme.bodyMedium),
                    const SizedBox(height: AppSizes.md),

                    CustomTextField(
                      controller: TextEditingController(),
                      isBorder: true,
                      borderRadius: 12.0,
                      onTab: () async {},
                    ),

                    const SizedBox(height: AppSizes.spaceBetweenInputs),

                    Text("Issue Date", style: context.txtTheme.bodyMedium),
                    const SizedBox(height: AppSizes.md),

                    CustomTextField(
                      controller: TextEditingController(),
                      isBorder: true,
                      readOnly: true,
                      borderRadius: 12.0,
                      // suffixIcons: ,
                      onTab: () async {},
                    ),

                    const SizedBox(height: AppSizes.spaceBetweenInputs),

                    Text(AppStrings.description, style: context.txtTheme.bodyMedium),
                    const SizedBox(height: AppSizes.md),

                    CustomTextField(
                      controller: TextEditingController(),
                      isBorder: true,
                      readOnly: true,
                      borderRadius: 12.0,
                      minLines: 4,
                      maxLines: 6,
                      onTab: () async {},
                    ),

                    const SizedBox(height: AppSizes.spaceBetweenItems),

                    CustomFileUploadLayout(
                      label: 'Upload issue images',
                      onBrowseCallback: () async {},
                    ),

                    const SizedBox(height: AppSizes.spaceBetweenItems),

                    CustomFileUploadLayout(
                      label: 'Upload issue videos',
                      onBrowseCallback: () async {},
                    ),

                    const SizedBox(height: AppSizes.spaceBetweenSections),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      spacing: AppSizes.xs,
                      children: <Widget>[
                        Obx(
                          () => Checkbox(
                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            value: controller.isNeedEarlyService.value,
                            onChanged: (bool? value) => controller.updateNeedEarlyService = value,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            AppStrings.needEarlyService,
                            style: context.txtTheme.titleSmall,
                          ),
                        ),
                        const SizedBox(width: AppSizes.lg),
                      ],
                    ),

                    Text(
                      "You will receive your service within the next 24 hours.",
                      style: context.txtTheme.labelMedium,
                    ),

                    const SizedBox(height: AppSizes.spaceBetweenSections),

                    Text(
                      "The services team may arrive when you are not home",
                      style: context.txtTheme.titleMedium,
                    ),

                    Row(
                      spacing: AppSizes.sm,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        // option visa
                        Obx(
                          () => Radio<bool>(
                            value: true,
                            groupValue: controller.isYes.value,
                            onChanged: (bool? value) => controller.updateYes = value,
                          ),
                        ),
                        Text(AppStrings.yes, style: context.txtTheme.titleMedium),

                        // option paypal
                        Obx(
                          () => Radio<bool>(
                            value: false,
                            groupValue: controller.isYes.value,
                            onChanged: (bool? value) => controller.updateYes = value,
                          ),
                        ),
                        Text(AppStrings.no, style: context.txtTheme.titleMedium),
                      ],
                    ),

                    const SizedBox(height: AppSizes.spaceBetweenItems),
                    Text("Select time of availability ", style: context.txtTheme.bodyLarge),
                    const SizedBox(height: AppSizes.md),

                    // CustomTextField(
                    //   controller: controller.calendarCTRL,
                    //   isBorder: true,
                    //   readOnly: true,
                    //   borderRadius: 12.0,
                    //   suffixIcons: Padding(
                    //     padding: const EdgeInsets.all(8.0),
                    //     child: SvgPicture.asset(AppIcons.dateIcon),
                    //   ),
                    //   prefixIconCallBack: () async {
                    //     final String? date = await DatePickerUtils.pickFormattedDate(
                    //       context: context,
                    //     );
                    //     if (date != null) {
                    //       controller.calendarCTRL.text = date;
                    //     }
                    //   },
                    //   onTab: () async {
                    //     final String? date = await DatePickerUtils.pickFormattedDate(
                    //       context: context,
                    //     );
                    //     if (date != null) {
                    //       controller.calendarCTRL.text = date;
                    //     }
                    //   },
                    // ),
                    CustomDropdown<String>(
                      options: const <String>['Morning (8-12)', 'Afternoon (1-5)', 'Evening (5-8)'],
                      hint: "Select Availability",
                      displayString: (String value) => value,
                    ),

                    const SizedBox(height: AppSizes.spaceBetweenSections),

                    CustomButton(onTap: () => Get.back(), text: AppStrings.submitIssue),

                    const SizedBox(height: AppSizes.spaceBetweenSections),
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
