import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/config/app_icons.dart';
import 'package:alora/core/config/app_sizes.dart';
import 'package:alora/core/config/app_strings.dart';
import 'package:alora/core/extensions/context_extensions.dart';
import 'package:alora/core/utils/date_picker_utils.dart';
import 'package:alora/core/utils/image_picker_utils.dart';
import 'package:alora/core/widgets/custom_app_bar.dart';
import 'package:alora/core/widgets/custom_button.dart';
import 'package:alora/core/widgets/custom_text_field.dart';
import 'package:alora/shared/widgets/custom_file_upload_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../controllers/owner_event_controller.dart';

class OwnerCreateEventScreen extends GetView<OwnerEventController> {
  const OwnerCreateEventScreen({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: AppStrings.events,
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
              const SizedBox(height: AppSizes.spaceBetweenItems,),
              Container(
                width: context.screenWidth,
                padding: const EdgeInsets.symmetric(horizontal: AppSizes.md),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: AppSizes.dividerThick,
                    color: AppColors.borderColor
                  )
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: AppSizes.spaceBetweenItems,),
                    Text(
                      AppStrings.dateLabel,
                      style: context.txtTheme.titleMedium
                    ),
                    const SizedBox(height: AppSizes.md,),

                    CustomTextField(
                      controller: controller.dateCTRL,
                      isBorder: true,
                      readOnly: true,
                      borderRadius: 12.0,
                      suffixIcons: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(AppIcons.dateIcon),
                      ),
                      prefixIconCallBack: () async{
                        final String? date = await DatePickerUtils.pickFormatedDate(context: context);
                        if(date != null){
                          controller.dateCTRL.text = date;
                        }
                      },
                      onTab: () async{
                        final String? date = await DatePickerUtils.pickFormatedDate(context: context);
                        if(date != null){
                          controller.dateCTRL.text = date;
                        }
                      },
                    ),


                    const SizedBox(height: AppSizes.spaceBetweenItems,),
                    Text(
                      "Title",
                      style: context.txtTheme.titleMedium
                    ),
                    const SizedBox(height: AppSizes.md,),

                    CustomTextField(
                      controller: controller.titleCTRL,
                      isBorder: true,
                      borderRadius: 12.0,
                    ),

                    const SizedBox(height: AppSizes.spaceBetweenItems,),
                    Text(
                      "Description",
                      style: context.txtTheme.titleMedium
                    ),
                    const SizedBox(height: AppSizes.md,),

                    CustomTextField(
                      controller: controller.descriptionCTRL,
                      isBorder: true,
                      borderRadius: 12.0,
                      minLines: 5,
                      maxLines: 10,
                    ),

                    const SizedBox(height: AppSizes.spaceBetweenItems,),

                    Obx(
                      () => CustomFileUploadLayout(
                        label: 'Event Image', 
                        file: controller.eventImage.value,
                        onBrowseCallback: () async{  
                          controller.eventImage.value = await ImagePickerUtils.pickImageFile();
                        },
                      ),
                    ),

                    const SizedBox(height: AppSizes.spaceBetweenSections,),

                    CustomButton(
                      onTap: () => Get.back(), 
                      text: AppStrings.submit
                    ),
                    
                    const SizedBox(height: AppSizes.spaceBetweenItems,),
                  ],
                ),
              ),
              const SizedBox(height: AppSizes.spaceBetweenSections,),
            ],
          ),
        ),
      ),
    );
  }
}
