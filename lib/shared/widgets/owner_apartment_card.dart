import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/config/app_sizes.dart';
import 'package:alora/core/config/app_strings.dart';
import 'package:alora/core/extensions/context_extensions.dart';
import 'package:alora/core/utils/helper_method.dart';
import 'package:alora/core/widgets/custom_button.dart';
import 'package:alora/core/widgets/custom_network_image.dart';
import 'package:alora/features/renter/search_apartments/model/apartment_model.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

import '../models/maintenance_model.dart';
import 'package:flutter/material.dart';

class OwnerApartmentCard extends StatelessWidget {
  final ApartmentModel apartment;
  final VoidCallback onViewCallback;
  final String type;
  final bool isShowImage;
  final Widget? appendWidget;

  const OwnerApartmentCard({
    super.key,
    required this.apartment, 
    this.onViewCallback = HelperMethod.emptyCallback, 
    this.type = "no_view",
    this.isShowImage = true,
    this.appendWidget,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onViewCallback,
      child: Card(
        color: AppColors.whiteColor,
        child: Container(
          padding: const EdgeInsets.all(AppSizes.sm),
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
              if(isShowImage)
                ClipRRect(
                  borderRadius: BorderRadius.circular(AppSizes.borderRadiusMd),
                  child: CustomNetworkImage(
                    imageUrl: apartment.image, 
                    height: 90.0, 
                    width: double.infinity,
                    boxShape: BoxShape.rectangle,
                  ),
                ),
      
              const SizedBox(height: AppSizes.sm,),
      
              Text(
                apartment.apartmentName,
                style: context.txtTheme.titleMedium,
              ),
      
      
              const SizedBox(height: AppSizes.sm,),
      
              Text(
                apartment.apartmentLocation,
                style: context.txtTheme.labelMedium,
              ),
      
              const SizedBox(height: AppSizes.sm,),
      
              Row(
                children: <Widget>[
                  Text(
                    apartment.availableUnitTypes.first,
                    style: context.txtTheme.titleMedium?.copyWith(
                      color: AppColors.orange
                    ),
                  ),
      
                  const Spacer(),
      
                  if(type == "view")...<Widget>[
                    CustomButton(
                      onTap: onViewCallback, 
                      width: 100.0,
                      height: 32.0,
                      borderRadius: 24.0,
                      text: AppStrings.view
                    ),
                  ],

                  if(type == "resolved")...<Widget>[
                    CustomButton(
                      onTap: (){}, 
                      width: 100.0,
                      height: 32.0,
                      borderRadius: 24.0,
                      text: AppStrings.resolved
                    ),
                  ],
                ],
              ),
      
              const SizedBox(height: AppSizes.sm,),
      
              Row(
                children: <Widget>[
                  Text(
                    AppStrings.roomNumber,
                    style: context.txtTheme.bodyMedium
                  ),
      
                  const Spacer(),
      
                  Text(
                    apartment.apartmentNumbers.first.title,
                    style: context.txtTheme.bodyMedium
                  ),
                ],
              ),
      
              const Divider(
                thickness: AppSizes.dividerHeight,
              ),
      
              const SizedBox(height: AppSizes.sm,),
      
              Row(
                children: <Widget>[
                  Text(
                    AppStrings.floor,
                    style: context.txtTheme.bodyMedium
                  ),

                  const Spacer(),
                  Text(
                    apartment.availableFloors.first,
                    style: context.txtTheme.bodyMedium
                  ),
                ],
              ),
              const SizedBox(height: AppSizes.sm,),

              if(appendWidget != null)
                appendWidget!
            ],
          ),
        ),
      ),
    );
  }
}
