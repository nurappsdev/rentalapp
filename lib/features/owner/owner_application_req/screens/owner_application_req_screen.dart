import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/config/app_sizes.dart';
import 'package:alora/core/config/app_strings.dart';
import 'package:alora/core/extensions/context_extensions.dart';
import 'package:alora/core/extensions/widget_extensions.dart';
import 'package:alora/core/routes/app_routes.dart';
import 'package:alora/core/widgets/custom_app_bar.dart';
import 'package:alora/features/owner/owner_application_req/widgets/application_req_card.dart';
import 'package:alora/features/owner/owner_application_req/widgets/application_req_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/owner_application_req_controller.dart';

class OwnerApplicationReqScreen extends GetView<OwnerApplicationReqController> {
  const OwnerApplicationReqScreen({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: AppStrings.applicationReq,
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
                      "Application reqest list are empty",
                      style: context.txtTheme.titleSmall,
                    ).centered,
                  );
                }
                else if(controller.applicationReqLoading.value){
                  return const ApplicationReqShimmer();
                }
                return ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.applicationReqList.length,
                  itemBuilder: (_, int index){
                    return ApplicationReqCard(
                      applicationReq: controller.applicationReqList[index],
                      onPressCallback: (){
                        Get.toNamed(
                          AppRoutes.ownerApplicationReqUnitListRoute,
                          arguments: <String, String>{
                            "id": controller.applicationReqList[index].id
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
