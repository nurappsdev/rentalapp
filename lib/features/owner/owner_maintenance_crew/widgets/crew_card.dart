import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/config/app_icons.dart';
import 'package:alora/core/config/app_sizes.dart';
import 'package:alora/core/extensions/context_extensions.dart';
import 'package:alora/core/extensions/date_time_extensions.dart';
import 'package:alora/core/widgets/custom_network_image.dart';
import 'package:alora/core/widgets/custom_rounded_inner_icon.dart';
import 'package:alora/features/owner/owner_event/models/owner_event_model.dart';
import 'package:alora/features/owner/owner_maintenance_crew/models/maintenance_crew_model.dart';
import 'package:alora/features/renter/renter_events/models/renter_event_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CrewCard extends StatelessWidget {
  final MaintenanceCrewModel crew;
  final VoidCallback onViewCallback;

  const CrewCard({
    super.key,
    required this.crew,
    required this.onViewCallback,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: context.screenWidth,
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.md, vertical: AppSizes.md),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSizes.borderRadiusMd),
        border: Border.all(
          width: .5,
          color: AppColors.dividerColor
        )
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(AppSizes.borderRadiusMd),
                child: CustomNetworkImage(
                  imageUrl: crew.image, 
                  height: 60.0, 
                  boxShape: BoxShape.rectangle,
                  width: 60.0
                ),
              ),

              const SizedBox(width: AppSizes.sm,),

              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    crew.name,
                    style: context.txtTheme.headlineSmall
                  ),

                  const SizedBox(height: AppSizes.xs,),

                  Text(
                    crew.location,
                    style: context.txtTheme.labelLarge
                  ),
                ],
              ),
          
            ],
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: Row(
              spacing: AppSizes.md,
              children: <Widget>[
                GestureDetector(
                  onTap: onViewCallback,
                  child: Text(
                    "Details",
                    style: context.txtTheme.labelLarge?.copyWith(
                      color: AppColors.primaryColor,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}