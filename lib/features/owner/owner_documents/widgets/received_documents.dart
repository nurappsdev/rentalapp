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
import 'package:alora/features/renter/renter_maintenance/controllers/renter_maintenance_controller.dart';
import 'package:alora/features/renter/renter_maintenance/widgets/request_card.dart';
import 'package:alora/features/renter/renter_maintenance/widgets/request_shimmer.dart';
import 'package:alora/features/renter/search_apartments/widget/apartments_shimmer.dart';
import 'package:alora/shared/models/maintenance_model.dart';
import 'package:alora/shared/widgets/empty_maintenance.dart';
import 'package:alora/shared/widgets/maintenance_card.dart';
import 'package:alora/shared/widgets/maintenance_shimmer.dart';
import 'package:alora/shared/widgets/owner_apartment_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ReceivedDocuments extends StatelessWidget {
  final OwnerDocumentsController controller;
  const ReceivedDocuments({
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
                appendWidget: Column(
                  children: <Widget>[
                    const SizedBox(height: AppSizes.spaceBetweenItems,),

                    userdetails(context),

                    const SizedBox(height: AppSizes.spaceBetweenItems,),

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

                    const SizedBox(height: AppSizes.spaceBetweenItems,),
                  ],
                ),
              );
            }),
        
            const SizedBox(height: AppSizes.spaceBetweenSections,),
          ],
        ),
      ),
    );
  }

  Column userdetails(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[

        Text(
          AppStrings.userDetails,
          style: context.txtTheme.titleMedium,
        ),

         const SizedBox(height: AppSizes.md,),

        Row(
          children: <Widget>[
            SvgPicture.asset(
              AppIcons.userNamePrefixIcon,
              width: 24.0,
              height: 24.0,
            ),
            const SizedBox(width: AppSizes.md,),

            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  AppStrings.name,
                  style: context.txtTheme.labelSmall,
                ),
            
                const SizedBox(height: AppSizes.xs,),
            
                Text(
                  "Alax tom",
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: context.txtTheme.bodySmall,
                )
              ],
            ),
          ],
        ),

        const SizedBox(height: AppSizes.spaceBetweenItems,),

        Row(
          children: <Widget>[
            CustomNetworkImage(
              imageUrl: MaintenanceModel.userImage, 
              height: 30, 
              width: 30
            ),
            const SizedBox(width: AppSizes.md,),

            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  AppStrings.email,
                  style: context.txtTheme.labelSmall,
                ),
            
                const SizedBox(height: AppSizes.xs,),
            
                Text(
                  "support@gmail.com",
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: context.txtTheme.bodySmall,
                )
              ],
            ),
          ],
        ),

        const SizedBox(height: AppSizes.spaceBetweenItems,),

        Row(
          children: <Widget>[
            SvgPicture.asset(
              AppIcons.phonePrefixIcon,
              width: 24.0,
              height: 24.0,
            ),
            const SizedBox(width: AppSizes.md,),

            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  AppStrings.phoneNo,
                  style: context.txtTheme.labelSmall,
                ),
            
                const SizedBox(height: AppSizes.xs,),
            
                Text(
                  "123782892",
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: context.txtTheme.bodySmall,
                )
              ],
            ),
          ],
        ),

        const SizedBox(height: AppSizes.spaceBetweenItems,),

      ],
    );
  }
}