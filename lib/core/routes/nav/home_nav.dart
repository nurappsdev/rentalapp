import 'package:get/get.dart';
import '../../../features/screens.dart';
import '../../../features/bindings.dart';
import '../app_routes.dart';

class HomeNav{
  HomeNav._();
  static final List<GetPage<dynamic>> routes = <GetPage<dynamic>>[
   
    // Home routes
    GetPage<dynamic>(
      name: AppRoutes.homeCrewRoute, 
      page: () => const HomeCrewScreen(), 
      binding: HomeCrewBinding(),
      transition: Transition.noTransition
    ),

    GetPage<dynamic>(
      name: AppRoutes.homeOwnerRoute, 
      page: () => const HomeOwnerScreen(), 
      binding: HomeOwnerBinding(),
      transition: Transition.noTransition
    ),

    GetPage<dynamic>(
      name: AppRoutes.homeRentarRoute, 
      page: () => const HomeRentarScreen(), 
      binding: HomeRenterBinding(),
      transition: Transition.noTransition
    ),
  ];
}