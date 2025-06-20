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
import 'package:alora/core/widgets/custom_text_field.dart';
import 'package:alora/features/owner/owner_maintenance_crew/models/maintenance_crew_model.dart';
import 'package:alora/features/owner/owner_maintenance_crew/widgets/crew_card.dart';
import 'package:alora/features/owner/owner_maintenance_crew/widgets/crew_shimmer.dart';
import 'package:alora/features/owner/owner_maintenance_crew/widgets/empty_crew.dart';
import 'package:flutter_svg/svg.dart';
import '../controllers/owner_maintenance_crew_controller.dart';
import 'package:alora/shared/widgets/delete_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OwnerMaintenanceCrewScreen extends GetView<OwnerMaintenanceCrewController> {
  const OwnerMaintenanceCrewScreen({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: AppStrings.maintenanceCrewList,
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

              const SizedBox(height: AppSizes.spaceBetweenItems,),

              CustomTextField(
                controller: TextEditingController(),
                isBorder: true,
                hintText: "Search Name",
                prefixIcon: SvgPicture.asset(AppIcons.searchIcon),
              ),

              const SizedBox(height: AppSizes.spaceBetweenItems,),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  CustomButton(
                    width: 100.0,
                    onTap: () => Get.toNamed(AppRoutes.ownerCreateMaintenanceCrewRoute), 
                    text: AppStrings.create
                  )
                ],
              ),

              const SizedBox(height: AppSizes.spaceBetweenItems,),
              
              // event list with handling loading and empty state
              Obx((){
                if(controller.crews.isEmpty){
                  return SizedBox(
                    width: context.screenWidth,
                    child: const EmptyCrew().centered,
                  );
                }
                else if(controller.crewsLoading.value){
                  return const CrewShimmer();
                }
                return ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.crews.length,
                  itemBuilder: (_, int index){
                    return CrewCard(
                      onViewCallback: () {
                        Get.toNamed(AppRoutes.ownerMaintenanceCrewDetailsRoute, arguments: <String, dynamic>{
                          "id": controller.crews[index].id
                        });
                      },
                      crew: controller.crews[index]
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
