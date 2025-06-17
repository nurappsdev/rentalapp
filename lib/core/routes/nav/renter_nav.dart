import 'package:get/get.dart';
import '../../../features/screens.dart';
import '../../../features/bindings.dart';
import '../app_routes.dart';

class RenterNav{
  RenterNav._();
  static final List<GetPage<dynamic>> routes = <GetPage<dynamic>>[
   
    // Renter routes
    GetPage<dynamic>(
      name: AppRoutes.searchApartmentsRoute, 
      page: () => const SearchApartmentsScreen(), 
      binding: SearchApartmentsBinding(),
      transition: Transition.noTransition
    ),

    GetPage<dynamic>(
      name: AppRoutes.apartmentDetailsRoute, 
      page: () => const ApartmentDetailsScreen(), 
      binding: ApartmentDetailsBinding(),
      transition: Transition.noTransition
    ),

    GetPage<dynamic>(
      name: AppRoutes.apartmentBookingRoute, 
      page: () => const ApartmentBookingScreen(), 
      binding: ApartmentBookingBinding(),
      transition: Transition.noTransition
    ),
  ];
}