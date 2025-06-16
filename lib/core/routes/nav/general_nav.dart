import 'package:get/get.dart';
import '../../../features/screens.dart';
import '../../../features/bindings.dart';
import '../app_routes.dart';

class GeneralNav{
  GeneralNav._();
  static final List<GetPage<dynamic>> routes = <GetPage<dynamic>>[
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

    // notification routes
    GetPage<dynamic>(
      name: AppRoutes.notificationRoute, 
      page: () => const NotificationScreen(), 
      binding: NotificationBinding(),
      transition: Transition.noTransition
    ),
  ];
}