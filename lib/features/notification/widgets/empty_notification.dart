import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/config/app_icons.dart';
import 'package:alora/core/config/app_sizes.dart';
import 'package:alora/core/config/app_strings.dart';
import 'package:alora/core/widgets/custom_rounded_inner_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class EmptyNotification extends StatelessWidget{
  const EmptyNotification({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const CustomRoundedInnerIcon(
          icon: AppIcons.notificationIcon,
          containerSize: 100.0,
          bgColor: AppColors.primaryColor,
          iconColor: AppColors.whiteColor,
        ),
    
        const SizedBox(height: AppSizes.sm,),
    
        Text(
          AppStrings.notificaitonEmpty,
          style: context.textTheme.titleSmall,
        )
      ],
    );
  }
}