import 'package:get/get.dart';
import '../../../features/screens.dart';
import '../../../features/bindings.dart';
import '../app_routes.dart';

class MaintenanceNav{
  MaintenanceNav._();
  static final List<GetPage<dynamic>> routes = <GetPage<dynamic>>[
    // maintenance routes
    GetPage<dynamic>(
      name: AppRoutes.maintenanceDetailsRoute, 
      page: () => const MaintenanceDetailsScreen(), 
      binding: MaintenanceDetailsBinding(),
      transition: Transition.noTransition
    ),

    GetPage<dynamic>(
      name: AppRoutes.maintenanceRoute, 
      page: () => const MaintenanceScreen(), 
      binding: MaintenanceBinding(),
      transition: Transition.noTransition
    ),
  ];
}