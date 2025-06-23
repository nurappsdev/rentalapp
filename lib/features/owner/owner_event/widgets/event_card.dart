import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/config/app_icons.dart';
import 'package:alora/core/config/app_sizes.dart';
import 'package:alora/core/extensions/context_extensions.dart';
import 'package:alora/core/extensions/date_time_extensions.dart';
import 'package:alora/core/widgets/custom_network_image.dart';
import 'package:alora/core/widgets/custom_rounded_inner_icon.dart';
import 'package:alora/features/owner/owner_event/models/owner_event_model.dart';
import 'package:alora/features/renter/renter_events/models/renter_event_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EventCard extends StatelessWidget {
  final OwnerEventModel event;
  final bool isEdit;
  final VoidCallback onDeleteCallback;
  final VoidCallback onEditCallback;

  const EventCard({
    super.key,
    required this.event,
    required this.onDeleteCallback,
    required this.onEditCallback,
    this.isEdit = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: context.screenWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSizes.borderRadiusMd),
        border: Border.all(
          width: AppSizes.dividerHeight,
          color: AppColors.dividerColor
        )
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(AppSizes.borderRadiusMd),
                child: CustomNetworkImage(
                  imageUrl: event.image, 
                  height: 170.0, 
                  boxShape: BoxShape.rectangle,
                  width: context.screenWidth
                ),
              ),
          
              const SizedBox(height: AppSizes.spaceBetweenItems,),
          
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSizes.md),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      event.date.formattedDateTime12,
                      style: context.txtTheme.labelLarge?.copyWith(
                        color: AppColors.orange
                      ),
                    ),
          
                    const SizedBox(height: AppSizes.sm,),
          
          
                    Text(
                      event.title,
                      style: context.txtTheme.headlineSmall
                    ),
          
                    const SizedBox(height: AppSizes.sm,),
          
                    Text(
                      event.description,
                      style: context.txtTheme.labelLarge
                    ),
          
                  ],
                ),
              ),
          
              const SizedBox(height: AppSizes.spaceBetweenSections,),
          
            ],
          ),
          Positioned(
            top: 10,
            right: 10,
            child: Row(
              spacing: AppSizes.md,
              children: <Widget>[
                CustomRoundedInnerIcon(
                  onTap: onDeleteCallback,
                  icon: AppIcons.deleteIcon,
                  containerSize: 32.0,
                  bgColor: AppColors.whiteColor,
                  iconColor: AppColors.primaryColor,
                ),
                CustomRoundedInnerIcon(
                  onTap: onEditCallback,
                  icon: AppIcons.editIcon,
                  containerSize: 32.0,
                  bgColor: AppColors.whiteColor,
                  iconColor: AppColors.primaryColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}