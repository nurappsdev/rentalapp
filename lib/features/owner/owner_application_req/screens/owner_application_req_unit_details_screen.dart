import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/config/app_icons.dart';
import 'package:alora/core/config/app_sizes.dart';
import 'package:alora/core/config/app_strings.dart';
import 'package:alora/core/extensions/context_extensions.dart';
import 'package:alora/core/extensions/widget_extensions.dart';
import 'package:alora/core/routes/app_routes.dart';
import 'package:alora/core/widgets/custom_app_bar.dart';
import 'package:alora/core/widgets/custom_button.dart';
import 'package:alora/core/widgets/custom_network_image.dart';
import 'package:alora/features/renter/apartment_details/widgets/apartment_details_shimmer.dart';
import 'package:alora/features/renter/search_apartments/model/apartment_model.dart';
import 'package:alora/shared/models/maintenance_model.dart';
import 'package:alora/shared/widgets/apartment_card.dart';
import 'package:alora/shared/widgets/custom_chip_layout.dart';
import 'package:alora/shared/widgets/empty_apartment_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/owner_application_req_controller.dart';

class OwnerApplicationReqUnitDetailsScreen extends GetView<OwnerApplicationReqController> {
  const OwnerApplicationReqUnitDetailsScreen({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    controller.handleRetrieveUnitDetails();
    return Scaffold(
     appBar: const CustomAppBar(
        title: AppStrings.unitDetails,
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
              Obx(
                (){
                  if(controller.unitDetailsLoading.value){
                    return const ApartmentDetailsShimmer();
                  }
                  else if(controller.unitDetails.value == null){
                    return const EmptyApartmentDetails().centered;
                  }
                  final ApartmentModel apartment = controller.unitDetails.value!;

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // top card
                      ApartmentCard(apartment: apartment,),

                      const SizedBox(height: AppSizes.spaceBetweenItems,),

                      // description layout
                      Text(
                        AppStrings.apartmentDescription,
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
                      // facilities layout
                      Text(
                        AppStrings.apartmentFacilities,
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

                      // image layout
                      Text(
                        AppStrings.apartmentImage,
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
                          itemCount: controller.unitDetails.value!.apartmentImages.length,
                          itemBuilder: (_, int index){
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(AppSizes.borderRadiusMd),
                              child: CustomNetworkImage(
                                imageUrl: controller.unitDetails.value!.apartmentImages[index],
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
                        "${controller.unitDetails.value!.availableUnitTypes.first} ${AppStrings.image}",
                        style: context.txtTheme.titleMedium?.copyWith(
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.primaryColor,
                          decorationThickness: 1.0,
                        ),
                      ),
                  
                      const SizedBox(height: AppSizes.md,),

                       Wrap(
                        children: apartment.apartmentNumbers.first.facilities.map((Facility facility) {
                          return Container(
                            margin: const EdgeInsets.all(6.0),
                            child: CustomChipLayout(
                              name: facility.name,
                              icon: facility.icon,
                            ),
                          );
                        }).toList(),
                      ),


                      const SizedBox(height: AppSizes.spaceBetweenItems,),

                      Text(
                        "${controller.unitDetails.value!.availableUnitTypes.first} ${AppStrings.image}",
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
                          itemCount: controller.unitDetails.value!.apartmentImages.length,
                          itemBuilder: (_, int index){
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(AppSizes.borderRadiusMd),
                              child: CustomNetworkImage(
                                imageUrl: controller.unitDetails.value!.apartmentImages[index],
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

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Application Request List",
                            style: context.txtTheme.titleMedium?.copyWith(
                              decoration: TextDecoration.underline,
                              decorationColor: AppColors.primaryColor,
                              decorationThickness: 1.0
                            ),
                          ),
                          Text(
                            "(12)",
                            style: context.txtTheme.titleMedium,
                          )
                        ],
                      ),

                      const SizedBox(height: AppSizes.spaceBetweenItems,),
                      
                      const ReqList(),

                      const SizedBox(height: AppSizes.spaceBetweenItems,),
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

class ReqList extends StatelessWidget {
  const ReqList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 12,
      itemBuilder: (_, int index){
        return Container(
          width: context.screenWidth,
          padding: const EdgeInsets.all(AppSizes.xs),
          decoration: BoxDecoration(
            border: Border.all(
              width: AppSizes.dividerThick,
              color: AppColors.borderColor
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(AppSizes.borderRadiusMd),
                    child: CustomNetworkImage(
                      imageUrl: MaintenanceModel.userImage, 
                      height: 50.0, 
                      boxShape: BoxShape.rectangle,
                      width: 50.0
                    ),
                  ),
                  const SizedBox(width: AppSizes.sm,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Sanity Dhaka bd",
                        style: context.txtTheme.bodyLarge,
                      ),
                      const SizedBox(height: AppSizes.sm,),
                      Text(
                        "Ajax tom",
                        style: context.txtTheme.bodyLarge,
                      ),
                      const SizedBox(height: AppSizes.sm,),
    
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: AppSizes.md,
                        children: <Widget>[
                          Text(
                            "Studio",
                            style: context.txtTheme.labelLarge,
                          ),
                          Text(
                            "BG101",
                            style: context.txtTheme.labelLarge,
                          ),
                          Text(
                            "1st floor",
                            style: context.txtTheme.labelLarge,
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
              const Divider(
                color: AppColors.dividerColor,
              ),
    
              const SizedBox(height: AppSizes.spaceBetweenItems,),
    
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                spacing: AppSizes.md,
                children: <Widget>[
                  CustomButton(
                    onTap: () => Get.toNamed(AppRoutes.ownerApplicationReqUserDetailsRoute), 
                    width: 100.0,
                    isOutline: true,
                    text: AppStrings.viewDetails
                  ),
                  CustomButton(
                    onTap: (){}, 
                    width: 100.0,
                    text: AppStrings.accept
                  ),
                ],
              ),
    
              const SizedBox(height: AppSizes.spaceBetweenItems,),
            ],
          ),
        );
      },
      separatorBuilder: (_, int index) => const SizedBox(height: AppSizes.sm,),
    );
  }
}
