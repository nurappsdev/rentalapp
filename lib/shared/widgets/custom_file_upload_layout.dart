import 'dart:io';

import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/config/app_icons.dart';
import 'package:alora/core/config/app_sizes.dart';
import 'package:alora/core/config/app_strings.dart';
import 'package:alora/core/extensions/context_extensions.dart';
import 'package:alora/core/widgets/custom_button.dart';
import 'package:alora/core/widgets/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class CustomFileUploadLayout extends StatelessWidget {
  final String title;
  final String label;
  final String subTitle;
  final String icon;
  final String btnText;
  final VoidCallback onBrowseCallback;
  final File? file;

  const CustomFileUploadLayout({
    super.key,
    required this.label,
    required this.onBrowseCallback,
    this.file,
    this.icon = AppIcons.uploadIcon,
    this.title = AppStrings.dropFileOrBrowse,
    this.subTitle = AppStrings.formatFile,
    this.btnText = AppStrings.browseFile,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.screenWidth,
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.md),
      decoration: BoxDecoration(
        border: Border.all(
          width: AppSizes.dividerThick,
          color: AppColors.borderColor
        ),
        borderRadius: BorderRadius.circular(AppSizes.borderRadiusLg),
      ),
      child: Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: AppSizes.spaceBetweenInputs,),
        
            Text(
              label,
              style: context.textTheme.bodyMedium
            ),
            const SizedBox(height: AppSizes.md,),


            if(file != null)
              Material(
              elevation: 1,
              borderRadius: BorderRadius.circular(AppSizes.borderRadiusLg),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.primaryColor, width: 1.0),
                  borderRadius: BorderRadius.circular(AppSizes.borderRadiusLg),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(AppSizes.borderRadiusLg),
                  child: Image.file(
                    file!,
                    height: 200.0,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            )
            else DottedBorder(
              borderColor: AppColors.primaryColor,
              gap: 6.0,
              strokeWidth: 2.0,
              child:  Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: AppSizes.md),
                child: Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const SizedBox(height: AppSizes.spaceBetweenSections,),
    
                      SvgPicture.asset(
                        icon,
                        width: 24.0,
                        height: 24.0,
                      ),
                  
                      const SizedBox(height: AppSizes.md,),
    
                      Text(
                        title,
                        textAlign: TextAlign.center,
                        style: context.textTheme.bodyMedium
                      ),
                      const SizedBox(height: AppSizes.md,),
                  
                      Text(
                        subTitle,
                        textAlign: TextAlign.center,
                        style: context.textTheme.bodyMedium
                      ),

                      const SizedBox(height: AppSizes.md,),

                      CustomButton(
                        onTap: onBrowseCallback, 
                        text: btnText,
                        borderRadius: AppSizes.borderRadiusMd,
                        width: 100.0,
                        height: 35.0,
                      ),
    
                      const SizedBox(height: AppSizes.spaceBetweenSections,),
                    ],
                  ),
                ),
              )
            ),
    
            const SizedBox(height: AppSizes.spaceBetweenInputs,),
          ],
        ),
      ),
    );
  }
}
