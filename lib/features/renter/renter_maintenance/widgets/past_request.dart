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

class PastRequest extends StatelessWidget {
  final RenterMaintenanceController controller;
  const PastRequest({
    super.key,
    required this.controller
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          // maintenence list with handling loading and empty state
          Obx((){
            if(controller.pastMaintainanceList.isEmpty){
              return SizedBox(
                width: context.screenWidth,
                height: context.screenHeight * .6,
                child: Text(
                  AppStrings.emptyPastRequest,
                  textAlign: TextAlign.center,
                  style: context.txtTheme.titleSmall,
                ).centered,
              );
            }
            else if(controller.pastMaintenanceLoading.value){
              return const RequestShimmer();
            }
            return ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.pastMaintainanceList.length,
              itemBuilder: (_, int index){
                return RequestCard(
                  controller: controller,
                  maintenance: controller.pastMaintainanceList[index],
                  isPast: true,
                  index: index,
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