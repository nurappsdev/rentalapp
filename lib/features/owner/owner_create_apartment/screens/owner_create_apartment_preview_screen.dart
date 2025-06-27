import 'package:alora/core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
import 'package:flutter_svg/svg.dart';
import '../controllers/owner_create_apartment_controller.dart';

class OwnerCreateApartmentPreviewScreen extends GetView<OwnerCreateApartmentController> {
  const OwnerCreateApartmentPreviewScreen({
    super.key
  });

  @override
  Widget build(BuildContext context) {
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

              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // top card
                  ApartmentCard(apartment: controller.apartment,),

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
                    controller.apartment.apartmentDescription,
                    style: context.txtTheme.bodyMedium,
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
                    children: controller.apartment.apartmentFacilities.map((Facility facility) {
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
                      itemCount: controller.apartment.apartmentImages.length,
                      itemBuilder: (_, int index){
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(AppSizes.borderRadiusMd),
                          child: CustomNetworkImage(
                            imageUrl: controller.apartment.apartmentImages[index],
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


                  Text(
                    "Floor Level",
                    style: context.txtTheme.titleMedium?.copyWith(
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.primaryColor,
                      decorationThickness: 1.0,
                    ),
                  ),
              
                  const SizedBox(height: AppSizes.md,),

                  Text(
                    "1st Floor",
                    style: context.txtTheme.bodyMedium,
                  ),

                  const SizedBox(height: AppSizes.spaceBetweenItems,),


                  Text(
                    "${controller.apartment.apartmentNumbers.first.title} ${AppStrings.facilities}",
                    style: context.txtTheme.titleMedium?.copyWith(
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.primaryColor,
                      decorationThickness: 1.0,
                    ),
                  ),
              
                  const SizedBox(height: AppSizes.md,),


                  Wrap(
                    runSpacing: 8,
                    children: controller.apartment.apartmentNumbers.first.facilities.map((Facility facility) {
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
                    "${controller.apartment.apartmentNumbers.first.title} ${AppStrings.image}",
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
                      itemCount: controller.apartment.apartmentNumbers.first.unitImages.length,
                      itemBuilder: (_, int index){
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(AppSizes.borderRadiusMd),
                          child: CustomNetworkImage(
                            imageUrl: controller.apartment.apartmentNumbers.first.unitImages[index],
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
                            imageUrl: controller.apartment.image,
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
                                controller.apartment.apartmentName,
                                style: context.txtTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ),

                        const Row(
                          spacing: AppSizes.md,
                          children: <Widget>[
                            CustomRoundedInnerIcon(
                              containerSize: 32.0,
                              boxShape: BoxShape.rectangle,
                              icon: AppIcons.emailPrefixIcon
                            ),
                            CustomRoundedInnerIcon(
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
                      "${AppStrings.price} \$${controller.apartment.price}",
                      style: context.txtTheme.headlineMedium,
                    ),
                    Text(
                      " / ${controller.apartment.priceType}",
                      style: context.txtTheme.bodyLarge,
                    )
                  ],
                ),

                  
                const SizedBox(height: AppSizes.spaceBetweenSections,),
                Row(
                  spacing: AppSizes.md,
                  children: <Widget>[
                    Expanded(
                      child: CustomButton(
                        onTap: (){
                          Get.toNamed(AppRoutes.ownerCreateApartmentCreateUnitFirstRoute);
                        }, 
                        isOutline: true,
                        text: "Add Unit"
                      ),
                    ),
                    Expanded(
                      child: CustomButton(
                        onTap: (){
                          Get.offAllNamed(AppRoutes.homeOwnerRoute);
                        }, 
                        text: "Return Home"
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSizes.spaceBetweenSections,),
                ],
              ),

              SizedBox(height: context.screenHeight * .4,),
            ],
          ),
        ),
      ),
    );
  }
}
