import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/config/app_sizes.dart';
import 'package:alora/core/config/app_strings.dart';
import 'package:alora/core/widgets/custom_button.dart';
import 'package:alora/core/widgets/custom_network_image.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

import '../models/maintenance_model.dart';
import 'package:flutter/material.dart';

class MaintenanceCard extends StatelessWidget {
  final MaintenanceModel maintenanceModel;
  final VoidCallback onViewCallback;
  final VoidCallback onAcceptCallback;

  const MaintenanceCard({
    super.key,
    required this.maintenanceModel, 
    required this.onViewCallback, 
    required this.onAcceptCallback
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
              ClipRRect(
                borderRadius: BorderRadius.circular(AppSizes.borderRadiusMd),
                child: CustomNetworkImage(
                  imageUrl: maintenanceModel.image, 
                  height: 90.0, 
                  width: double.infinity,
                  boxShape: BoxShape.rectangle,
                ),
              ),
      
              const SizedBox(height: AppSizes.sm,),
      
              Text(
                maintenanceModel.apartmentName,
                style: context.textTheme.titleMedium,
              ),
      
      
              const SizedBox(height: AppSizes.sm,),
      
              Text(
                maintenanceModel.apartmentLocation,
                style: context.textTheme.labelMedium,
              ),
      
              const SizedBox(height: AppSizes.sm,),
      
              Row(
                children: <Widget>[
                  Text(
                    maintenanceModel.type,
                    style: context.textTheme.titleMedium?.copyWith(
                      color: AppColors.orange
                    ),
                  ),
      
                  const Spacer(),
      
                  CustomButton(
                    onTap: onViewCallback, 
                    width: 100.0,
                    height: 32.0,
                    borderRadius: 24.0,
                    isOutline: true,
                    text: AppStrings.view
                  ),
                  const SizedBox(width: AppSizes.sm,),
      
                  CustomButton(
                    onTap: onAcceptCallback, 
                    width: 100.0,
                    height: 32.0,
                    borderRadius: 24.0,
                    text: AppStrings.accept
                  )
                ],
              ),
      
              const SizedBox(height: AppSizes.sm,),
      
              Row(
                children: <Widget>[
                  Text(
                    AppStrings.roomNumber,
                    style: context.textTheme.bodyMedium
                  ),
      
                  const Spacer(),
      
                  Text(
                    maintenanceModel.apartmentRoomNumber,
                    style: context.textTheme.bodyMedium
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
                    style: context.textTheme.bodyMedium
                  ),
      
                  const Spacer(),
      
                  Text(
                    maintenanceModel.floor,
                    style: context.textTheme.bodyMedium
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
