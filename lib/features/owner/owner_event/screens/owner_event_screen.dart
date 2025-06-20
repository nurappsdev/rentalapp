import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/config/app_sizes.dart';
import 'package:alora/core/config/app_strings.dart';
import 'package:alora/core/extensions/context_extensions.dart';
import 'package:alora/core/extensions/widget_extensions.dart';
import 'package:alora/core/routes/app_routes.dart';
import 'package:alora/core/utils/custom_bottom_sheet.dart';
import 'package:alora/core/widgets/custom_app_bar.dart';
import 'package:alora/shared/widgets/delete_bottom_sheet.dart';
import '../widgets/event_card.dart';
import '../widgets/empty_events.dart';
import '../widgets/event_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/owner_event_controller.dart';

class OwnerEventScreen extends GetView<OwnerEventController> {
  const OwnerEventScreen({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: AppStrings.events,
        showBackBtn: true,
        elevation: 0.0,
        backgroundColor: AppColors.whiteColor,
      ),
      backgroundColor: AppColors.surfaceColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.screenHorizontal),
          child: Column(
            children: <Widget>[
              // maintenence list with handling loading and empty state
              Obx((){
                if(controller.events.isEmpty){
                  return SizedBox(
                    width: context.screenWidth,
                    child: const EmptyEvents().centered,
                  );
                }
                else if(controller.eventsLoading.value){
                  return const EventShimmer();
                }
                return ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.events.length,
                  itemBuilder: (_, int index){
                    return EventCard(
                      onDeleteCallback: () {
                        CustomBottomSheet.showCustomBottomSheet(
                          context: context, 
                          child: DeleteBottomSheet(
                            onDeleteCallBack: () => Get.back(),
                          )
                        );
                      },
                      onEditCallback: () {
                        Get.toNamed(AppRoutes.ownerCreateDocumentsRoute);
                      },
                      event: controller.events[index]
                    );
                  },
                  separatorBuilder: (_, _) => const SizedBox(height: AppSizes.spaceBetweenItems,),
                );
              }),
          
              const SizedBox(height: AppSizes.spaceBetweenSections,),
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: <Color>[
              Color(0XFF2CB5EB),
              Color.fromARGB(255, 19, 152, 204),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight
          )
        ),
        child: FloatingActionButton(
          onPressed: () => Get.toNamed(AppRoutes.ownerCreateDocumentsRoute),
          backgroundColor: Colors.transparent,
          child: const Icon(Icons.add, size: 28.0, color: AppColors.whiteColor,)
        ),
      ),
    );
  }
}
