import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/config/app_icons.dart';
import 'package:alora/core/config/app_sizes.dart';
import 'package:alora/core/config/app_strings.dart';
import 'package:alora/core/extensions/context_extensions.dart';
import 'package:alora/core/extensions/widget_extensions.dart';
import 'package:alora/core/routes/app_routes.dart';
import 'package:alora/core/widgets/custom_network_image.dart';
import 'package:alora/features/crew/maintenance/controllers/maintenance_controller.dart';
import 'package:alora/features/owner/owner_documents/controllers/owner_documents_controller.dart';
import 'package:alora/features/owner/owner_maintenance/controllers/owner_maintenance_controller.dart';
import 'package:alora/features/renter/renter_maintenance/controllers/renter_maintenance_controller.dart';
import 'package:alora/features/renter/renter_maintenance/widgets/request_card.dart';
import 'package:alora/features/renter/renter_maintenance/widgets/request_shimmer.dart';
import 'package:alora/features/renter/search_apartments/widget/apartments_shimmer.dart';
import 'package:alora/shared/models/maintenance_model.dart';
import 'package:alora/shared/widgets/empty_maintenance.dart';
import 'package:alora/shared/widgets/maintenance_card.dart';
import 'package:alora/shared/widgets/maintenance_shimmer.dart';
import 'package:alora/shared/widgets/owner_apartment_card.dart';
import 'package:alora/shared/widgets/owner_maintenance_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class PastRequest extends StatelessWidget {
  final OwnerMaintenanceController controller;
  const PastRequest({
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
            // maintenance list with handling loading and empty state
            Obx((){
              if(controller.maintenances.isEmpty){
                return SizedBox(
                  width: context.screenWidth,
                  height: context.screenHeight * .6,
                  child: Text(
                    "Empty List",
                    textAlign: TextAlign.center,
                    style: context.txtTheme.titleSmall,
                  ).centered,
                );
              }
              else if(controller.apartmentsLoading.value){
                return const ApartmentsShimmer();
              }

              return ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.maintenances.length,
                itemBuilder: (_, int index){
                  return OwnerMaintenanceCard(
                    maintenance: controller.maintenances[index],
                    type: "resolved",
                    onViewCallback: () => Get.toNamed(
                      AppRoutes.ownerMaintenanceDetailsRoute, 
                      arguments: <String, String>{
                        "maintenance_id": controller.maintenances[index].id,
                        "type": "past"
                      }
                    ),
                  );
                },
                separatorBuilder: (_, _) => const SizedBox(height: AppSizes.spaceBetweenItems,),
              );
            }),
        
            const SizedBox(height: AppSizes.spaceBetweenSections,),
          ],
        ),
      ),
    );
  }

}