import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/config/app_sizes.dart';
import 'package:alora/core/utils/helper_method.dart';
import 'package:alora/core/widgets/custom_network_image.dart';
import 'package:alora/features/renter/search_apartments/controllers/search_apartments_controller.dart';
import 'package:alora/features/renter/search_apartments/model/apartment_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class ApartmentCard extends StatelessWidget {
  final ApartmentModel apartment;
  final VoidCallback onViewCallback;
  final String type;

  const ApartmentCard({
    super.key,
    required this.apartment,
    this.onViewCallback = HelperMethod.emptyCallback, 
    this.type = "apartment",
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onViewCallback,
      child: Card(
        color: AppColors.primaryColor,
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.borderRadiusXxxL),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(AppSizes.borderRadiusXxxL),
              child: CustomNetworkImage(
                imageUrl: apartment.image, 
                height: 200.0, 
                width: double.infinity,
                boxShape: BoxShape.rectangle,
              ),
            ),
              
            const SizedBox(height: AppSizes.md,),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSizes.md),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    apartment.title,
                    style: context.textTheme.titleMedium?.copyWith(
                      color: AppColors.textWhiteColor
                    ),
                  ),
              
                  const SizedBox(height: AppSizes.sm,),
              
                  Text(
                    apartment.apartmentName,
                    style: context.textTheme.labelMedium?.copyWith(
                      color: AppColors.textWhiteColor
                    ),
                  ),
              
                  const SizedBox(height: AppSizes.sm,),
              
                  Text(
                    apartment.apartmentLocation,
                    style: context.textTheme.labelMedium?.copyWith(
                      color: AppColors.textWhiteColor
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: AppSizes.md,),
          ],
        ),
      ),
    );
  }
}