import 'package:get/get.dart';
import '../../features/screens.dart';
import '../../features/bindings.dart';
import 'app_routes.dart';
import 'navigation.dart';

class AppNavigation{
  AppNavigation._();
  static final List<GetPage<dynamic>> routes = <GetPage<dynamic>>[
    // Initial routes
    GetPage<dynamic>(
      name: AppRoutes.initialRoute, 
      page: () => const SplashScreen(), 
      binding: SplashBinding(),
      transition: Transition.noTransition
    ),

    // onboarding routes
    ...OnboardingNav.routes,

    // choose role routes
    GetPage<dynamic>(
      name: AppRoutes.chooseRoleRoute, 
      page: () => const ChooseRoleScreen(), 
      binding: ChooseRoleBinding(),
      transition: Transition.noTransition
    ),

    // Auth routes
    ...AuthNav.routes,

    // profile routes
    ...ProfileNav.routes,

    // home routes
    ...HomeNav.routes,

    // maintenance routes
    ...MaintenanceNav.routes,

    // general routes
    ...GeneralNav.routes,

    // renter
    ...RenterNav.routes,

    // owner
    ...OwnerNav.routes,



    // payment routes
    GetPage<dynamic>(
      name: AppRoutes.paymentTicketRoute, 
      page: () => const PaymentTicketScreen(), 
      binding: PaymentTicketBinding(),
      transition: Transition.noTransition
    ),

  ];
}