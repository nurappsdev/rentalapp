import 'package:alora/core/enums/role_type.dart';
import 'package:get/get.dart';



class ChooseRoleController extends GetxController {

  final RxInt count = 0.obs;

  void increment() => count.value++;

  Rx<RoleType> roleType = RoleType.rentar.obs;

  void updateRoleType(RoleType roleType, bool? value) {
    if(value != null && value == true){
      this.roleType.value = roleType;
    }
  }

  RxBool isRoleTypeMatch(RoleType roleType){
    if(this.roleType.value == roleType){
      return RxBool(true);
    }
    return RxBool(false);
  }

  
  /// [onInit] Lifecycle method called when the controller is initialized.
  ///
  /// Resets loading states, clears existing data, and triggers and more..
  /// initial fetch
  /// 
  @override
  void onInit() {
    super.onInit();
    count.value = 0;
  }

  /// [dispose] Lifecycle method called when the controller is destroyed.
  ///
  /// Cleans up by resetting loading states and clearing lists and more...
  @override
  void dispose() {
    super.dispose();
    count.value = 0;
  }
}
