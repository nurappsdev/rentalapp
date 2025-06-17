import 'dart:io';

import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/config/app_icons.dart';
import 'package:alora/core/config/app_sizes.dart';
import 'package:alora/core/config/app_strings.dart';
import 'package:alora/core/extensions/context_extensions.dart';
import 'package:alora/core/utils/date_picker_utils.dart';
import 'package:alora/core/widgets/custom_app_bar.dart';
import 'package:alora/core/widgets/custom_button.dart';
import 'package:alora/core/widgets/custom_text_field.dart';
import 'package:alora/core/widgets/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../controllers/apartment_booking_controller.dart';

class ApartmentBookingScreen extends GetView<ApartmentBookingController> {
  const ApartmentBookingScreen({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    final dynamic arguments = Get.arguments;
    controller.updateSelectedApartmentId = arguments != null ? (arguments as Map<String, dynamic>)['apartment_id'] : '';
    controller.updateSelectedApartmentName = arguments != null ? (arguments as Map<String, dynamic>)['apartment_name'] : '';
    controller.updateSelectedUnitType = arguments != null ? (arguments as Map<String, dynamic>)['unit_type'] : '';
    controller.updateSelectedFloor = arguments != null ? (arguments as Map<String, dynamic>)['floor'] : '';
    controller.updateSelectedApartmentNumber = arguments != null ? (arguments as Map<String, dynamic>)['apartment_number'] : '';
    controller.movingDateCTRL.text = arguments != null ? (arguments as Map<String, dynamic>)['moving_date'] : '';

    // arguments: <String, String>{
    //     "apartment_id": apartmentId,
    //     "unit_type": selectedUnitType,
    //     "floor": selectedFloor,
    //     "apartment_number": selectedApartmentNumber.value!.title,
    //     "movingDate": movingDateCTRL.text.trim(),
    //   }

    return Scaffold(
      appBar: const CustomAppBar(
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
              Container(
                width: context.screenWidth,
                padding: const EdgeInsets.all(AppSizes.sm),
                decoration: const BoxDecoration(
                  color: AppColors.primaryColor
                ),
                child: Column(
                  children: <Widget>[
                    Text(
                      controller.selectedApartmentName,
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: AppColors.textWhiteColor
                      ),
                    ),
                    const SizedBox(height: AppSizes.sm,),

                    const Divider(
                      color: AppColors.whiteColor,
                      thickness: AppSizes.dividerHeight,
                    ),

                    Row(
                      children: <Widget>[
                        subHeader(context, AppStrings.apartmentNumber, controller.selectedApartmentNumber),
                        verticalDivider(),
                        subHeader(context, AppStrings.unitType, controller.selectedUnitType),
                        verticalDivider(),
                        subHeader(context, AppStrings.floor, controller.selectedFloor),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                width: context.screenWidth,
                padding: const EdgeInsets.symmetric(horizontal: AppSizes.md),
                decoration: const BoxDecoration(
                  border: Border(
                    right: BorderSide(
                      width: AppSizes.dividerThick,
                      color: AppColors.borderColor
                    ),
                    left: BorderSide(
                      width: AppSizes.dividerThick,
                      color: AppColors.borderColor
                    ),
                    bottom: BorderSide(
                      width: AppSizes.dividerThick,
                      color: AppColors.borderColor
                    )
                  )
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: AppSizes.spaceBetweenInputs,),
                    Text(
                      AppStrings.expectedMovingDate,
                      style: context.textTheme.bodyMedium
                    ),
                    const SizedBox(height: AppSizes.md,),

                    CustomTextField(
                      controller: controller.movingDateCTRL,
                      isBorder: true,
                      readOnly: true,
                      borderRadius: 12.0,
                      hintText: AppStrings.selectMovingDateHint,
                      suffixIcons: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(AppIcons.dateIcon),
                      ),
                      prefixIconCallBack: () async{
                        final String? date = await DatePickerUtils.pickFormatedDate(context: context);
                        if(date != null){
                          controller.movingDateCTRL.text = date;
                        }
                      },
                      onTab: () async{
                        final String? date = await DatePickerUtils.pickFormatedDate(context: context);
                        if(date != null){
                          controller.movingDateCTRL.text = date;
                        }
                      },
                    ),

                    const SizedBox(height: AppSizes.spaceBetweenInputs,),

                    Text(
                      AppStrings.submitYourInfo,
                      style: context.textTheme.bodyMedium
                    ),
                    const SizedBox(height: AppSizes.md,),

                    CustomFileUploadLayout(
                      label: 'Income tax doc', 
                      onBrowseCallback: () {  },
                    )
                  ],
                ),
              )
            ],
           ),
        ),
      ),
    );
  }

  Container verticalDivider() {
    return Container(
      width: 2.0,
      height: 50.0,
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      color: AppColors.whiteColor,
    );
  }

  Expanded subHeader(BuildContext context, String label, String value) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            label,
            style: context.textTheme.labelSmall?.copyWith(
              color: AppColors.textWhiteColor
            ),
          ),
          const SizedBox(height: AppSizes.sm,),
          Text(
            value,
            style: context.textTheme.bodyMedium?.copyWith(
              color: AppColors.textWhiteColor
            ),
          ),
        ],
      ),
    );
  }
}

class CustomFileUploadLayout extends StatelessWidget {
  final String title;
  final String label;
  final String subTitle;
  final String icon;
  final String btnText;
  final VoidCallback onBrowseCallback;
  final File? file;

  const CustomFileUploadLayout({
    super.key,
    required this.label,
    required this.onBrowseCallback,
    this.file,
    this.icon = AppIcons.uploadIcon,
    this.title = AppStrings.dropFileOrBrowse,
    this.subTitle = AppStrings.formatFile,
    this.btnText = AppStrings.browseFile,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.screenWidth,
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.md),
      decoration: BoxDecoration(
        border: Border.all(
          width: AppSizes.dividerThick,
          color: AppColors.borderColor
        ),
        borderRadius: BorderRadius.circular(AppSizes.borderRadiusLg),
      ),
      child: Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: AppSizes.spaceBetweenInputs,),
        
            Text(
              label,
              style: context.textTheme.bodyMedium
            ),
            const SizedBox(height: AppSizes.md,),

            DottedBorder(
              borderColor: AppColors.primaryColor,
              gap: 6.0,
              strokeWidth: 2.0,
              child:  Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: AppSizes.md),
                child: Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const SizedBox(height: AppSizes.spaceBetweenSections,),
    
                      SvgPicture.asset(
                        icon,
                        width: 24.0,
                        height: 24.0,
                      ),
                  
                      const SizedBox(height: AppSizes.md,),
    
                      Text(
                        title,
                        textAlign: TextAlign.center,
                        style: context.textTheme.bodyMedium
                      ),
                      const SizedBox(height: AppSizes.md,),
                  
                      Text(
                        subTitle,
                        textAlign: TextAlign.center,
                        style: context.textTheme.bodyMedium
                      ),

                      const SizedBox(height: AppSizes.md,),

                      CustomButton(
                        onTap: onBrowseCallback, 
                        text: btnText,
                        borderRadius: AppSizes.borderRadiusMd,
                        width: 100.0,
                        height: 35.0,
                      ),
    
                      const SizedBox(height: AppSizes.spaceBetweenSections,),
                    ],
                  ),
                ),
              )
            ),
    
            const SizedBox(height: AppSizes.spaceBetweenInputs,),
          ],
        ),
      ),
    );
  }
}
