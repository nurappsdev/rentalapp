import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/config/app_icons.dart';
import 'package:alora/core/config/app_sizes.dart';
import 'package:alora/core/config/app_strings.dart';
import 'package:alora/core/extensions/context_extensions.dart';
import 'package:alora/core/routes/app_routes.dart';
import 'package:alora/core/utils/custom_bottom_sheet.dart';
import 'package:alora/core/widgets/custom_button.dart';
import 'package:alora/core/widgets/custom_text_field.dart';
import 'package:alora/features/auth/controllers/change_password_controller.dart';
import 'package:alora/features/profile/controllers/profile_controller.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class EditProfileCard extends StatelessWidget {
  final ProfileController profileController;
  const EditProfileCard({
    super.key,
    required this.profileController
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSizes.screenHorizontal),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(AppSizes.borderRadiusXxxL)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          // form fields
          Card(
            color: AppColors.whiteColor,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(AppSizes.md),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSizes.borderRadiusMd),
                border: Border.all(
                  color: AppColors.greyColor,
                  width: AppSizes.dividerHeight
                )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    AppStrings.usernameLabel,
                    style: context.txtTheme.bodyMedium,
                  ),
                  const SizedBox(height: AppSizes.xs,),
                  Row(
                    children: <Widget>[
                      SvgPicture.asset(
                        AppIcons.userIcon,
                        height: 24.0,
                        width: 24.0,
                      ),

                      const SizedBox(width: AppSizes.sm,),

                      Container(
                        height: 20.0,
                        width: 2.0,
                        decoration: const BoxDecoration(
                          color: AppColors.dividerColor
                        ),
                      ),

                      Expanded(
                        child: CustomTextField(
                          contenpaddingVertical: 0.0,
                          contenpaddingHorizontal: 0.0,
                          controller: TextEditingController(),
                          hintText: AppStrings.oldPasswordHint,
                        ),
                      ),
                    ],
                  )

                ],
              ),
            ),
          ),

          const SizedBox(height: AppSizes.spaceBetweenInputs,),


          Card(
            color: AppColors.whiteColor,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(AppSizes.md),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSizes.borderRadiusMd),
                border: Border.all(
                  color: AppColors.greyColor,
                  width: AppSizes.dividerHeight
                )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    AppStrings.phoneNo,
                    style: context.txtTheme.bodyMedium,
                  ),
                  const SizedBox(height: AppSizes.xs,),
                  Row(
                    children: <Widget>[
                      CountryCodePicker(
                        showFlag: true,
                        // showDropDownButton: true,
                        initialSelection: 'BD',
                        padding: EdgeInsets.zero,
                        pickerStyle: PickerStyle.bottomSheet,
                        onInit:  (CountryCode? code) {
                          if(code != null){
                            // controller.countryCodeSIGNUP = code.dialCode;
                          }
                        },
                        onChanged: (CountryCode code) {
                          // controller.countryCodeSIGNUP = code.dialCode;
                        },
                      ),

                      Container(
                        height: 20.0,
                        width: 2.0,
                        decoration: const BoxDecoration(
                          color: AppColors.dividerColor
                        ),
                      ),

                      Expanded(
                        child: CustomTextField(
                          contenpaddingVertical: 0.0,
                          contenpaddingHorizontal: 0.0,
                          controller: TextEditingController(),
                          hintText: AppStrings.phoneNoHint,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  )

                ],
              ),
            ),
          ),
          const SizedBox(height: AppSizes.spaceBetweenInputs,),


          Card(
            color: AppColors.whiteColor,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(AppSizes.md),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSizes.borderRadiusMd),
                border: Border.all(
                  color: AppColors.greyColor,
                  width: AppSizes.dividerHeight
                )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    AppStrings.location,
                    style: context.txtTheme.bodyMedium,
                  ),
                  const SizedBox(height: AppSizes.xs,),
                  Row(
                    children: <Widget>[
                      SvgPicture.asset(
                        AppIcons.locationPrefixIcon,
                        height: 24.0,
                        width: 24.0,
                      ),

                      const SizedBox(width: AppSizes.sm,),

                      Container(
                        height: 20.0,
                        width: 2.0,
                        decoration: const BoxDecoration(
                          color: AppColors.dividerColor
                        ),
                      ),

                      Expanded(
                        child: CustomTextField(
                          contenpaddingVertical: 0.0,
                          contenpaddingHorizontal: 0.0,
                          controller: TextEditingController(),
                          hintText: AppStrings.locationHint,
                        ),
                      ),
                    ],
                  )

                ],
              ),
            ),
          ),

          const SizedBox(height: AppSizes.spaceBetweenSections,),
          
        ],
      ),
    );
  }
}

