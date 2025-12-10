import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/config/app_icons.dart';
import 'package:alora/core/config/app_sizes.dart';
import 'package:alora/core/config/app_strings.dart';
import 'package:alora/core/config/calendar_config.dart';
import 'package:alora/core/extensions/context_extensions.dart';
import 'package:alora/core/extensions/widget_extensions.dart';
import 'package:alora/core/routes/app_routes.dart';
import 'package:alora/core/widgets/custom_app_bar.dart';
import 'package:alora/core/widgets/custom_rounded_inner_icon.dart';
import 'package:alora/core/widgets/custom_text_field.dart';
import 'package:alora/features/crew/maintenance/screens/maintenance_screen.dart';
import 'package:alora/shared/features/side_drawer/widget/custom_side_drawer.dart';
import 'package:alora/shared/widgets/maintenance_card.dart';
import 'package:alora/shared/widgets/maintenance_shimmer.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../controllers/home_crew_controller.dart';
import '../../../../shared/widgets/empty_maintenance.dart';

class HomeCrewScreen extends GetView<HomeCrewController> {
  const HomeCrewScreen({super.key});

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
            onTap: () => Get.toNamed(AppRoutes.notificationRoute),
          ),
          const SizedBox(width: AppSizes.sm),
        ],
      ),
      drawer: const CustomSideDrawer(),
      backgroundColor: AppColors.surfaceColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.screenHorizontal),
        child: Column(
          children: <Widget>[
            const SizedBox(height: AppSizes.spaceBetweenItems),
            CustomTextField(
              controller: TextEditingController(),
              readOnly: true,
              isBorder: true,
              hintText: "Search Property",
              prefixIcon: SvgPicture.asset(AppIcons.searchIcon),
              suffixIcons: Container(
                margin: const EdgeInsets.only(right: 8.0),
                padding: const EdgeInsets.all(2.0),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: SvgPicture.asset(
                  AppIcons.dateIcon,
                  colorFilter: const ColorFilter.mode(AppColors.whiteColor, BlendMode.srcATop),
                ),
              ),
              onTab: () {
                // Get.defaultDialog(
                //   content: Container(
                //     decoration: BoxDecoration(
                //       color: AppColors.whiteColor,
                //       border: Border.all(color: AppColors.greyColor, width: AppSizes.dividerHeight),
                //     ),
                //   child: CalendarDatePicker2(
                //     config: CalendarConfig.calendarConfig(context: context),
                //     value: <DateTime?>[DateTime.now()],
                //     onValueChanged: (List<DateTime> dates) {},
                //   ),
                // ),
                // );

                Get.defaultDialog(
                  title: 'Select Date',
                  titleStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  content: SizedBox(
                    width: context.screenWidth, 
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        CalendarDatePicker2(
                          config: CalendarConfig.calendarConfig(context: context),
                          value: <DateTime?>[DateTime.now()],
                          onValueChanged: (List<DateTime> dates) {},
                        ),
                      ],
                    ),
                  ),
                  contentPadding: const EdgeInsets.all(16),
                );
              },
            ),

            const Expanded(child: MaintenanceScreen()),

            const SizedBox(height: AppSizes.spaceBetweenSections),
          ],
        ),
      ),
    );
  }
}
