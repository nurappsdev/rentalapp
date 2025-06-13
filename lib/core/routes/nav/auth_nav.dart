import 'package:get/get.dart';
import '../../../features/screens.dart';
import '../../../features/bindings.dart';
import '../app_routes.dart';

class AuthNav{
  AuthNav._();
  static final List<GetPage<dynamic>> routes = <GetPage<dynamic>>[
   
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
  ];
}