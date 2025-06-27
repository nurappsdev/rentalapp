import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/config/app_icons.dart';
import 'package:alora/core/config/app_sizes.dart';
import 'package:alora/core/config/app_strings.dart';
import 'package:alora/core/extensions/context_extensions.dart';
import 'package:alora/core/extensions/widget_extensions.dart';
import 'package:alora/core/routes/app_routes.dart';
import 'package:alora/features/crew/maintenance/controllers/maintenance_controller.dart';
import 'package:alora/features/owner/owner_renter_list/controllers/owner_renter_list_controller.dart';
import 'package:alora/features/profile/controllers/profile_controller.dart';
import 'package:alora/features/renter/renter_documents/controllers/renter_documents_controller.dart';
import 'package:alora/features/renter/renter_documents/widgets/document_shimmer.dart';
import 'package:alora/features/renter/renter_maintenance/controllers/renter_maintenance_controller.dart';
import 'package:alora/features/renter/renter_maintenance/widgets/request_card.dart';
import 'package:alora/features/renter/renter_maintenance/widgets/request_shimmer.dart';
import 'package:alora/shared/widgets/empty_maintenance.dart';
import 'package:alora/shared/widgets/maintenance_card.dart';
import 'package:alora/shared/widgets/maintenance_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CompletedDocument extends StatelessWidget {
  final ProfileController controller;
  const CompletedDocument({
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
            if(controller.completedDocumentsList.isEmpty){
              return SizedBox(
                width: context.screenWidth,
                height: context.screenHeight * .6,
                child: Text(
                  AppStrings.emptyCompleteDoc,
                  textAlign: TextAlign.center,
                  style: context.txtTheme.titleSmall,
                ).centered,
              );
            }
            else if(controller.compeletedDocumentsLoading.value){
              return const DocumentShimmer();
            }
            return ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.completedDocumentsList.length,
              itemBuilder: (_, int index){
                return Container(
                  alignment: Alignment.center,
                  width: context.screenWidth,
                  height: 200.0,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor.withValues(alpha: .3),
                    borderRadius: BorderRadius.circular(AppSizes.borderRadiusMd)
                  ),
                  child: SvgPicture.asset(
                    AppIcons.docIcon,
                    width: 32.0,
                    height: 32.0,
                    colorFilter: const ColorFilter.mode(AppColors.blackColor, BlendMode.srcATop),
                  ),
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