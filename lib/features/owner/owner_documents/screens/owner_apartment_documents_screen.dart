import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/config/app_sizes.dart';
import 'package:alora/core/config/app_strings.dart';
import 'package:alora/core/widgets/custom_app_bar.dart';
import 'package:alora/features/owner/owner_documents/widgets/my_documents.dart';
import 'package:alora/features/owner/owner_documents/widgets/received_documents.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/owner_documents_controller.dart';

class OwnerApartmentDocumentsScreen extends GetView<OwnerDocumentsController> {
  const OwnerApartmentDocumentsScreen({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? arguments = Get.arguments;
    controller.updateApartmentId = arguments?['id'];
    controller.handleRetriveSingleApartment();

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
              Tab(text: AppStrings.myDocumentsTab),
              Tab(text: AppStrings.receivedDocuments),
            ],
          ),

          const SizedBox(height: AppSizes.spaceBetweenItems,),

          Expanded(
            child: TabBarView(
              controller: controller.tabController,
              children: <Widget>[
                MyDocuments(controller: controller),
                ReceivedDocuments(controller: controller),
              ],
            ),
          ),
          ],
        ),
      ),
    );
  }
}
