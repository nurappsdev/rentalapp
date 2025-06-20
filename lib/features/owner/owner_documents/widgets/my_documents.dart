import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/config/app_icons.dart';
import 'package:alora/core/config/app_sizes.dart';
import 'package:alora/core/config/app_strings.dart';
import 'package:alora/core/extensions/context_extensions.dart';
import 'package:alora/core/extensions/widget_extensions.dart';
import 'package:alora/core/routes/app_routes.dart';
import 'package:alora/core/utils/custom_bottom_sheet.dart';
import 'package:alora/core/widgets/custom_rounded_inner_icon.dart';
import 'package:alora/features/crew/maintenance/controllers/maintenance_controller.dart';
import 'package:alora/features/owner/owner_documents/controllers/owner_documents_controller.dart';
import 'package:alora/features/renter/renter_maintenance/controllers/renter_maintenance_controller.dart';
import 'package:alora/features/renter/renter_maintenance/widgets/request_card.dart';
import 'package:alora/features/renter/renter_maintenance/widgets/request_shimmer.dart';
import 'package:alora/features/renter/search_apartments/widget/apartments_shimmer.dart';
import 'package:alora/shared/features/side_drawer/widget/custom_side_drawer.dart';
import 'package:alora/shared/widgets/delete_bottom_sheet.dart';
import 'package:alora/shared/widgets/empty_maintenance.dart';
import 'package:alora/shared/widgets/maintenance_card.dart';
import 'package:alora/shared/widgets/maintenance_shimmer.dart';
import 'package:alora/shared/widgets/owner_apartment_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class MyDocuments extends StatelessWidget {
  final OwnerDocumentsController controller;
  const MyDocuments({
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
            // docuemnt list with handling loading and empty state
            Obx((){
              if(controller.singleApartment.value == null){
                return SizedBox(
                  width: context.screenWidth,
                  height: context.screenHeight * .6,
                  child: Text(
                    "Empty Documents",
                    textAlign: TextAlign.center,
                    style: context.txtTheme.titleSmall,
                  ).centered,
                );
              }
              else if(controller.singleApartmentLoading.value){
                return const ApartmentsShimmer();
              }
              return OwnerApartmentCard(
                apartment: controller.singleApartment.value!,
                isShowImage: false,
                appendWidget: Stack(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      width: context.screenWidth,
                      height: 200.0,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor.withValues(alpha: .3),
                        borderRadius: BorderRadius.circular(AppSizes.borderRadiusMd)
                      ),
                      child: SvgPicture.asset(
                        AppIcons.docIcon,
                        width: 20.0,
                        height: 20.0,
                        colorFilter: const ColorFilter.mode(AppColors.primaryColor, BlendMode.srcATop),
                      ),
                    ),

                    Positioned(
                      top: 10,
                      right: 10,
                      child: CustomRoundedInnerIcon(
                        onTap: () {
                          CustomBottomSheet.showCustomBottomSheet(
                            context: context, 
                            child: DeleteBottomSheet(onDeleteCallBack: () => Get.back())
                          );
                        },
                        icon: AppIcons.deleteIcon,
                        containerSize: 32.0,
                        bgColor: AppColors.whiteColor,
                        iconColor: AppColors.primaryColor,
                      )
                    ),

                    const SizedBox(height: AppSizes.spaceBetweenItems,),
                  ],
                ),
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
          onPressed: () => Get.toNamed(AppRoutes.ownerCreateDocumentsRoute),
          backgroundColor: Colors.transparent,
          child: const Icon(Icons.add, size: 28.0, color: AppColors.whiteColor,)
        ),
      ),
    );
  }
}