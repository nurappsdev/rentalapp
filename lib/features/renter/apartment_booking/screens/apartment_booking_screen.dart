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
import 'package:alora/shared/widgets/custom_file_upload_layout.dart';
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
    final double? price = arguments != null ? (arguments as Map<String, dynamic>)['price'] : null;

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
                      style: context.txtTheme.bodyMedium?.copyWith(
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
                      style: context.txtTheme.bodyMedium
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

                    const SizedBox(height: AppSizes.spaceBetweenItems,),

                    Text(
                      AppStrings.submitYourInfo,
                      style: context.txtTheme.bodyMedium
                    ),
                    const SizedBox(height: AppSizes.md,),

                    Obx(
                      () => CustomFileUploadLayout(
                        label: 'Income tax doc', 
                        file: controller.incomeTaxDoc.value,
                        onBrowseCallback: () async{  
                          final File? file = await ImagePickerUtils.pickImageFile();
                          controller.incomeTaxDoc.value = file;
                        },
                      ),
                    ),

                    const SizedBox(height: AppSizes.spaceBetweenItems,),

                    Obx(
                      () => CustomFileUploadLayout(
                        label: 'ID Card (Front Side)', 
                        file: controller.idCardFront.value,
                        onBrowseCallback: () async{  
                          final File? file = await ImagePickerUtils.pickImageFile();
                          controller.idCardFront.value = file;
                        },
                      ),
                    ),


                    const SizedBox(height: AppSizes.spaceBetweenItems,),


                   Obx(
                      () => CustomFileUploadLayout(
                        label: 'ID Card (Back Side)', 
                        file: controller.idCardBack.value,
                        onBrowseCallback: () async{  
                          final File? file = await ImagePickerUtils.pickImageFile();
                          controller.idCardBack.value = file;
                        },
                      ),
                    ),

                    const SizedBox(height: AppSizes.spaceBetweenItems,),

                    Obx(
                      () => CustomFileUploadLayout(
                        label: 'Upload your credit card application doc', 
                        file: controller.creditCardApplicaitonDoc.value,
                        onBrowseCallback: () async{  
                          final File? file = await ImagePickerUtils.pickImageFile();
                          controller.creditCardApplicaitonDoc.value = file;
                        },
                      ),
                    ),

                    const SizedBox(height: AppSizes.spaceBetweenSections,),

                    PaymentCard(
                      price: price,
                      onPayCallBack: (PaymentData data){
                        CustomBottomSheet.showCustomBottomSheet(
                          context: context, 
                          isDismissible: false,
                          child: CongratulationSheet(
                            title: "Congratulations!",
                            description: "You have successfully registered your property. We will update you via email within 72 hours.",
                            onProceedCallback: (){
                              data.price = price;
                              data.email = "email.@gmail.com";
                              Get.toNamed(
                                AppRoutes.paymentTicketRoute,
                                arguments: data,
                              );
                            },
                          )
                        );
                      }
                    ),
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
            style: context.txtTheme.labelSmall?.copyWith(
              color: AppColors.textWhiteColor
            ),
          ),
          const SizedBox(height: AppSizes.sm,),
          Text(
            value,
            style: context.txtTheme.bodyMedium?.copyWith(
              color: AppColors.textWhiteColor
            ),
          ),
        ],
      ),
    );
  }
}


