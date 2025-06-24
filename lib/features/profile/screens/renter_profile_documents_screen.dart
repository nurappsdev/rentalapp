import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/config/app_sizes.dart';
import 'package:alora/core/config/app_strings.dart';
import 'package:alora/core/widgets/custom_app_bar.dart';
import '../widgets/completed_document.dart';
import '../widgets/pending_document.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/profile_controller.dart';

class RenterProfileDocumentsScreen extends GetView<ProfileController> {
  const RenterProfileDocumentsScreen({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: const CustomAppBar(
        title: AppStrings.myDocuments,
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
                Tab(text: AppStrings.pendingDocuments),
                Tab(text: AppStrings.completedDocuments),
              ],
            ),

            const SizedBox(height: AppSizes.spaceBetweenItems,),

            Expanded(
              child: TabBarView(
                controller: controller.tabController,
                children: <Widget>[
                  PendingDocument(controller: controller),
                  CompletedDocument(controller: controller),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
