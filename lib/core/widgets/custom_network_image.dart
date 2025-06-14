import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:alora/core/config/app_colors.dart';

class CustomNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double height;
  final double width;
  final BoxShape boxShape;

  const CustomNetworkImage({
    super.key,
    required this.imageUrl,
    required this.height,
    required this.width,
    this.boxShape = BoxShape.circle,
  });

  @override
  Widget build(BuildContext context) {
  
    return CachedNetworkImage(
        imageUrl: imageUrl,
        imageBuilder: (BuildContext context, ImageProvider<Object> imageProvider) => Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            shape: boxShape,
            image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
            ),
          ),
        ),
        placeholder: (BuildContext context, String url) => Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              color: AppColors.greyColor.withValues(alpha: .2),
              shape: boxShape,
            ),
        ),
        errorWidget: (BuildContext context, String url, Object error) =>  Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
            color: AppColors.greyColor.withValues(alpha: .2),
            shape: boxShape,
            ),
        ),
    );
  }
}
