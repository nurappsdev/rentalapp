import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/config/app_sizes.dart';
import 'package:alora/core/config/app_strings.dart';
import 'package:alora/core/extensions/context_extensions.dart';
import 'package:alora/core/extensions/widget_extensions.dart';
import 'package:alora/core/utils/custom_loader.dart';
import 'package:alora/core/widgets/custom_app_bar.dart';
import 'package:alora/core/widgets/custom_button.dart';
import 'package:alora/features/owner/owner_subscription/widgets/empty_subscription.dart';
import 'package:alora/features/owner/owner_subscription/widgets/subscription_card.dart';
import 'package:alora/features/owner/owner_subscription/widgets/subscription_shimmer.dart';
import 'package:alora/shared/widgets/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/manage_sub_controller.dart';


class OwnerSubscriptionScreenDrawer extends GetView<ManageSubController> {
  const OwnerSubscriptionScreenDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: AppStrings.subscription,
        backgroundColor: AppColors.whiteColor,
        elevation: 0.0,
        showBackBtn: true,
      ),
      backgroundColor: AppColors.surfaceColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.screenHorizontal),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: AppSizes.spaceBetweenItems),
              Text(AppStrings.subscriptionTitle, style: context.txtTheme.headlineSmall),

              const SizedBox(height: AppSizes.spaceBetweenItems),

              Text("Select Number of units", style: context.txtTheme.bodyLarge),
              const SizedBox(height: AppSizes.sm),
              CustomDropdown<String>(
                hint: "Select Unit",
                options: const <String>["1-3 units", "4-5 units", "5-10 units"],
                displayString: (String value) => value,
                onChanged: (String value) {
                  if (value.isNotEmpty) {
                    controller.handleRetrieveSubscriptions(value);
                  }
                },
              ),

              const SizedBox(height: AppSizes.spaceBetweenItems),

              Obx(() {
                if (controller.subscriptions.isEmpty) {
                  return const EmptySubscription().centered;
                } else if (controller.subscriptionsLoading.value) {
                  return const CustomLoading(color: AppColors.primaryColor);
                }
                return GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8.0,
                    crossAxisSpacing: 8.0,
                  ),
                  itemCount: controller.subscriptions.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Obx(
                          () => SubscriptionCard(
                        subscription: controller.subscriptions[index],
                        isSelected:
                        controller.subscriptions[index].id ==
                            controller.selectedSubscription.value?.id,
                        onSelectCallBack: () {
                          controller.selectedSubscription.value = controller.subscriptions[index];
                        },
                      ),
                    );
                  },
                );
              }),

              const SizedBox(height: AppSizes.spaceBetweenSections),

              Obx(() {
                if (controller.subscriptionsLoading.value) {
                  return const SizedBox.shrink();
                } else if (controller.subscriptions.isNotEmpty) {
                  return const SubscriptionIncludesCard(
                    features: <String>[
                      'Priority Support',
                      'Early Access to Features',
                      'Priority Support',
                      'Early Access to Features',
                      'Priority Support',
                      'Early Access to Features',
                    ],
                  );
                } else {
                  return const SizedBox.shrink();
                }
              }),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.screenHorizontal),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Obx(
                  () => Row(
                mainAxisAlignment: MainAxisAlignment.start,
                spacing: AppSizes.xs,
                children: <Widget>[
                  Obx(
                        () => Checkbox(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      value: controller.isAgreementAccepted.value,
                      onChanged: (bool? value) => controller.updateAgreement = value,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "Pay us \$${controller.selectedSubscription.value != null ? controller.selectedSubscription.value!.price : 0.0} Set up your property",
                      style: context.txtTheme.titleMedium,
                    ),
                  ),
                  const SizedBox(width: AppSizes.lg),
                ],
              ),
            ),

            const SizedBox(height: AppSizes.spaceBetweenItems),

            CustomButton(onTap:
            controller.handleContinue,text: AppStrings.continueBtnTxt),
            const SizedBox(height: AppSizes.spaceBetweenSections),
          ],
        ),
      ),
    );
  }
}

class SubscriptionIncludesCard extends StatelessWidget {
  final List<String> features;

  const SubscriptionIncludesCard({super.key, required this.features});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.blue.withValues(alpha: 0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Subscription Includes',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              Icon(Icons.check_circle_outline, color: Colors.white, size: 24),
            ],
          ),
          const SizedBox(height: 16),
          ...features.map(
                (String feature) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                children: <Widget>[
                  const Icon(Icons.check, color: Colors.white, size: 18),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(feature, style: const TextStyle(color: Colors.white, fontSize: 15)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
