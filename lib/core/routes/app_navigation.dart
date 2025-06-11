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
      binding: SplashBinding()
    ),

    // onbaording routes
    GetPage<dynamic>(
      name: AppRoutes.onboardingRoute, 
      page: () => const OnboardingScreen(), 
      binding: OnboardingBinding()
    ),

    // choose role routes
    GetPage<dynamic>(
      name: AppRoutes.chooseRoleRoute, 
      page: () => const ChooseRoleScreen(), 
      binding: ChooseRoleBinding()
    ),


    // Auth routes
    GetPage<dynamic>(name: AppRoutes.signInRoute, page: () => const SignInScreen(), binding: AuthBinding()),
    GetPage<dynamic>(name: AppRoutes.signUpRoute, page: () => const SignUpScreen(), binding: AuthBinding()),
    GetPage<dynamic>(name: AppRoutes.verifyEmailRoute, page: () => const VerifyEmailScreen(), binding: AuthBinding()),
    GetPage<dynamic>(name: AppRoutes.takingEmailRoute, page: () => const TakingEmailScreen(), binding: AuthBinding()),
    GetPage<dynamic>(name: AppRoutes.resetPasswordRoute, page: () => const ResetPasswordScreen(), binding: AuthBinding()),
    // general routes
    GetPage<dynamic>(name: AppRoutes.generalRoute, page: () => const GeneralScreen(), binding: GeneralBinding()),

    // setting routes
    GetPage<dynamic>(name: AppRoutes.settingRoute, page: () => const SettingScreen(), binding: SettingBinding()),

  ];
}