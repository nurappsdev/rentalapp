import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/config/app_sizes.dart';
import 'package:alora/core/config/app_strings.dart';
import 'package:alora/core/extensions/context_extensions.dart';
import 'package:alora/core/extensions/widget_extensions.dart';
import 'package:alora/features/owner/owner_subscription/model/subscription_model.dart';
import 'package:flip_card/flip_card.dart';
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
    final GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();
    return GestureDetector(onTap: onSelectCallBack, child: _buildFront(context, cardKey));
  }

  Stack _buildFront(BuildContext context, GlobalKey<FlipCardState> cardKey) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(top: 20),
          padding: const EdgeInsets.all(AppSizes.md),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primaryColor.withValues(alpha: .1) : AppColors.whiteColor,
            borderRadius: BorderRadius.circular(AppSizes.borderRadiusXxl),
            border: Border.all(
              color: isSelected ? AppColors.primaryColor : AppColors.dividerColor,
              width: 2.0,
            ),
          ),
          child: SizedBox(
            width: context.screenWidth,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: AppSizes.sm),
                Row(
                  spacing: AppSizes.xs,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      subscription.durationNumber.toString(),
                      style: context.txtTheme.headlineLarge,
                    ),
                    Text(subscription.duration, style: context.txtTheme.headlineLarge),
                  ],
                ),

                const SizedBox(height: AppSizes.sm),

                Text(subscription.unitType.toString(), style: context.txtTheme.bodyLarge),

                const SizedBox(height: AppSizes.sm),

                Text(
                  "\$ ${subscription.price}",
                  style: context.txtTheme.headlineLarge?.copyWith(color: AppColors.primaryColor),
                ),
              ],
            ),
          ),
        ),

        Positioned(
          top: 4,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: AppSizes.sm, vertical: AppSizes.xs),
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(AppSizes.borderRadiusXxxL),
            ),
            child: Text(
              subscription.title,
              style: context.txtTheme.titleMedium?.copyWith(color: AppColors.textWhiteColor),
            ),
          ),
        ),
      ],
    );
  }
}
