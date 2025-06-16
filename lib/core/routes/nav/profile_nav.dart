import 'package:get/get.dart';
import '../../../features/screens.dart';
import '../../../features/bindings.dart';
import '../app_routes.dart';

class ProfileNav{
  ProfileNav._();
  static final List<GetPage<dynamic>> routes = <GetPage<dynamic>>[
   
    // Profile routes
    GetPage<dynamic>(
      name: AppRoutes.profileRoute, 
      page: () => const ProfileScreen(), 
      binding: ProfileBinding(),
      transition: Transition.noTransition
    ),

    GetPage<dynamic>(
      name: AppRoutes.editProfileRoute, 
      page: () => const EditProfileScreen(), 
      binding: ProfileBinding(),
      transition: Transition.noTransition
    ),
  ];
}