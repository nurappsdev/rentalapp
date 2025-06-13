import 'package:get/get.dart';
import '../../features/screens.dart';
import '../../features/bindings.dart';
import 'app_routes.dart';

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
    GetPage<dynamic>(
      name: AppRoutes.signInRoute,
      page: () => const SignInScreen(), 
      binding: AuthBinding(),
      transition: Transition.noTransition
    ),

    GetPage<dynamic>(
      name: AppRoutes.signUpRoute, 
      page: () => const SignUpScreen(), 
      binding: AuthBinding(),
      transition: Transition.noTransition
    ),

    GetPage<dynamic>(
      name: AppRoutes.verifyEmailRoute, 
      page: () => const VerifyEmailScreen(), 
      binding: AuthBinding(),
      transition: Transition.noTransition
    ),

    GetPage<dynamic>(
      name: AppRoutes.takingEmailRoute, 
      page: () => const TakingEmailScreen(), 
      binding: AuthBinding(),
      transition: Transition.noTransition
    ),
    
    GetPage<dynamic>(
      name: AppRoutes.resetPasswordRoute, 
      page: () => const ResetPasswordScreen(), 
      binding: AuthBinding(),
      transition: Transition.noTransition
    ),

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


     // home routes
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
      binding: HomeRentarBinding(),
      transition: Transition.noTransition
    ),


  ];
}