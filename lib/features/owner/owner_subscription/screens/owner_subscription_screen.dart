import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/config/app_sizes.dart';
import 'package:alora/core/config/app_strings.dart';
import 'package:alora/core/extensions/context_extensions.dart';
import 'package:alora/core/extensions/widget_extensions.dart';
import 'package:alora/core/widgets/custom_app_bar.dart';
import 'package:alora/core/widgets/custom_button.dart';
import 'package:alora/features/owner/owner_subscription/widgets/empty_subscription.dart';
import 'package:alora/features/owner/owner_subscription/widgets/subscription_card.dart';
import 'package:alora/features/owner/owner_subscription/widgets/subscription_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/owner_subscription_controller.dart';

class OwnerSubscriptionScreen extends GetView<OwnerSubscriptionController> {
  const OwnerSubscriptionScreen({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: AppStrings.subscription,
        backgroundColor: AppColors.whiteColor,
        elevation: 0.0,
      ),
      backgroundColor: AppColors.surfaceColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.screenHorizontal),
          child: Column(
            children: <Widget>[
              const SizedBox(height: AppSizes.spaceBetweenItems,),
              Text(
                AppStrings.subscriptionTitle,
                style: context.txtTheme.headlineSmall,
              ),

              const SizedBox(height: AppSizes.spaceBetweenItems,),

              Obx((){
                if(controller.subscriptions.isEmpty){
                  return const EmptySubscription().centered;
                }
                else if(controller.subscriptionsLoading.value){
                  return const SubscriptionShimmer();
                }
                return SizedBox(
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.subscriptions.length,
                    itemBuilder: (_, int index){
                      return Obx(
                        () => SubscriptionCard(
                          subscription: controller.subscriptions[index],
                          isSelected: controller.subscriptions[index].id == controller.selectedSubscription.value?.id,
                          onSelectCallBack: (){
                            controller.selectedSubscription.value = controller.subscriptions[index];
                          },
                        ),
                      );
                    },
                    separatorBuilder: (_, _) => const SizedBox(height: AppSizes.spaceBetweenItems,),
                  ),
                );
              }),
          
              const SizedBox(height: AppSizes.spaceBetweenSections,),
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
                      style: context.txtTheme.titleMedium
                    ),
                  ),
                  const SizedBox(width: AppSizes.lg,)
                ],
              ),
            ),

            const SizedBox(height: AppSizes.spaceBetweenItems,),
        
            CustomButton(
              onTap: controller.handleContinue, 
              text: AppStrings.continueBtnTxt
            ),
            const SizedBox(height: AppSizes.spaceBetweenSections,),
          ],
        ),
      ),
    );
  }
}
