import 'package:alora/core/config/app_constants.dart';
import 'package:alora/core/enums/role_type.dart';
import 'package:alora/core/routes/app_routes.dart';
import 'package:alora/core/storage/secure_storage_service.dart';
import 'package:get/get.dart';



class ChooseRoleController extends GetxController {

  final SecureStorageService _storage;

  ChooseRoleController(this._storage);

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

  Future<void> handleContinue() async{
    await _storage.write(AppConstants.roleType, roleType.value.name);
    Get.toNamed(AppRoutes.signInRoute);
  }

  
  /// [onInit] Lifecycle method called when the controller is initialized.
  ///
  /// Resets loading states, clears existing data, and triggers and more..
  /// initial fetch
  /// 
  @override
  void onInit() {
    super.onInit();
  }

  /// [dispose] Lifecycle method called when the controller is destroyed.
  ///
  /// Cleans up by resetting loading states and clearing lists and more...
  @override
  void dispose() {
    super.dispose();
  }
}
