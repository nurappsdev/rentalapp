import 'package:get/get.dart';
import '../../../features/screens.dart';
import '../../../features/bindings.dart';
import '../app_routes.dart';

class OwnerNav{
  OwnerNav._();
  static final List<GetPage<dynamic>> routes = <GetPage<dynamic>>[
    // owner rotutes

    // subscription
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

    // allocate bill
    GetPage<dynamic>(
      name: AppRoutes.ownerAllocateBillRoute, 
      page: () => const OwnerAllocateBillScreen(), 
      binding: OwnerAllocateBillBinding(),
      transition: Transition.noTransition
    ),

    GetPage<dynamic>(
      name: AppRoutes.ownerAllocateBillDetailsRoute, 
      page: () => const OwnerAllocateBillDetailsScreen(), 
      binding: OwnerAllocateBillBinding(),
      transition: Transition.noTransition
    ),

    GetPage<dynamic>(
      name: AppRoutes.ownerCreateAllocateBillRoute, 
      page: () => const OwnerCreateAllocateBillScreen(), 
      binding: OwnerAllocateBillBinding(),
      transition: Transition.noTransition
    ),

    // documents
    GetPage<dynamic>(
      name: AppRoutes.ownerDocumentsRoute, 
      page: () => const OwnerDocumentsScreen(), 
      binding: OwnerDocumentsBinding(),
      transition: Transition.noTransition
    ),

    GetPage<dynamic>(
      name: AppRoutes.ownerCreateDocumentsRoute, 
      page: () => const OwnerCreateDocumentsScreen(), 
      binding: OwnerDocumentsBinding(),
      transition: Transition.noTransition
    ),

    GetPage<dynamic>(
      name: AppRoutes.ownerApartmentDocumentsRoute, 
      page: () => const OwnerApartmentDocumentsScreen(), 
      binding: OwnerDocumentsBinding(),
      transition: Transition.noTransition
    ),

    // maintenance crew
    GetPage<dynamic>(
      name: AppRoutes.ownerMaintenanceCrewRoute, 
      page: () => const OwnerMaintenanceCrewScreen(), 
      binding: OwnerMaintenanceCrewBinding(),
      transition: Transition.noTransition
    ),

    GetPage<dynamic>(
      name: AppRoutes.ownerCreateMaintenanceCrewRoute, 
      page: () => const OwnerCreateMaintenanceCrewScreen(), 
      binding: OwnerMaintenanceCrewBinding(),
      transition: Transition.noTransition
    ),

    GetPage<dynamic>(
      name: AppRoutes.ownerMaintenanceCrewDetailsRoute, 
      page: () => const OwnerMaintenanceCrewDetailsScreen(), 
      binding: OwnerMaintenanceCrewBinding(),
      transition: Transition.noTransition
    ),

    // event
    GetPage<dynamic>(
      name: AppRoutes.ownerEventsRoute, 
      page: () => const OwnerEventScreen(), 
      binding: OwnerEventBinding(),
      transition: Transition.noTransition
    ),

    GetPage<dynamic>(
      name: AppRoutes.ownerCreateEventRoute, 
      page: () => const OwnerCreateEventScreen(), 
      binding: OwnerEventBinding(),
      transition: Transition.noTransition
    ),

    // renter list
    GetPage<dynamic>(
      name: AppRoutes.ownerRenterListRoute, 
      page: () => const OwnerRenterListScreen(), 
      binding: OwnerRenterListBinding(),
      transition: Transition.noTransition
    ),

    GetPage<dynamic>(
      name: AppRoutes.ownerRenterListDetailsRoute, 
      page: () => const OwnerRenterListDetailsScreen(), 
      binding: OwnerRenterListBinding(),
      transition: Transition.noTransition
    ),

    // maintenance
    GetPage<dynamic>(
      name: AppRoutes.ownerMaintenanceRoute, 
      page: () => const OwnerMaintenanceScreen(), 
      binding: OwnerMaintenanceBinding(),
      transition: Transition.noTransition
    ),

    GetPage<dynamic>(
      name: AppRoutes.ownerMaintenanceDetailsRoute, 
      page: () => const OwnerMaintenanceDetailsScreen(), 
      binding: OwnerMaintenanceBinding(),
      transition: Transition.noTransition
    ),


    // application req
    GetPage<dynamic>(
      name: AppRoutes.ownerApplicationReqRoute, 
      page: () => const OwnerApplicationReqScreen(), 
      binding: OwnerApplicationReqBinding(),
      transition: Transition.noTransition
    ),

    GetPage<dynamic>(
      name: AppRoutes.ownerApplicationReqUnitDetailsRoute, 
      page: () => const OwnerApplicationReqUnitDetailsScreen(), 
      binding: OwnerApplicationReqBinding(),
      transition: Transition.noTransition
    ),
    GetPage<dynamic>(
      name: AppRoutes.ownerApplicationReqUnitListRoute, 
      page: () => const OwnerApplicationReqUnitListScreen(), 
      binding: OwnerApplicationReqBinding(),
      transition: Transition.noTransition
    ),

    GetPage<dynamic>(
      name: AppRoutes.ownerApplicationReqUserDetailsRoute, 
      page: () => const OwnerApplicationReqUserDetailsscreen(), 
      binding: OwnerApplicationReqBinding(),
      transition: Transition.noTransition
    ),


    // my aparmtent

    GetPage<dynamic>(
      name: AppRoutes.ownerMyApartmentRoute, 
      page: () => const OwnerMyApartmentScreen(), 
      binding: OwnerMyApartmentBinding(),
      transition: Transition.noTransition
    ),
    GetPage<dynamic>(
      name: AppRoutes.ownerMyApartmentListRoute, 
      page: () => const OwnerApartmentListScreen(), 
      binding: OwnerMyApartmentBinding(),
      transition: Transition.noTransition
    ),
    GetPage<dynamic>(
      name: AppRoutes.ownerMyApartmentEditRoute, 
      page: () => const OwnerApartmentEditScreen(), 
      binding: OwnerMyApartmentBinding(),
      transition: Transition.noTransition
    ),
    GetPage<dynamic>(
      name: AppRoutes.ownerMyApartmentUnitListRoute, 
      page: () => const OwnerApartmentUnitListScreen(), 
      binding: OwnerMyApartmentBinding(),
      transition: Transition.noTransition
    ),

    GetPage<dynamic>(
      name: AppRoutes.ownerMyApartmentUnitEditRoute, 
      page: () => const OwnerApartmentUnitEditScreen(), 
      binding: OwnerMyApartmentBinding(),
      transition: Transition.noTransition
    ),
    GetPage<dynamic>(
      name: AppRoutes.ownerMyApartmentUnitDetailsRoute, 
      page: () => const OwnerApartmentUnitDetailsScreen(), 
      binding: OwnerMyApartmentBinding(),
      transition: Transition.noTransition
    ),
    GetPage<dynamic>(
      name: AppRoutes.ownerMyApartmentUnitDetailsEditRoute, 
      page: () => const OwnerApartmentUnitDetailsEditScreen(), 
      binding: OwnerMyApartmentBinding(),
      transition: Transition.noTransition
    ),
    GetPage<dynamic>(
      name: AppRoutes.ownerMyApartmentPreviewRoute, 
      page: () => const OwnerApartmentPreviewScreen(), 
      binding: OwnerMyApartmentBinding(),
      transition: Transition.noTransition
    ),
    GetPage<dynamic>(
      name: AppRoutes.ownerMyApartmentRenterDetailsRoute, 
      page: () => const OwnerApartmentRenterDetailsScreen(), 
      binding: OwnerMyApartmentBinding(),
      transition: Transition.noTransition
    ),

    // create apartment
    GetPage<dynamic>(
      name: AppRoutes.ownerCreateApartmentAddUnitRoute, 
      page: () => const OwnerCreateApartmentAddUnitScreen(), 
      binding: OwnerCreateApartmentBinding(),
      transition: Transition.noTransition
    ),
    GetPage<dynamic>(
      name: AppRoutes.ownerCreateApartmentCreateUnitFirstRoute, 
      page: () => const OwnerCreateApartmentCreateUnitFirstScreen(), 
      binding: OwnerCreateApartmentBinding(),
      transition: Transition.noTransition
    ),
    GetPage<dynamic>(
      name: AppRoutes.ownerCreateApartmentCreateUnitSecondRoute, 
      page: () => const OwnerCreateApartmentCreateUnitSecondScreen(), 
      binding: OwnerCreateApartmentBinding(),
      transition: Transition.noTransition
    ),
    GetPage<dynamic>(
      name: AppRoutes.ownerCreateApartmentFormSetupRoute, 
      page: () => const OwnerCreateApartmentFormSetupScreen(), 
      binding: OwnerCreateApartmentBinding(),
      transition: Transition.noTransition
    ),
    GetPage<dynamic>(
      name: AppRoutes.ownerCreateApartmentPreviewRoute, 
      page: () => const OwnerCreateApartmentPreviewScreen(), 
      binding: OwnerCreateApartmentBinding(),
      transition: Transition.noTransition
    ),
    GetPage<dynamic>(
      name: AppRoutes.ownerCreateApartmentRoute, 
      page: () => const OwnerCreateApartmentScreen(), 
      binding: OwnerCreateApartmentBinding(),
      transition: Transition.noTransition
    ),

    // renter list documents
    GetPage<dynamic>(
      name: AppRoutes.ownerRenterListDocumentsRoute, 
      page: () => const OwnerRenterListDocumentsScreen(), 
      binding: OwnerRenterListBinding(),
      transition: Transition.noTransition
    ),
    GetPage<dynamic>(
      name: AppRoutes.ownerRenterListCreateDocumentsRoute, 
      page: () => const OwnerRenterListCreateDocumentsScreen(), 
      binding: OwnerRenterListBinding(),
      transition: Transition.noTransition
    ),



  ];
}