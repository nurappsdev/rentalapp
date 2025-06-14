import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/config/app_sizes.dart';
import 'package:alora/core/extensions/date_time_extensions.dart';
import 'package:alora/core/widgets/custom_rounded_inner_icon.dart';
import 'package:alora/features/notification/models/notification_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class NotificationCard extends StatelessWidget {
  final VoidCallback onTapCallback;
  final NotificationModel notification;

  const NotificationCard({
    super.key,
    required this.notification,
    required this.onTapCallback
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapCallback,
      child: Row(
        children: <Widget>[
          
          CustomRoundedInnerIcon(
            icon: notification.icon,
            containerSize: 48.0,
            isBorder: false,
            bgColor: AppColors.primaryColor,
            iconColor: AppColors.whiteColor,
            onTap: () {},
          ),
      
          const SizedBox(width: AppSizes.sm,),
      
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                notification.title,
                style: context.textTheme.bodyLarge,
              ),
            
              const SizedBox(height: AppSizes.sm,),
            
              Text(
                notification.description,
                style: context.textTheme.labelLarge,
              ),
            
              const SizedBox(height: AppSizes.sm,),
            
              Text(
                notification.time.timeAgo,
                style: context.textTheme.labelSmall,
              ),
            ],
          )
        ],
      ),
    );
  }
}