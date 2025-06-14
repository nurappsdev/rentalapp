import 'package:alora/core/enums/role_type.dart';
import 'package:alora/core/routes/app_routes.dart';
import 'package:alora/core/storage/secure_storage_service.dart';
import 'package:alora/core/utils/helper_method.dart';
import 'package:alora/shared/models/maintenance_model.dart';
import 'package:alora/shared/models/user_model.dart';
import 'package:get/get.dart';

class CustomSideDrawerController extends GetxController{

  late SecureStorageService _storage;

  final RxBool isRoleLoading = false.obs;

  Rx<UserModel?> user = Rx<UserModel?>(null);
  final RxBool userLoading = false.obs;


   Rx<RoleType> roleType = RoleType.rentar.obs;

   Future<void> getRoleType() async{
    isRoleLoading.value = true;
    roleType.value = await HelperMethod.getRoleType();
    isRoleLoading.value = false;
  }

  RxBool isRoleTypeMatch(RoleType roleType){
    if(this.roleType.value == roleType){
      return RxBool(true);
    }
    return RxBool(false);
  }

  final RxBool isLogoutLoading = false.obs;
  Future<void> handleLogout() async{
    isLogoutLoading.value = true;
    try {
      _storage.clear();
      Get.offAllNamed(AppRoutes.chooseRoleRoute);
    }
    finally{
      isLogoutLoading.value =false;
    }

  }



  /// [onInit] Lifecycle method called when the controller is initialized.
  ///
  /// Resets loading states, clears existing data, and triggers and more..
  /// initial fetch
  /// 
  @override
  void onInit() {
    super.onInit();
    _storage = SecureStorageService();
    isRoleLoading.value = false;
    isLogoutLoading.value = false;
    getRoleType();
    userLoading.value = true;
    Future<dynamic>.delayed(const Duration(seconds: 2), (){
      user.value = UserModel(
        name: 'Jane Doe',
        profileImage: MaintenanceModel.userImage,
        phoneNumber: '+1 555-123-4567',
        email: 'jane.doe@example.com',
        address: '123 Main Street, Springfield, USA',
      );
    });

    Future<dynamic>.delayed(const Duration(seconds: 4), (){
      userLoading.value = false;
    });
  }

  /// [dispose] Lifecycle method called when the controller is destroyed.
  ///
  /// Cleans up by resetting loading states and clearing lists and more...
  @override
  void dispose() {
    isRoleLoading.value = false;
    userLoading.value = false;
    isLogoutLoading.value = false;
    super.dispose();
  }
}