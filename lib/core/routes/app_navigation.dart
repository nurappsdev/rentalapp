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

    // onbaording routes
    GetPage<dynamic>(
      name: AppRoutes.onboardingRoute, 
      page: () => const OnboardingScreen(), 
      binding: OnboardingBinding(),
      transition: Transition.noTransition
    ),

    // choose role routes
    GetPage<dynamic>(
      name: AppRoutes.chooseRoleRoute, 
      page: () => const ChooseRoleScreen(), 
      binding: ChooseRoleBinding(),
      transition: Transition.noTransition
    ),


    // Auth routes
    ...AuthNav.routes,

    // general routes
    GetPage<dynamic>(
      name: AppRoutes.generalRoute, 
      page: () => const GeneralScreen(), 
      binding: GeneralBinding(),
      transition: Transition.noTransition
    ),

    // setting routes
    GetPage<dynamic>(
      name: AppRoutes.settingRoute, 
      page: () => const SettingScreen(), 
      binding: SettingBinding(),
      transition: Transition.noTransition
    ),

     // contact us routes
    GetPage<dynamic>(
      name: AppRoutes.contactUsRoute, 
      page: () => const ContactUsScreen(), 
      binding: ContactUsBinding(),
      transition: Transition.noTransition
    ),

    // contact us routes
    GetPage<dynamic>(
      name: AppRoutes.profileRoute, 
      page: () => const ProfileScreen(), 
      binding: ProfileBinding(),
      transition: Transition.noTransition
    ),


     // home routes
    ...HomeNav.routes,

    // notification routes
    GetPage<dynamic>(
      name: AppRoutes.notificationRoute, 
      page: () => const NotificationScreen(), 
      binding: NotificationBinding(),
      transition: Transition.noTransition
    ),


    // maintenance routes
    GetPage<dynamic>(
      name: AppRoutes.maintananceDetailsRoute, 
      page: () => const MaintenanceDetailsScreen(), 
      binding: MaintenanceDetailsBinding(),
      transition: Transition.noTransition
    ),


  ];
}