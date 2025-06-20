import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/config/app_icons.dart';
import 'package:alora/core/config/app_sizes.dart';
import 'package:alora/core/config/app_strings.dart';
import 'package:alora/core/extensions/context_extensions.dart';
import 'package:alora/core/extensions/widget_extensions.dart';
import 'package:alora/core/routes/app_routes.dart';
import 'package:alora/features/crew/maintenance/controllers/maintenance_controller.dart';
import 'package:alora/features/renter/renter_documents/controllers/renter_documents_controller.dart';
import 'package:alora/features/renter/renter_documents/widgets/document_shimmer.dart';
import 'package:alora/features/renter/renter_events/controllers/renter_events_controller.dart';
import 'package:alora/features/renter/renter_events/widgets/empty_events.dart';
import 'package:alora/features/renter/renter_events/widgets/event_shimmer.dart';
import 'package:alora/features/renter/renter_maintenance/controllers/renter_maintenance_controller.dart';
import 'package:alora/features/renter/renter_maintenance/widgets/request_card.dart';
import 'package:alora/features/renter/renter_maintenance/widgets/request_shimmer.dart';
import 'package:alora/shared/widgets/empty_maintenance.dart';
import 'package:alora/shared/widgets/maintenance_card.dart';
import 'package:alora/shared/widgets/maintenance_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'event_card.dart';

class CurrentWeekEvents extends StatelessWidget {
  final RenterEventsController controller;
  const CurrentWeekEvents({
    super.key,
    required this.controller
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          // maintenence list with handling loading and empty state
          Obx((){
            if(controller.currentWeekEvents.isEmpty){
              return SizedBox(
                width: context.screenWidth,
                child: const EmptyEvents().centered,
              );
            }
            else if(controller.currentWeekEventsLoading.value){
              return const EventShimmer();
            }
            return ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.currentWeekEvents.length,
              itemBuilder: (_, int index){
                return EventCard(event: controller.allEvents[index]);
              },
              separatorBuilder: (_, _) => const SizedBox(height: AppSizes.spaceBetweenItems,),
            );
          }),
      
          const SizedBox(height: AppSizes.spaceBetweenSections,),
        ],
      ),
    );
  }
}