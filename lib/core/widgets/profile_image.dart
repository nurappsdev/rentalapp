import 'dart:io';
import 'package:alora/core/config/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/config/app_sizes.dart';
import 'package:alora/core/utils/helper_method.dart';
import 'package:alora/core/widgets/custom_network_image.dart';
import 'package:alora/core/widgets/custom_rounded_inner_icon.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    super.key,
    this.isEdit = false,
    this.imageUrl,
    this.imageFile,
    this.boxShape = BoxShape.circle,
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
  final BoxShape boxShape;
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
                shape: boxShape,
                borderRadius: boxShape == BoxShape.circle ? null : BorderRadius.circular(AppSizes.borderRadiusXxxL),
              ),
              child: boxShape == BoxShape.circle ? ClipOval(
                child: imageFile != null ?
                Image.file(
                  imageFile!,
                  fit: BoxFit.cover,
                ) : CustomNetworkImage(
                    width: width,
                    height: height,
                    imageUrl:  imageUrl != null ? imageUrl! : ""
                ),
              ) : ClipRRect(
                borderRadius: BorderRadius.circular(AppSizes.borderRadiusXxxL),
                child: imageFile != null ?
                Image.file(
                  imageFile!,
                  fit: BoxFit.cover,
                ) : CustomNetworkImage(
                    width: width,
                    height: height,
                    boxShape: BoxShape.rectangle,
                    imageUrl: imageUrl != null ? imageUrl! : ""
                ),
              ),
            ),
            if (isEdit) Positioned(
                bottom: 0,
                right: 0,
                child: CustomRoundedInnerIcon(
                  icon: AppIcons.editIcon,
                  boxShape: BoxShape.rectangle,
                  borderColor: Colors.transparent,
                  bgColor: AppColors.primaryColor,
                  isBorder: true,
                  iconColor: AppColors.whiteColor,
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