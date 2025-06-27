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
import 'package:alora/shared/widgets/delete_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../controllers/owner_my_apartment_controller.dart';

class OwnerApartmentListScreen extends GetView<OwnerMyApartmentController> {
  const OwnerApartmentListScreen({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: AppStrings.apartmentList,
        showBackBtn: true,
        elevation: 0.0,
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
              const SizedBox(height: AppSizes.spaceBetweenItems,),

              CustomTextField(
                controller: TextEditingController(),
                isBorder: true,
                hintText: "Search Apartment",
                prefixIcon: SvgPicture.asset(AppIcons.searchIcon),
              ),

               const SizedBox(height: AppSizes.spaceBetweenItems,),

              Card(
                color: AppColors.whiteColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSizes.borderRadiusMd),
                  side: const BorderSide(
                    color: AppColors.primaryColor,
                    width: 1.0
                  )
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(AppSizes.borderRadiusMd),
                          child: CustomNetworkImage(
                            imageUrl: MaintenanceModel.maintenanceImage, 
                            height: 200, 
                            boxShape: BoxShape.rectangle,
                            width: double.infinity
                          ),
                        ),

                        Positioned(
                          top: 15,
                          right: 15,
                          child: CustomRoundedInnerIcon(
                            onTap: () => Get.toNamed(AppRoutes.ownerMyApartmentEditRoute),
                            containerSize: 28.0,
                            icon: AppIcons.editIcon,
                            bgColor: AppColors.whiteColor,
                            iconColor: AppColors.primaryColor,
                          ),
                        ),
                        
                      ],
                    ),

                    const SizedBox(height: AppSizes.spaceBetweenItems,),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: AppSizes.md),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Driftwood Apartment",
                                  style: context.txtTheme.titleLarge,
                                ),
                                const SizedBox(height: AppSizes.xs,),
                                Text(
                                  "100 Smart Street, LA, USA",
                                  style: context.txtTheme.bodySmall,
                                ),
                              ],
                            ),
                          ),

                          CustomButton(
                            onTap: () => Get.toNamed(AppRoutes.ownerMyApartmentUnitListRoute), 
                            width: 100.0,
                            borderRadius: 42.0,
                            text: AppStrings.editUnit
                          ),

                        ],
                      ),
                    ),


                    const SizedBox(height: AppSizes.spaceBetweenItems,),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: AppSizes.md),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            AppStrings.apartmetnImage,
                            style: context.txtTheme.titleLarge?.copyWith(
                              decoration: TextDecoration.underline,
                              decorationColor: AppColors.primaryColor,
                              decorationThickness: 1.0
                            ),
                          ),
                          IconButton(
                            onPressed: (){
                              controller.isApartmentImageShow.value = !controller.isApartmentImageShow.value;
                            },
                            icon: Obx(() => Icon(!controller.isApartmentImageShow.value ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_up))
                          )
                        ],
                      ),
                    ),

                    Obx(
                      () => SizedBox(
                        height: 100.0,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: AppSizes.screenHorizontal),
                          child: ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: 8,
                            separatorBuilder: (_, _) => const SizedBox(width: AppSizes.md,),
                            itemBuilder: (_, int index){
                              return Stack(
                                children: <Widget>[
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(AppSizes.borderRadiusMd),
                                    child: CustomNetworkImage(
                                      imageUrl: MaintenanceModel.issueImage, 
                                      height: 100.0, 
                                      width: 100.0,
                                      boxShape: BoxShape.rectangle,
                                    ),
                                  ),
                                  
                                  Positioned(
                                    top: 5,
                                    right: 5,
                                    child: CustomRoundedInnerIcon(
                                      onTap: (){
                                        CustomBottomSheet.showCustomBottomSheet(
                                          context: context, 
                                          child: DeleteBottomSheet(onDeleteCallBack: () => Get.back())
                                        );
                                      },
                                      icon: AppIcons.deleteIcon,
                                      bgColor: AppColors.whiteColor,
                                      iconColor: AppColors.primaryColor,
                                    ),
                                  ),
                                ],
                              );
                            }
                          ),
                        ),
                      ).visible(controller.isApartmentImageShow.value),
                    ),

                    const SizedBox(height: AppSizes.spaceBetweenItems,),
                  ],
                ),
              ),

              const SizedBox(height: AppSizes.spaceBetweenItems,),
            ],
          ),
        )
      ),
    );
  }
}
