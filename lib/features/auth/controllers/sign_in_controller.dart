import 'package:alora/core/enums/role_type.dart';
import 'package:alora/core/utils/helper_method.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {

  final Rx<RoleType> roleType = RoleType.rentar.obs;


  Future<void> getRoleType() async{
    roleType.value = await HelperMethod.getRoleType();
  }
  

  
  /// [onInit] Lifecycle method called when the controller is initialized.
  ///
  /// Resets loading states, clears existing data, and triggers and more..
  /// initial fetch
  /// 
  @override
  void onInit() {
    super.onInit();
    getRoleType();
  }

  /// [dispose] Lifecycle method called when the controller is destroyed.
  ///
  /// Cleans up by resetting loading states and clearing lists and more...
  @override
  void dispose() {
    super.dispose();
  }
}
