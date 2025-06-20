import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/config/app_sizes.dart';
import 'package:alora/core/config/app_strings.dart';
import 'package:alora/core/extensions/context_extensions.dart';
import 'package:alora/core/extensions/widget_extensions.dart';
import 'package:alora/features/owner/owner_subscription/model/subscription_model.dart';
import 'package:flutter/material.dart';

class SubscriptionCard extends StatelessWidget {
  final SubscriptionModel subscription;
  final VoidCallback onSelectCallBack;
  final bool isSelected;

  const SubscriptionCard({
    super.key,
    required this.subscription,
    required this.onSelectCallBack,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelectCallBack,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 20),
            padding: const EdgeInsets.all(AppSizes.md),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(AppSizes.borderRadiusXxl),
              border: Border.all(color: isSelected ? AppColors.primaryColor : AppColors.dividerColor, width: 2.0),
            ),
            child: SizedBox(
              width: 150.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    subscription.durationNumber.toString(),
                    style: context.txtTheme.headlineLarge,
                  ),
              
                  const SizedBox(height: AppSizes.spaceBetweenItems,),
              
                  Text(
                    subscription.duration,
                    style: context.txtTheme.bodyMedium,
                  ),
              
                  const SizedBox(height: AppSizes.spaceBetweenItems,),
              
                  Text(
                    AppStrings.unitType,
                    style: context.txtTheme.labelSmall,
                  ),
              
                  const SizedBox(height: AppSizes.spaceBetweenItems,),
              
                  Text(
                    subscription.unitType,
                    style: context.txtTheme.titleMedium,
                  ),
              
                  const SizedBox(height: AppSizes.spaceBetweenItems,),
              
                  Text(
                    "\$ ${subscription.price}",
                    style: context.txtTheme.headlineLarge?.copyWith(
                      color: AppColors.primaryColor
                    ),
                  )
                ],
              ),
            ),
          ),
      
          Positioned(
            top: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: AppSizes.md, vertical: AppSizes.sm),
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(AppSizes.borderRadiusXxxL),
              ),
              child: Text(
                subscription.title,
                style: context.txtTheme.titleMedium?.copyWith(
                  color: AppColors.textWhiteColor
                ),
              ),
            ),
          ),
        ],
      ).centered,
    );
  }
}