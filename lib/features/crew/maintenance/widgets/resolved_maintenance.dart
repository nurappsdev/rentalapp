import 'package:alora/core/config/app_sizes.dart';
import 'package:alora/core/extensions/widget_extensions.dart';
import 'package:alora/core/routes/app_routes.dart';
import 'package:alora/features/crew/maintenance/controllers/maintenance_controller.dart';
import 'package:alora/shared/widgets/empty_maintenance.dart';
import 'package:alora/shared/widgets/maintenance_card.dart';
import 'package:alora/shared/widgets/maintenance_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResolvedMaintenance extends StatelessWidget {
  final MaintenanceController controller;
  const ResolvedMaintenance({
    super.key,
    required this.controller
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          // maintenance list with handling loading and empty state
          Obx((){
            if(controller.maintenanceList.isEmpty){
              return const EmptyMaintenance().centered;
            }
            else if(controller.maintenanceLoading.value){
              return const MaintenanceShimmer();
            }
            return ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.maintenanceList.length,
              itemBuilder: (_, int index){
                return MaintenanceCard(
                  maintenanceModel: controller.maintenanceList[index],
                  type: "maintenance_resolved",
                  onCompleteCallback: () { },
                  onViewCallback: () => Get.toNamed(
                    AppRoutes.maintenanceDetailsRoute, 
                    arguments: <String, String>{
                      "maintenance_id": controller.maintenanceList[index].id,
                      "type": "maintenance_resolved"
                    }
                  ),
                  onAcceptCallback: () {  },
                );
              },
              separatorBuilder: (_, _) => const SizedBox(height: AppSizes.spaceBetweenItems,),
            );
          }),
      
          const SizedBox(height: AppSizes.spaceBetweenSections,),
        ],
      ),
    );
  }
}