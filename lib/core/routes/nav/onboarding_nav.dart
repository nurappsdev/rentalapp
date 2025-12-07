import 'package:get/get.dart';
import '../../../features/screens.dart';
import '../../../features/bindings.dart';
import '../app_routes.dart';

class OnboardingNav{
  OnboardingNav._();
  static final List<GetPage<dynamic>> routes = <GetPage<dynamic>>[
   
    // Home routes
    GetPage<dynamic>(
      name: AppRoutes.onboardingRoute, 
      page: () => const OnboardingScreen(), 
      binding: OnboardingBinding(),
      transition: Transition.noTransition
    ),

     GetPage<dynamic>(
      name: AppRoutes.onboardingAfterLoginRoute, 
      page: () => const OnboardingAfterLoginScreen(), 
      binding: OnboardingBinding(),
      transition: Transition.noTransition
    ),
  ];
}