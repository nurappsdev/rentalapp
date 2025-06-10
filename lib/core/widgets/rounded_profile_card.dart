import 'dart:io';
import 'package:flutter/material.dart';
import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/config/app_sizes.dart';
import 'package:alora/core/utils/helper_method.dart';
import 'package:alora/core/widgets/custom_network_image.dart';
import 'package:alora/core/widgets/custom_rounded_inner_icon.dart';

class RoundedProfileImage extends StatelessWidget {
  const RoundedProfileImage({
    super.key,
    this.isEdit = false,
    this.imageUrl,
    this.imageFile,
    this.width = 148.0,
    this.height = 148.0,
    this.borderWidth = 5.0,
    this.borderColor = AppColors.greyColor,
    this.editProfile = HelperMethod.emptyCallback,
  });

  final bool isEdit;
  final String? imageUrl;
  final File? imageFile;
  final double width;
  final double height;
  final double borderWidth;
  final Color borderColor;
  final VoidCallback editProfile;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Stack(
          clipBehavior: Clip.none,
          children: <Widget>[
            Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                  border: Border.all(
                      width: borderWidth,
                      color: borderColor,
                  ),
                  shape: BoxShape.circle
              ),
              child: ClipOval(
                child: imageFile != null ?
                Image.file(
                  imageFile!,
                  fit: BoxFit.cover,
                ) : CustomNetworkImage(
                    width: width,
                    height: height,
                    imageUrl:  imageUrl != null ? imageUrl! : ""
                ),
              ),
            ),
            if (isEdit) Positioned(
                bottom: 5,
                right: 8,
                child: CustomRoundedInnerIcon(
                  icon: "AppIcons.editIcon",
                  borderColor: AppColors.blackColor,
                  bgColor: AppColors.whiteColor,
                  isBorder: true,
                  iconColor: AppColors.blackColor,
                  iconSize: AppSizes.iconMd,
                  containerSize: 32,
                  onTap: editProfile,
                )
            ) else const SizedBox(),
          ],
        ),
      ],
    );
  }
}