import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/config/app_sizes.dart';
import 'package:alora/core/config/app_strings.dart';
import 'package:alora/core/utils/image_picker_utils.dart';
import 'package:alora/core/widgets/custom_app_bar.dart';
import 'package:alora/core/widgets/custom_button.dart';
import 'package:alora/shared/widgets/custom_file_upload_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/owner_documents_controller.dart';

class OwnerCreateDocumentsScreen extends GetView<OwnerDocumentsController> {
  const OwnerCreateDocumentsScreen({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    controller.uploadedFile.value = null;
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
                  file: controller.uploadedFile.value,
                  onBrowseCallback: () async{  
                    controller.uploadedFile.value = await ImagePickerUtils.pickImageFile();
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
