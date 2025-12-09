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
import 'package:alora/core/widgets/custom_network_image.dart';
import 'package:alora/core/widgets/custom_text_field.dart';
import 'package:alora/features/owner/owner_maintenance_crew/models/maintenance_crew_model.dart';
import 'package:alora/features/owner/owner_maintenance_crew/widgets/crew_card.dart';
import 'package:alora/features/owner/owner_maintenance_crew/widgets/crew_shimmer.dart';
import 'package:alora/features/owner/owner_maintenance_crew/widgets/empty_crew.dart';
import 'package:alora/shared/models/maintenance_model.dart';
import 'package:flutter_svg/svg.dart';
import 'package:alora/shared/widgets/delete_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/renter_request_controller.dart';

class RenterRequestScreen extends GetView<RenterRequestController> {
  const RenterRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Property Request",
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
              const SizedBox(height: AppSizes.spaceBetweenItems),

              CustomTextField(
                controller: TextEditingController(),
                isBorder: true,
                hintText: "Search Property",
                prefixIcon: SvgPicture.asset(AppIcons.searchIcon),
              ),

              const SizedBox(height: AppSizes.spaceBetweenItems),

              // event list with handling loading and empty state
              GestureDetector(
                onTap: () {
                  CustomBottomSheet.showCustomBottomSheet(
                    context: context,
                    child: const RequestBottomSheet(),
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  width: context.screenWidth,
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSizes.sm,
                    vertical: AppSizes.md,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppSizes.borderRadiusMd),
                    border: Border.all(width: .5, color: AppColors.dividerColor),
                  ),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(AppSizes.borderRadiusMd),
                            child: CustomNetworkImage(
                              imageUrl: MaintenanceModel.maintenanceImage,
                              height: 50.0,
                              boxShape: BoxShape.rectangle,
                              width: 50.0,
                            ),
                          ),

                          const SizedBox(width: AppSizes.sm),

                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Sat 12 April 2025  8.30 PM ",
                                  style: context.txtTheme.labelMedium,
                                ),

                                const SizedBox(height: AppSizes.xs),

                                Text("Driftwood property", style: context.txtTheme.titleMedium),
                                const SizedBox(height: AppSizes.xs),
                                Text(
                                  "100 Smart Street, LA, USA",
                                  style: context.txtTheme.labelMedium,
                                ),
                                const SizedBox(height: AppSizes.xs),
                                Text("Studio Room", style: context.txtTheme.labelMedium),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Row(
                          spacing: AppSizes.md,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                CustomBottomSheet.showCustomBottomSheet(
                                  context: context,
                                  child: const RequestBottomSheet(),
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: AppSizes.sm,
                                  vertical: AppSizes.sm,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 3, 156, 9),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Text(
                                  "Request Approved",
                                  style: context.txtTheme.labelSmall?.copyWith(
                                    color: AppColors.textWhiteColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: AppSizes.spaceBetweenSections),
            ],
          ),
        ),
      ),
    );
  }
}

class RequestBottomSheet extends StatelessWidget {
  const RequestBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text("Accept the property you like.", style: context.txtTheme.titleMedium),

        const SizedBox(height: AppSizes.spaceBetweenItems),

        Container(
          alignment: Alignment.center,
          width: context.screenWidth,
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.sm, vertical: AppSizes.md),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSizes.borderRadiusMd),
            border: Border.all(width: .5, color: AppColors.dividerColor),
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(AppSizes.borderRadiusMd),
                    child: CustomNetworkImage(
                      imageUrl: MaintenanceModel.maintenanceImage,
                      height: 50.0,
                      boxShape: BoxShape.rectangle,
                      width: 50.0,
                    ),
                  ),

                  const SizedBox(width: AppSizes.sm),

                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Sat 12 April 2025  8.30 PM ", style: context.txtTheme.labelMedium),

                        const SizedBox(height: AppSizes.xs),

                        Text("Driftwood property", style: context.txtTheme.titleMedium),
                        const SizedBox(height: AppSizes.xs),
                        Text("100 Smart Street, LA, USA", style: context.txtTheme.labelMedium),
                        const SizedBox(height: AppSizes.xs),
                        Text("Studio Room", style: context.txtTheme.labelMedium),

                        const SizedBox(height: AppSizes.spaceBetweenItems),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            CustomButton(
                              onTap: () {
                                Get.back();
                              },
                              width: 100.0,
                              height: 40.0,
                              isOutline: true,
                              text: "Deny",
                            ),

                            const SizedBox(width: AppSizes.spaceBetweenItems),

                            CustomButton(
                              onTap: () {
                                Get.offAllNamed(AppRoutes.homeRenterRoute);
                              },
                              width: 100.0,
                              height: 40.0,
                              text: "Accept",
                            ),
                          ],
                        ),
                        const SizedBox(height: AppSizes.xs),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Row(
                  spacing: AppSizes.md,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSizes.sm,
                        vertical: AppSizes.sm,
                      ),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 3, 156, 9),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Text(
                        "Request Approved",
                        style: context.txtTheme.labelSmall?.copyWith(
                          color: AppColors.textWhiteColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
