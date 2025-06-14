import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/config/app_sizes.dart';
import 'package:alora/core/config/app_strings.dart';
import 'package:alora/core/extensions/widget_extensions.dart';
import 'package:alora/core/widgets/custom_app_bar.dart';
import 'package:alora/features/notification/controllers/notification_controller.dart';
import 'package:alora/features/notification/widgets/notification_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/empty_notification.dart';
import '../widgets/notification_shimmer.dart';

class NotificationScreen extends GetView<NotificationController> {
  const NotificationScreen({
    super.key
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: const CustomAppBar(
        showBackBtn: true,
        elevation: 0.0,
        title: AppStrings.notificaiton,
      ),
      backgroundColor: AppColors.surfaceColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.screenHorizontal),
          child: Column(
            children: <Widget>[
              const SizedBox(height: AppSizes.spaceBetweenSections,),
              // notification list with handling loading and empty state
              
              Obx((){
                if(controller.notificationList.isEmpty){
                  return const EmptyNotification().centered;
                }
                else if(controller.notificationLoading.value){
                  return const NotificationShimmer();
                }
                return ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.notificationList.length,
                  itemBuilder: (_, int index){
                    return NotificationCard(
                      notification: controller.notificationList[index],
                      onTapCallback: () { },
                    );
                  },
                  separatorBuilder: (_, int index){
                    return Column(
                      children: <Widget>[
                        const SizedBox(height: AppSizes.sm,),
                        if((index + 1) != controller.notificationList.length) ...<Widget>[
                          const Divider(
                            thickness: .5,
                          ),
                          const SizedBox(height: AppSizes.sm,),
                        ]
                      ],
                    );
                  },
                );
              }),

              const SizedBox(height: AppSizes.spaceBetweenSections,),
            ],
          ),
        ),
      ),
    );
  }
}



