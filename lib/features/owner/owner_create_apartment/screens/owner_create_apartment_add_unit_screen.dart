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
import 'package:alora/core/widgets/custom_rounded_inner_icon.dart';
import 'package:alora/core/widgets/custom_text_field.dart';
import 'package:alora/shared/models/maintenance_model.dart';
import 'package:alora/shared/widgets/custom_file_upload_layout.dart';
import 'package:alora/shared/widgets/delete_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../controllers/owner_create_apartment_controller.dart';

class OwnerCreateApartmentAddUnitScreen extends GetView<OwnerCreateApartmentController> {
  const OwnerCreateApartmentAddUnitScreen({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surfaceColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSizes.screenHorizontal),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: AppSizes.spaceBetweenSections,),
                SvgPicture.asset(
                  AppIcons.onbaordingIcon
                ).centered,
            
                const SizedBox(height: AppSizes.spaceBetweenSections,),
            
                Text(
                  "Start adding units within your Apartment here.",
                  style: context.txtTheme.titleLarge,
                  textAlign: TextAlign.center,
                ).centered,
            
                const SizedBox(height: AppSizes.spaceBetweenSections,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  spacing: AppSizes.md,
                  children: <Widget>[
                    Expanded(child: CustomButton(onTap: () => Get.offAllNamed(AppRoutes.homeOwnerRoute), isOutline: true, text: "Return Home")),
                    Expanded(child: CustomButton(onTap: () => Get.toNamed(AppRoutes.ownerCreateApartmentCreateUnitFirstRoute), text: "Create Unit"))
                  ],
                ),

                const SizedBox(height: AppSizes.spaceBetweenSections,),
            
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
