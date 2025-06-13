import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/config/app_icons.dart';
import 'package:alora/core/config/app_sizes.dart';
import 'package:alora/core/config/app_strings.dart';
import 'package:alora/core/config/calendar_config.dart';
import 'package:alora/core/extensions/widget_extensions.dart';
import 'package:alora/core/widgets/custom_app_bar.dart';
import 'package:alora/core/widgets/custom_rounded_inner_icon.dart';
import 'package:alora/shared/widgets/maintenance_card.dart';
import 'package:alora/shared/widgets/maintenance_shimmer.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_crew_controller.dart';
import '../../../../shared/widgets/empty_maintenance.dart';

class HomeCrewScreen extends GetView<HomeCrewController> {
  const HomeCrewScreen({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      appBar: CustomAppBar(
        showDrawerIcon: true,
        scaffoldKey: scaffoldKey,
        elevation: 0.0,
        actions: <Widget>[
          CustomRoundedInnerIcon(
            icon: AppIcons.notificationIcon,
            containerSize: 32.0,
            isBorder: false,
            bgColor: AppColors.greyColor,
            boxShape: BoxShape.rectangle,
            onTap: (){},
          ),
          const SizedBox(width: AppSizes.sm,)
        ]
      ),
      backgroundColor: AppColors.surfaceColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.screenHorizontal),
          child: Column(
            children: <Widget>[
              const SizedBox(height: AppSizes.spaceBetweenItems,),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  border: Border.all(color: AppColors.greyColor, width: AppSizes.dividerHeight)
                ),
                child: CalendarDatePicker2(
                  config: CalendarConfig.calendarConfig(context),
                  value: <DateTime?>[DateTime.now()],
                  onValueChanged: (List<DateTime> dates){},
                ),
              ),
              const SizedBox(height: AppSizes.spaceBetweenSections,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    AppStrings.maintenanceReqList,
                    style: context.textTheme.titleLarge,
                  ),

                  Obx((){
                    if(controller.maintenanceList.isNotEmpty){
                      return Text(
                        "(${controller.maintenanceList.length})",
                        style: context.textTheme.titleLarge,
                      );
                    }
                    return const SizedBox.shrink();
                  })
                ],
              ),
              const SizedBox(height: AppSizes.spaceBetweenSections,),

              Obx((){
                if(controller.maintenanceList.isEmpty){
                  return const EmptyMaintenance().centered;
                }
                else if(controller.maintenanceLoading.value){
                  return const MaintenanceShimmer();
                }
                return ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.maintenanceList.length,
                  itemBuilder: (_, int index){
                    return MaintenanceCard(
                      maintenanceModel: controller.maintenanceList[index],
                      onViewCallback: () {  },
                      onAcceptCallback: () {  },
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
    );
  }
}



