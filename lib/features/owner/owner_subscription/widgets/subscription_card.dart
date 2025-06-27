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
    return GestureDetector(
      onTap: onSelectCallBack,
      child: FlipCard(
        key: cardKey,
        flipOnTouch: false,
        back: _buildBack(context, cardKey),
        front: _buildFront(context, cardKey).centered
      ),
    );
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
            color: Colors.white,
            borderRadius: BorderRadius.circular(AppSizes.borderRadiusXxl),
            border: Border.all(color: isSelected ? AppColors.primaryColor : AppColors.dividerColor, width: 2.0),
          ),
          child: SizedBox(
            width: context.screenWidth,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: AppSizes.sm,),
                Text(
                  subscription.durationNumber.toString(),
                  style: context.txtTheme.headlineLarge,
                ),
            
                const SizedBox(height: AppSizes.sm,),
            
                Text(
                  subscription.duration,
                  style: context.txtTheme.bodyMedium,
                ),
            
                const SizedBox(height: AppSizes.sm,),
            
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
        Positioned(
          top: 30,
          right: 10,
          child: IconButton(
            icon: const Icon(Icons.flip),
            onPressed: () => cardKey.currentState?.toggleCard(),
          ),
        ),
      ],
    );
  }

   Widget _buildBack(BuildContext context, GlobalKey<FlipCardState> cardKey) {
    final List<String> subscriptionFeatures = <String>[
      "Priority Support",
      "Early Access to Features",
      "Priority Support",
      "Early Access to Features",
      "Priority Support",
      "Early Access to Features",
    ];
    return Container(
      padding: const EdgeInsets.all(AppSizes.md),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(AppSizes.borderRadiusXxl),
        border: Border.all(color: isSelected ? AppColors.primaryColor : AppColors.dividerColor, width: 2.0),
      ),
      width: double.infinity,
      child: Stack(
        children: <Widget>[
          Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text(
                "Subscription Includes",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              ...subscriptionFeatures.map(
                (String feature) => Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Icon(Icons.check_circle_outline, color: Colors.white, size: 20),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        feature,
                        style: const TextStyle(fontSize: 14, color: Colors.white,),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          Positioned(
          top: 0,
          right: 10,
          child: IconButton(
            icon: const Icon(Icons.flip,  color: Colors.white,),
            onPressed: () => cardKey.currentState?.toggleCard(),
          ),
        ),
        ],
      ),
    );
  }
}