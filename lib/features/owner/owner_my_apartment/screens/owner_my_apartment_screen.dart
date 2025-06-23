import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/config/app_icons.dart';
import 'package:alora/core/config/app_sizes.dart';
import 'package:alora/core/config/app_strings.dart';
import 'package:alora/core/extensions/context_extensions.dart';
import 'package:alora/core/extensions/widget_extensions.dart';
import 'package:alora/core/routes/app_routes.dart';
import 'package:alora/core/widgets/custom_app_bar.dart';
import 'package:alora/core/widgets/custom_rounded_inner_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/owner_my_apartment_controller.dart';

class OwnerMyApartmentScreen extends GetView<OwnerMyApartmentController> {
  const OwnerMyApartmentScreen({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: AppStrings.myApartment,
        showBackBtn: true,
        elevation: 0.0,
        backgroundColor: AppColors.whiteColor,
      ),
      backgroundColor: AppColors.surfaceColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.screenHorizontal),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
             SingleChildScrollView(
              scrollDirection: Axis.horizontal,
               child: SizedBox(
                height: 180.0,
                 child: Row(
                  spacing: AppSizes.spaceBetweenItems,
                  children: <Widget>[
                     AparmentCard(
                      onPressCallback:() {
                        Get.toNamed(AppRoutes.ownerMyApartmentListRoute);
                      },
                      text: "Edit Apartment",
                    ),
                 
                    AparmentCard(
                      onPressCallback:() {
                        Get.toNamed(AppRoutes.ownerDocumentsRoute);
                      },
                      text: AppStrings.myDocuments,
                    )
                  ],
                 ),
               ),
             )
            ],
          ),
        )
      ),
    );
  }
}

class AparmentCard extends StatelessWidget {
  final String text;
  final String svgAsset;
  final VoidCallback onPressCallback;

  const AparmentCard({
    super.key,
    required this.onPressCallback,
    required this.text,
    this.svgAsset = AppIcons.docIcon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressCallback,
      behavior: HitTestBehavior.opaque,
      child: Card(
        elevation: 2.0,
        color: AppColors.whiteColor,
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: AppColors.borderColor,
            width: 1
          ),
          borderRadius: BorderRadius.circular(AppSizes.borderRadiusMd)
        ),
        child: SizedBox(
          width: 180,
          height: 150,
          child: Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
              Positioned(
                top: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  width: double.infinity,
                  height: 80.0,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor.withValues(alpha: 0.5),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(150),
                      bottomRight: Radius.circular(150)
                    )
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CustomRoundedInnerIcon(
                    icon: svgAsset,
                    bgColor: AppColors.primaryColor,
                    iconColor: AppColors.whiteColor,
                    containerSize: 48.0,
                  ),
                  const SizedBox(height: AppSizes.spaceBetweenSections,),
                  Text(
                    text,
                    style: context.txtTheme.bodyLarge,
                  )
                ],
              ).centered,
            ],
          ),
        ),
      ),
    );
  }
}
