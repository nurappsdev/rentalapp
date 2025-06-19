import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/config/app_icons.dart';
import 'package:alora/core/config/app_sizes.dart';
import 'package:alora/core/config/app_strings.dart';
import 'package:alora/core/extensions/context_extensions.dart';
import 'package:alora/core/extensions/widget_extensions.dart';
import 'package:alora/core/utils/date_picker_utils.dart';
import 'package:alora/core/utils/device/device_utility.dart';
import 'package:alora/core/widgets/custom_app_bar.dart';
import 'package:alora/core/widgets/custom_button.dart';
import 'package:alora/core/widgets/custom_network_image.dart';
import 'package:alora/core/widgets/custom_rounded_inner_icon.dart';
import 'package:alora/core/widgets/custom_text_field.dart';
import 'package:alora/features/renter/apartment_details/widgets/apartment_details_shimmer.dart';
import 'package:alora/features/renter/search_apartments/model/apartment_model.dart';
import 'package:alora/shared/widgets/apartment_card.dart';
import 'package:alora/shared/widgets/custom_chip_layout.dart';
import 'package:alora/shared/widgets/custom_dropdown.dart';
import 'package:alora/shared/widgets/empty_apartment_details.dart';
import 'package:alora/shared/widgets/empty_maintenance_details.dart';
import 'package:alora/shared/widgets/maintenance_details_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../controllers/apartment_details_controller.dart';

