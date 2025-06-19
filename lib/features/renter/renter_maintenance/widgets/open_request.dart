import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/config/app_sizes.dart';
import 'package:alora/core/config/app_strings.dart';
import 'package:alora/core/extensions/context_extensions.dart';
import 'package:alora/core/extensions/widget_extensions.dart';
import 'package:alora/core/routes/app_routes.dart';
import 'package:alora/features/crew/maintenance/controllers/maintenance_controller.dart';
import 'package:alora/features/renter/renter_maintenance/controllers/renter_maintenance_controller.dart';
import 'package:alora/features/renter/renter_maintenance/widgets/request_card.dart';
import 'package:alora/features/renter/renter_maintenance/widgets/request_shimmer.dart';
import 'package:alora/shared/widgets/empty_maintenance.dart';
import 'package:alora/shared/widgets/maintenance_card.dart';
import 'package:alora/shared/widgets/maintenance_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OpenRequest extends StatelessWidget {
  final RenterMaintenanceController controller;
  const OpenRequest({
    super.key,
    required this.controller
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surfaceColor,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // maintenence list with handling loading and empty state
            Obx((){
              if(controller.openMaintainanceList.isEmpty){
                return SizedBox(
                  width: context.screenWidth,
                  height: context.screenHeight * .6,
                  child: Text(
                    AppStrings.emptyOpenReqest,
                    textAlign: TextAlign.center,
                    style: context.txtTheme.titleSmall,
                  ).centered,
                );
              }
              else if(controller.openMaintenanceLoading.value){
                return const RequestShimmer();
              }
              return ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.openMaintainanceList.length,
                itemBuilder: (_, int index){
                  return RequestCard(
                    controller: controller,
                    maintenance: controller.openMaintainanceList[index],
                    isPast: false,
                    index: index,
                  );
                },
                separatorBuilder: (_, _) => const SizedBox(height: AppSizes.spaceBetweenItems,),
              );
            }),
        
            const SizedBox(height: AppSizes.spaceBetweenSections,),
          ],
        ),
      ),
      floatingActionButton: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: <Color>[
              Color(0XFF2CB5EB),
              Color.fromARGB(255, 19, 152, 204),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight
          )
        ),
        child: FloatingActionButton(
          onPressed: () => Get.toNamed(AppRoutes.renterMaintenanceCreateRoute),
          backgroundColor: Colors.transparent,
          child: const Icon(Icons.add, size: 28.0, color: AppColors.whiteColor,)
        ),
      ),
    );
  }
}