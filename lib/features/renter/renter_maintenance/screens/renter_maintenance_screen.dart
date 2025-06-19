import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/config/app_sizes.dart';
import 'package:alora/core/config/app_strings.dart';
import 'package:alora/core/widgets/custom_app_bar.dart';
import 'package:alora/features/renter/renter_maintenance/widgets/open_request.dart';
import 'package:alora/features/renter/renter_maintenance/widgets/past_request.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/renter_maintenance_controller.dart';

class RenterMaintenanceScreen extends GetView<RenterMaintenanceController> {
  const RenterMaintenanceScreen({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: const CustomAppBar(
        title: AppStrings.maintenance,
        showBackBtn: true,
        elevation: 0.0,
        backgroundColor: AppColors.whiteColor,
      ),
      backgroundColor: AppColors.surfaceColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.screenHorizontal),
        child: Column(
          children: <Widget>[
          TabBar(
            controller: controller.tabController,
            tabs: const <Widget>[
              Tab(text: AppStrings.openRequest),
              Tab(text: AppStrings.pastRequest),
            ],
          ),

          const SizedBox(height: AppSizes.spaceBetweenItems,),

          Expanded(
            child: TabBarView(
              controller: controller.tabController,
              children: <Widget>[
                OpenRequest(controller: controller),
                PastRequest(controller: controller),
              ],
            ),
          ),
          ],
        ),
      ),
    );
  }
}
