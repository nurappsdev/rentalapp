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
import 'package:alora/shared/widgets/custom_chip_layout.dart';
import 'package:alora/shared/widgets/custom_dropdown.dart';
import 'package:alora/shared/widgets/custom_file_upload_layout.dart';
import 'package:alora/shared/widgets/delete_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../controllers/owner_create_apartment_controller.dart';

class OwnerCreateApartmentCreateUnitFirstScreen extends GetView<OwnerCreateApartmentController> {
  const OwnerCreateApartmentCreateUnitFirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: AppStrings.createUnit,
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
                    Text("Select Unit", style: context.txtTheme.titleMedium),
                    const SizedBox(height: AppSizes.md),

                    CustomDropdown<String>(
                      options: const <String>["Studio", "Bed Room", "2 Bed Room", "Pent House"],
                      displayString: (String value) => value,
                    ),

                    const SizedBox(height: AppSizes.md),
                    Text("Units", style: context.txtTheme.titleMedium),
                    const SizedBox(height: AppSizes.sm),

                    const Row(
                      spacing: AppSizes.sm,
                      children: <Widget>[
                        Icon(Icons.info, color: AppColors.greyColor),
                        Expanded(
                          child: Text(
                            "Make the file for how many units you can create at a time in bulk.",
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: AppSizes.spaceBetweenItems),
                    Text("Select Number of Units", style: context.txtTheme.titleMedium),
                    const SizedBox(height: AppSizes.md),

                    CustomTextField(
                      controller: TextEditingController(),
                      isBorder: true,
                      hintText: "Select Number of Units",
                      keyboardType: TextInputType.number,
                      borderRadius: 12.0,
                    ),

                    const SizedBox(height: AppSizes.spaceBetweenItems),
                    Text("Square Fit", style: context.txtTheme.titleMedium),
                    const SizedBox(height: AppSizes.md),

                    CustomTextField(
                      controller: TextEditingController(),
                      isBorder: true,
                      hintText: "Square Fit",
                      keyboardType: TextInputType.number,
                      borderRadius: 12.0,
                    ),

                    const SizedBox(height: AppSizes.spaceBetweenItems),
                    Text("Set Unit price", style: context.txtTheme.titleMedium),
                    const SizedBox(height: AppSizes.sm),

                    Row(
                      children: <Widget>[
                        Checkbox(
                          value: true,
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          onChanged: (bool? value) {},
                        ),
                        Expanded(
                          child: Text(
                            "Set STANDARD Price for all lease terms",
                            style: context.txtTheme.bodyLarge,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: AppSizes.sm),

                    CustomTextField(
                      controller: TextEditingController(),
                      isBorder: true,
                      hintText: "Square Fit",
                      keyboardType: TextInputType.number,
                      borderRadius: 12.0,
                    ),

                    const SizedBox(height: AppSizes.spaceBetweenItems),
                    Text("Bed Rooms", style: context.txtTheme.titleMedium),
                    const SizedBox(height: AppSizes.md),

                    CustomTextField(
                      controller: TextEditingController(),
                      isBorder: true,
                      hintText: "Bed Rooms",
                      keyboardType: TextInputType.number,
                      borderRadius: 12.0,
                    ),

                    const SizedBox(height: AppSizes.spaceBetweenItems),
                    Text("Bathrooms", style: context.txtTheme.titleMedium),
                    const SizedBox(height: AppSizes.md),

                    CustomTextField(
                      controller: TextEditingController(),
                      isBorder: true,
                      hintText: "Bathrooms",
                      keyboardType: TextInputType.number,
                      borderRadius: 12.0,
                    ),

                    const SizedBox(height: AppSizes.spaceBetweenItems),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        CustomButton(
                          onTap: () {},
                          borderRadius: 42.0,
                          width: 100,
                          text: "Add Amenities",
                        ),
                      ],
                    ),

                    const SizedBox(height: AppSizes.spaceBetweenSections),

                    CustomFileUploadLayout(
                      label: "Upload your Unit image",
                      onBrowseCallback: () {},
                    ),

                    const SizedBox(height: AppSizes.spaceBetweenSections),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      spacing: AppSizes.md,
                      children: <Widget>[
                        Expanded(
                          child: CustomButton(
                            onTap:
                                () => Get.toNamed(
                                  AppRoutes.ownerCreateApartmentCreateUnitSecondRoute,
                                ),
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

class ChipWidget extends StatelessWidget {
  final VoidCallback onTapCallback;
  final bool isSelected;
  final String text;
  const ChipWidget({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTapCallback,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapCallback,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.md, vertical: AppSizes.sm),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryColor : null,
          borderRadius: BorderRadius.circular(40.0),
          border: Border.all(color: isSelected ? Colors.transparent : AppColors.primaryColor),
        ),
        child: Text(
          text,
          style: context.txtTheme.bodyMedium?.copyWith(
            color: isSelected ? AppColors.textWhiteColor : AppColors.textBlackColor,
          ),
        ),
      ),
    );
  }
}
