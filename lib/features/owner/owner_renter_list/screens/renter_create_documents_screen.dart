import 'dart:io';

import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/config/app_sizes.dart';
import 'package:alora/core/config/app_strings.dart';
import 'package:alora/core/utils/image_picker_utils.dart';
import 'package:alora/core/widgets/custom_app_bar.dart';
import 'package:alora/core/widgets/custom_button.dart';
import 'package:alora/shared/widgets/custom_file_upload_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/owner_renter_list_controller.dart';

class RenterCreateDocumentsScreen extends GetView<OwnerRenterListController> {
  const RenterCreateDocumentsScreen({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        showBackBtn: true,
        elevation: 0.0,
        title: AppStrings.myDocuments,
        backgroundColor: AppColors.whiteColor,
      ),
      backgroundColor: AppColors.surfaceColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.screenHorizontal),
          child: Column(
            children: <Widget>[
              const SizedBox(height: AppSizes.md,),

              Obx(
                () => CustomFileUploadLayout(
                  label: 'Income tax doc', 
                  file: controller.uploadedDoc.value,
                  onBrowseCallback: () async{  
                    final File? file = await ImagePickerUtils.pickImageFile();
                    controller.uploadedDoc.value = file;
                  },
                ),
              ),

              const SizedBox(height: AppSizes.spaceBetweenSections,),

              CustomButton(
                onTap: () => Get.back(), 
                text: AppStrings.uploadDocuments
              )


            ],
          ),
        ),
      ),
    );
  }
}
