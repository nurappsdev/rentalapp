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

class OwnerCreateApartmentScreen extends GetView<OwnerCreateApartmentController> {
  const OwnerCreateApartmentScreen({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: const CustomAppBar(
        title: AppStrings.createApartment,
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
                      "Apartment Name",
                      style: context.txtTheme.titleMedium
                    ),
                    const SizedBox(height: AppSizes.md,),

                    CustomTextField(
                      controller: TextEditingController(),
                      isBorder: true,
                      borderRadius: 12.0,
                    ),

                    const SizedBox(height: AppSizes.spaceBetweenItems,),
                    Text(
                      "Apartment Description",
                      style: context.txtTheme.titleMedium
                    ),
                    const SizedBox(height: AppSizes.md,),

                    CustomTextField(
                      controller: TextEditingController(),
                      isBorder: true,
                      minLines: 4,
                      maxLines: 10,
                      borderRadius: 12.0,
                    ),


                    const SizedBox(height: AppSizes.spaceBetweenItems,),
                    Text(
                      "Location",
                      style: context.txtTheme.titleMedium
                    ),
                    const SizedBox(height: AppSizes.md,),

                    CustomTextField(
                      controller: TextEditingController(),
                      isBorder: true,
                      borderRadius: 12.0,
                    ),

                    const SizedBox(height: AppSizes.spaceBetweenItems,),
                    Text(
                      "Facilities",
                      style: context.txtTheme.titleMedium
                    ),
                    const SizedBox(height: AppSizes.md,),

                    CustomTextField(
                      controller: TextEditingController(),
                      isBorder: true,
                      borderRadius: 12.0,
                    ),

                    const SizedBox(height: AppSizes.spaceBetweenItems,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        CustomButton(onTap: (){}, width: 100, text: "Add Facilites")
                      ],
                    ),

                    const SizedBox(height: AppSizes.spaceBetweenItems,),


                    CustomFileUploadLayout(
                      label: "Upload Your Aparment Image", 
                      onBrowseCallback: (){

                      }
                    ),

                    const SizedBox(height: AppSizes.spaceBetweenItems,),

                     Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        CustomButton(onTap: (){}, width: 100, text: "Add Image")
                      ],
                    ),

                    const SizedBox(height: AppSizes.spaceBetweenItems,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      spacing: AppSizes.md,
                      children: <Widget>[
                        Expanded(child: CustomButton(onTap: () => Get.back(), isOutline: true, text: "Back")),
                        Expanded(child: CustomButton(onTap: () => Get.toNamed(AppRoutes.ownerCreateApartmentAddUnitRoute), text: "Save"))
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
