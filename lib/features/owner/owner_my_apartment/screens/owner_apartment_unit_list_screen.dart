import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/config/app_sizes.dart';
import 'package:alora/core/config/app_strings.dart';
import 'package:alora/core/extensions/context_extensions.dart';
import 'package:alora/core/extensions/widget_extensions.dart';
import 'package:alora/core/routes/app_routes.dart';
import 'package:alora/core/widgets/custom_app_bar.dart';
import 'package:alora/features/owner/owner_application_req/widgets/application_req_card.dart';
import 'package:alora/features/owner/owner_application_req/widgets/application_req_shimmer.dart';
import 'package:alora/features/owner/owner_my_apartment/widgets/apartment_unit_list_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/owner_my_apartment_controller.dart';

class OwnerApartmentUnitListScreen extends GetView<OwnerMyApartmentController> {
  const OwnerApartmentUnitListScreen({
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
                if(controller.unitListLoading.value){
                  return const ApplicationReqShimmer();
                }
                else if(controller.unitList.isEmpty){
                  return SizedBox(
                    height: context.screenHeight * .8,
                    width: context.screenWidth,
                    child: Text(
                      "Unit list are empty",
                      style: context.txtTheme.titleSmall,
                    ).centered,
                  );
                }
                return ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.unitList.length,
                  itemBuilder: (_, int index){
                    return ApartmentUnitListCard(
                      applicationReq: controller.unitList[index],
                      onPressCallback: (){
                        Get.toNamed(
                          AppRoutes.ownerMyApartmentUnitDetailsRoute,
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
        ),
      ),
    );
  }
}
