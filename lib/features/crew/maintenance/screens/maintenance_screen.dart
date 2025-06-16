import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/config/app_sizes.dart';
import 'package:alora/core/config/app_strings.dart';
import 'package:alora/core/widgets/custom_app_bar.dart';
import 'package:alora/features/crew/maintenance/widgets/recent_maintenance.dart';
import 'package:alora/features/crew/maintenance/widgets/resolved_maintenance.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/maintenance_controller.dart';

class MaintenanceScreen extends GetView<MaintenanceController> {
  const MaintenanceScreen({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: AppStrings.myMaintenance,
        showBackBtn: true,
        elevation: 0.0,
      ),
      backgroundColor: AppColors.surfaceColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.screenHorizontal),
        child: Column(
          children: <Widget>[
          TabBar(
            controller: controller.tabController,
            tabs: const <Widget>[
              Tab(text: AppStrings.recentMaintenance),
              Tab(text: AppStrings.resolvedMaintenance),
            ],
          ),

          const SizedBox(height: AppSizes.spaceBetweenItems,),

          Expanded(
            child: TabBarView(
              controller: controller.tabController,
              children: <Widget>[
                RecentMaintenance(controller: controller),
                ResolvedMaintenance(controller: controller)
              ],
            ),
          ),
          ],
        ),
      ),
    );
  }
}
