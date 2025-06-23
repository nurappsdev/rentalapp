import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/config/app_sizes.dart';
import 'package:alora/core/config/app_strings.dart';
import 'package:alora/core/extensions/context_extensions.dart';
import 'package:alora/core/extensions/widget_extensions.dart';
import 'package:alora/core/routes/app_routes.dart';
import 'package:alora/core/widgets/custom_app_bar.dart';
import 'package:alora/features/owner/owner_application_req/widgets/unit_card.dart';
import 'package:alora/features/renter/search_apartments/widget/apartments_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/owner_application_req_controller.dart';

class OwnerApplicationReqUnitListScreen extends GetView<OwnerApplicationReqController> {
  const OwnerApplicationReqUnitListScreen({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    controller.handleRetriveUnitList();
    return Scaffold(
      appBar: const CustomAppBar(
        title: AppStrings.unitList,
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
              // maintenence list with handling loading and empty state
              Obx((){
                if(controller.applicationReqList.isEmpty){
                  return SizedBox(
                    height: context.screenHeight * .8,
                    width: context.screenWidth,
                    child: Text(
                      "Unit list are empty",
                      style: context.txtTheme.titleSmall,
                    ).centered,
                  );
                }
                else if(controller.applicationReqLoading.value){
                  return const ApartmentsShimmer();
                }
                return ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.apartmentList.length,
                  itemBuilder: (_, int index){
                    return UnitCard(
                      type: "view",
                      apartment: controller.apartmentList[index],
                      onViewCallback: (){
                        Get.toNamed(
                          AppRoutes.ownerApplicationReqUnitDetailsRoute,
                          arguments: <String, String>{
                            "id": controller.apartmentList[index].id
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
        ),
      ),
    );
  }
}
