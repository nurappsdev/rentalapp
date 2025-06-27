import 'package:alora/core/enums/role_type.dart';
import 'package:alora/core/routes/app_routes.dart';
import 'package:alora/core/utils/helper_method.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {

  final Rx<RoleType> roleType = RoleType.rentar.obs;


  Future<void> getRoleType() async{
    roleType.value = await HelperMethod.getRoleType();
  }


  final RxBool isLoading = false.obs;

  Future<void> handleGetStarted() async{
    isLoading.value = true;
    await getRoleType();
    switch(roleType.value){
      case RoleType.rentar:
        Get.offAllNamed(AppRoutes.searchApartmentsRoute);
        break;
      case RoleType.owner:
        Get.offAllNamed(AppRoutes.ownerSubscriptionRoute);
        break;
      case RoleType.crew:
        Get.offAllNamed(AppRoutes.homeCrewRoute);
        break;
      case RoleType.agent:
        Get.offAllNamed(AppRoutes.homeOwnerRoute);
        break;
    }
    
    isLoading.value = false;
  }

  /// [onInit] Lifecycle method called when the controller is initialized.
  ///
  /// Resets loading states, clears existing data, and triggers and more..
  /// initial fetch
  /// 
  @override
  void onInit() {
    super.onInit();
    isLoading.value = false;
  }

  /// [dispose] Lifecycle method called when the controller is destroyed.
  ///
  /// Cleans up by resetting loading states and clearing lists and more...
  @override
  void dispose() {
    isLoading.value = false;
    super.dispose();
  }
}
