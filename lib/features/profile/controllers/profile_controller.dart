import 'dart:io';

import 'package:alora/shared/models/maintenance_model.dart';
import 'package:alora/shared/models/user_model.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {

  Rx<UserModel?> user = Rx<UserModel?>(null);
  final RxBool userLoading = false.obs;

  final Rx<File?> profileImageFile = Rx<File?>(null);


  
  /// [onInit] Lifecycle method called when the controller is initialized.
  ///
  /// Resets loading states, clears existing data, and triggers and more..
  /// initial fetch
  /// 
  @override
  void onInit() {
    super.onInit();
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
    super.dispose();
    userLoading.value = false;
  }
}