class ApartmentDetailsScreen extends GetView<ApartmentDetailsController> {
  const ApartmentDetailsScreen({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    final dynamic arguments = Get.arguments;
    controller.updateApartmentId = arguments != null ? (arguments as Map<String, dynamic>)['aparment_id'] : '';
    // final String type = arguments != null ? (arguments as Map<String, dynamic>)['type'] : '';
    return Scaffold(
      appBar: const CustomAppBar(
        showBackBtn: true,
        elevation: 0.0,
        backgroundColor: AppColors.whiteColor,
        title: AppStrings.apartmentDetails,
      ),
      backgroundColor: AppColors.surfaceColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.screenHorizontal),
          child: Column(
            children: <Widget>[
              Obx(
                (){
                  if(controller.apartmentLoading.value){
                    return const ApartmentDetailsShimmer();
                  }
                  else if(controller.apartment.value == null){
                    return const EmptyApartmentDetails().centered;
                  }
                  final ApartmentModel apartment = controller.apartment.value!;

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // top card
                      ApartmentCard(apartment: apartment,),

                      const SizedBox(height: AppSizes.spaceBetweenItems,),

                      // description layout
                      Text(
                        AppStrings.apartmetnDescription,
                        style: context.txtTheme.titleMedium?.copyWith(
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.primaryColor,
                          decorationThickness: 1.0,
                        ),
                      ),
                  
                      const SizedBox(height: AppSizes.md,),
                  
                      Text(
                        apartment.apartmentDescription,
                        style: context.txtTheme.bodyMedium,
                      ),


                      const SizedBox(height: AppSizes.spaceBetweenItems,),
                      // image layout
                      Text(
                        AppStrings.apartmetnImage,
                        style: context.txtTheme.titleMedium?.copyWith(
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.primaryColor,
                          decorationThickness: 1.0,
                        ),
                      ),
                  
                      const SizedBox(height: AppSizes.md,),
                  
                      SizedBox(
                        height: 100.0,
                        child: ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: apartment.apartmentImages.length,
                          itemBuilder: (_, int index){
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(AppSizes.borderRadiusMd),
                              child: CustomNetworkImage(
                                imageUrl: apartment.apartmentImages[index],
                                width: 100.0,
                                height: double.infinity,
                                boxShape: BoxShape.rectangle,
                              ),
                            );
                          },
                          separatorBuilder: (_,_) => const SizedBox(width: AppSizes.md,),
                        ),
                      ),


                      const SizedBox(height: AppSizes.spaceBetweenItems,),
                      // facilities layout
                      Text(
                        AppStrings.apartmetnFacilities,
                        style: context.txtTheme.titleMedium?.copyWith(
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.primaryColor,
                          decorationThickness: 1.0,
                        ),
                      ),
                  
                      const SizedBox(height: AppSizes.md,),


                      Wrap(
                        children: apartment.apartmentFacilities.map((Facility facility) {
                          return Container(
                            margin: const EdgeInsets.all(6.0),
                            child: CustomChipLayout(
                              name: facility.name,
                              icon: facility.icon,
                            ),
                          );
                        }).toList(),
                      ),


                      const SizedBox(height: AppSizes.spaceBetweenSections,),

                      // date with picker
                      CustomTextField(
                        controller: controller.movingDateCTRL,
                        isBorder: true,
                        readOnly: true,
                        borderRadius: 12.0,
                        borderColor: AppColors.primaryColor,
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

                      // unit types
                      CustomDropdown<String>(
                        options: apartment.availableUnitTypes, 
                        displayString: (String unit) => unit,
                        borderColor: AppColors.primaryColor,
                        hint: AppStrings.availableUnitType,
                        onChanged: (String value) {
                          controller.updateSelectedUnitType = value;
                        },
                      ),

                      const SizedBox(height: AppSizes.spaceBetweenInputs,),

                      // floors
                      CustomDropdown<String>(
                        options: apartment.availableFloors, 
                        displayString: (String unit) => unit,
                        borderColor: AppColors.primaryColor,
                        hint: AppStrings.selectFloor,
                        onChanged: (String value) {
                          controller.updateSelectedFloor = value;
                        },
                      ),

                      const SizedBox(height: AppSizes.spaceBetweenInputs,),

                      // numbers
                      CustomDropdown<ApartmentUnit>(
                        options: apartment.apartmentNumbers, 
                        displayString: (ApartmentUnit unit) => unit.title,
                        borderColor: AppColors.primaryColor,
                        hint: AppStrings.apartmentNumber,
                        onChanged: (ApartmentUnit value) {
                          controller.updateSelectedApartmentNumber = value;
                        },
                      ),

                      // unit facilites and images
                      if(controller.selectedApartmentNumber.value != null)...<Widget>[
                        const SizedBox(height: AppSizes.spaceBetweenSections,),
                        // facilities layout
                        Text(
                          "${controller.selectedApartmentNumber.value!.title} ${AppStrings.facilities}",
                          style: context.txtTheme.titleMedium?.copyWith(
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.primaryColor,
                            decorationThickness: 1.0,
                          ),
                        ),
                    
                        const SizedBox(height: AppSizes.md,),


                        Wrap(
                          runSpacing: 8,
                          children: controller.selectedApartmentNumber.value!.facilities.map((Facility facility) {
                            return Container(
                              margin: const EdgeInsets.all(6.0),
                              child: CustomChipLayout(
                                name: facility.name,
                                icon: facility.icon,
                              ),
                            );
                          }).toList(),
                        ),

                        const SizedBox(height: AppSizes.spaceBetweenSections,),

                        // image layout
                        Text(
                          "${controller.selectedApartmentNumber.value!.title} ${AppStrings.image}",
                          style: context.txtTheme.titleMedium?.copyWith(
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.primaryColor,
                            decorationThickness: 1.0,
                          ),
                        ),
                    
                        const SizedBox(height: AppSizes.md,),

                        SizedBox(
                          height: 100.0,
                          child: ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.selectedApartmentNumber.value!.unitImages.length,
                            itemBuilder: (_, int index){
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(AppSizes.borderRadiusMd),
                                child: CustomNetworkImage(
                                  imageUrl: controller.selectedApartmentNumber.value!.unitImages[index],
                                  width: 100.0,
                                  height: double.infinity,
                                  boxShape: BoxShape.rectangle,
                                ),
                              );
                            },
                            separatorBuilder: (_,_) => const SizedBox(width: AppSizes.md,),
                          ),
                        ),

                        const SizedBox(height: AppSizes.spaceBetweenItems,),

                        Card(
                          color: AppColors.whiteColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(AppSizes.borderRadiusMd),
                            side: const BorderSide(
                              color: AppColors.greyColor,
                              width: AppSizes.dividerHeight,
                            ),
                          ),
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(AppSizes.md),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(AppSizes.borderRadiusMd),
                                  child: CustomNetworkImage(
                                    imageUrl: apartment.image,
                                    height: 48.0,
                                    width: 48.0, // or any fixed width
                                    boxShape: BoxShape.rectangle,
                                  ),
                                ),

                                const SizedBox(width: AppSizes.spaceBetweenItems),

                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        AppStrings.apartmentName,
                                        style: context.txtTheme.labelSmall,
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        apartment.apartmentName,
                                        style: context.txtTheme.bodyMedium,
                                      ),
                                    ],
                                  ),
                                ),

                                Row(
                                  spacing: AppSizes.md,
                                  children: <Widget>[
                                    CustomRoundedInnerIcon(
                                      onTap: (){
                                        DeviceUtility.launchEmail(apartment.ownerEmail);
                                      },
                                      containerSize: 32.0,
                                      boxShape: BoxShape.rectangle,
                                      icon: AppIcons.emailPrefixIcon
                                    ),
                                    CustomRoundedInnerIcon(
                                      onTap: (){
                                        DeviceUtility.launchPhone(apartment.ownerPhoneNumber);
                                      },
                                      containerSize: 32.0,
                                      boxShape: BoxShape.rectangle,
                                      icon: AppIcons.phonePrefixIcon
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(height: AppSizes.spaceBetweenItems,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              "${AppStrings.price} \$${apartment.price}",
                              style: context.txtTheme.headlineMedium,
                            ),
                            Text(
                              " / ${apartment.priceType}",
                              style: context.txtTheme.bodyLarge,
                            )
                          ],
                        )
                      ],
                      const SizedBox(height: AppSizes.spaceBetweenItems,),
                      CustomButton(
                        onTap: controller.handleApartmentApplicationProcess, 
                        text: AppStrings.beginApplicationProcess
                      ),
                      const SizedBox(height: AppSizes.spaceBetweenSections,),
                    ],
                  );
                }
              ),

              SizedBox(height: context.screenHeight * .4,),
            ],
          ),
        ),
      ),
    );
  }
}
