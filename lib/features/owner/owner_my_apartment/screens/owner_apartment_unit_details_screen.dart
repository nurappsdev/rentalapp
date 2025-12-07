import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/config/app_sizes.dart';
import 'package:alora/core/config/app_strings.dart';
import 'package:alora/core/extensions/context_extensions.dart';
import 'package:alora/core/extensions/widget_extensions.dart';
import 'package:alora/core/routes/app_routes.dart';
import 'package:alora/core/widgets/custom_app_bar.dart';
import 'package:alora/features/owner/owner_my_apartment/widgets/apartment_unit_list_card.dart';
import 'package:alora/features/renter/search_apartments/widget/apartments_shimmer.dart';
import 'package:alora/shared/widgets/owner_apartment_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/owner_my_apartment_controller.dart';

class OwnerApartmentUnitDetailsScreen extends GetView<OwnerMyApartmentController> {
  const OwnerApartmentUnitDetailsScreen({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    controller.handleRetrieveUnitListDetails();
    return Scaffold(
      appBar: const CustomAppBar(
        title: AppStrings.unitDetailsList,
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
             Obx((){
                if(controller.unitListDetails.isEmpty){
                  return SizedBox(
                    height: context.screenHeight * .8,
                    width: context.screenWidth,
                    child: Text(
                      "Unit list details are empty",
                      style: context.txtTheme.titleSmall,
                    ).centered,
                  );
                }
                else if(controller.unitDetailsLoading.value){
                  return const ApartmentsShimmer();
                }
                return ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.unitListDetails.length,
                  itemBuilder: (_, int index){
                    return OwnerApartmentCard(
                      apartment: controller.unitListDetails[index],
                      type: "edit",
                      onEditCallback: (){
                        Get.toNamed(
                          AppRoutes.ownerMyApartmentUnitDetailsEditRoute,
                          arguments: <String, String>{
                            "id": controller.unitList[index].id
                          }
                        );
                      }
                    );
                  },
                  separatorBuilder: (_, _) => const SizedBox(height: AppSizes.spaceBetweenItems,),
                );
              }),
          
              const SizedBox(height: AppSizes.spaceBetweenSections,),
            ],
          ),
        )
      ),
    );
  }
}
