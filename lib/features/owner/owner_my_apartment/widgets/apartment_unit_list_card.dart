import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/config/app_icons.dart';
import 'package:alora/core/config/app_sizes.dart';
import 'package:alora/core/extensions/context_extensions.dart';
import 'package:alora/core/routes/app_routes.dart';
import 'package:alora/core/utils/custom_bottom_sheet.dart';
import 'package:alora/core/widgets/custom_network_image.dart';
import 'package:alora/core/widgets/custom_rounded_inner_icon.dart';
import 'package:alora/features/owner/owner_application_req/model/application_req_model.dart';
import 'package:alora/shared/widgets/delete_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class ApartmentUnitListCard extends StatelessWidget {
  final ApplicationReqModel applicationReq;
  final VoidCallback onPressCallback;
  const ApartmentUnitListCard({super.key, required this.applicationReq, required this.onPressCallback});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressCallback,
      child: Card(
        color: AppColors.whiteColor,
        child: Container(
           width: context.screenWidth,
           padding: const EdgeInsets.all(AppSizes.xs),
           decoration: BoxDecoration(
            border: Border.all(
              width: AppSizes.dividerThick,
              color: AppColors.borderColor
            )
          ),
          child: Stack(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(AppSizes.borderRadiusMd),
                    child: CustomNetworkImage(
                      imageUrl: applicationReq.image, 
                      height: 90.0, 
                      boxShape: BoxShape.rectangle,
                      width: double.infinity
                    ),
                  ),
                  const Divider(
                    color: AppColors.dividerColor,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        applicationReq.type,
                        style: context.txtTheme.titleMedium,
                      ),
                      Text(
                        "(${applicationReq.count})",
                        style: context.txtTheme.titleMedium,
                      ),
                    ],
                  ),
                    
                  const SizedBox(height: AppSizes.sm,)
                ],
              ),

              Positioned(
                top: 10,
                right: 10,
                child: Row(
                  spacing: AppSizes.sm,
                  children: <Widget>[
                    CustomRoundedInnerIcon(
                      icon: AppIcons.deleteIcon,
                      bgColor: AppColors.whiteColor,
                      containerSize: 32.0,
                      iconColor: AppColors.primaryColor,
                      onTap: (){
                        CustomBottomSheet.showCustomBottomSheet(
                          context: context, 
                          child: DeleteBottomSheet(
                            onDeleteCallBack: () => Get.back()
                          )
                        );
                      },
                    ),
                    CustomRoundedInnerIcon(
                      icon: AppIcons.editIcon,
                      containerSize: 32.0,
                      bgColor: AppColors.whiteColor,
                      iconColor: AppColors.primaryColor,
                      onTap: (){
                        Get.toNamed(AppRoutes.ownerMyApartmentUnitEditRoute);
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}