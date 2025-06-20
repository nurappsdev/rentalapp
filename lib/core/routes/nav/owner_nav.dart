import 'package:get/get.dart';
import '../../../features/screens.dart';
import '../../../features/bindings.dart';
import '../app_routes.dart';

class OwnerNav{
  OwnerNav._();
  static final List<GetPage<dynamic>> routes = <GetPage<dynamic>>[
    // owner rotutes
    GetPage<dynamic>(
      name: AppRoutes.ownerSubscriptionRoute, 
      page: () => const OwnerSubscriptionScreen(), 
      binding: OwnerSubscriptionBinding(),
      transition: Transition.noTransition
    ),

    GetPage<dynamic>(
      name: AppRoutes.ownerSubscriptionPaymentRoute, 
      page: () => const OwnerSubscriptionPaymentScreen(), 
      binding: OwnerSubscriptionBinding(),
      transition: Transition.noTransition
    ),
  ];
}