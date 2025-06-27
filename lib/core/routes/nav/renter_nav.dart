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

    GetPage<dynamic>(
      name: AppRoutes.renterMaintenanceRoute, 
      page: () => const RenterMaintenanceScreen(), 
      binding: RenterMaintenanceBinding(),
      transition: Transition.noTransition
    ),

    GetPage<dynamic>(
      name: AppRoutes.renterMaintenanceCreateRoute, 
      page: () => const RenterMaintenanceCreateScreen(), 
      binding: RenterMaintenanceCreateBinding(),
      transition: Transition.noTransition
    ),

    GetPage<dynamic>(
      name: AppRoutes.renterDocumentRoute, 
      page: () => const RenterDocumentsScreen(), 
      binding: RenterDocumentsBinding(),
      transition: Transition.noTransition
    ),


    GetPage<dynamic>(
      name: AppRoutes.renterDocumentCreateRoute, 
      page: () => const RenterCreateDocumentsScreen(), 
      binding: RenterDocumentsBinding(),
      transition: Transition.noTransition
    ),

    GetPage<dynamic>(
      name: AppRoutes.renterEventsRoute, 
      page: () => const RenterEventsScreen(), 
      binding: RenterEventsBinding(),
      transition: Transition.noTransition
    ),

    // payment
    GetPage<dynamic>(
      name: AppRoutes.renterBalanceDetailsRoute, 
      page: () => const RenterBalanceDetailsScreen(), 
      binding: RenterPaymentBinding(),
      transition: Transition.noTransition
    ),

    GetPage<dynamic>(
      name: AppRoutes.renterPastPaymentsRoute, 
      page: () => const RenterPastPaymentsScreen(), 
      binding: RenterPaymentBinding(),
      transition: Transition.noTransition
    ),

    GetPage<dynamic>(
      name: AppRoutes.renterPaymentDetailsRoute, 
      page: () => const RenterPaymentDetailsScreen(), 
      binding: RenterPaymentBinding(),
      transition: Transition.noTransition
    ),

    GetPage<dynamic>(
      name: AppRoutes.renterPaymentRoute, 
      page: () => const RenterPaymentScreen(), 
      binding: RenterPaymentBinding(),
      transition: Transition.noTransition
    ),


    GetPage<dynamic>(
      name: AppRoutes.renterRequestRoute, 
      page: () => const RenterRequestScreen(), 
      binding: RenterRequestBinding(),
      transition: Transition.noTransition
    ),


    GetPage<dynamic>(
      name: AppRoutes.renterProfileDocumentsRoute, 
      page: () => const RenterProfileDocumentsScreen(), 
      binding: ProfileBinding(),
      transition: Transition.noTransition
    ),


    GetPage<dynamic>(
      name: AppRoutes.renterProfileCreateDocumentsRoute, 
      page: () => const RenterProfileCreateDocumentsScreen(), 
      binding: ProfileBinding(),
      transition: Transition.noTransition
    ),
  ];
}