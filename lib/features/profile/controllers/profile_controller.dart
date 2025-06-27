import 'dart:io';

import 'package:alora/core/enums/role_type.dart';
import 'package:alora/core/utils/helper_method.dart';
import 'package:alora/shared/models/maintenance_model.dart';
import 'package:alora/shared/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController with GetSingleTickerProviderStateMixin{

  Rx<UserModel?> user = Rx<UserModel?>(null);
  final RxBool userLoading = false.obs;

  final Rx<File?> profileImageFile = Rx<File?>(null);


  Rx<RoleType> roleType = RoleType.rentar.obs;

   Future<void> getRoleType() async{
    roleType.value = await HelperMethod.getRoleType();
  }

  final RxBool isVacentBtnVisible = true.obs;


  late TabController tabController;

  final Rx<File?> uploadedDoc = Rx<File?>(null);


  final RxList<String> pendingDocumentsList = <String>[].obs;
  final RxBool pendingDocumentsLoading = false.obs;

  final RxList<String> completedDocumentsList = <String>[].obs;
  final RxBool compeletedDocumentsLoading = false.obs;

  
  /// [onInit] Lifecycle method called when the controller is initialized.
  ///
  /// Resets loading states, clears existing data, and triggers and more..
  /// initial fetch
  /// 
  @override
  void onInit() {
    super.onInit();
    uploadedDoc.value = null;

    tabController = TabController(length: 2, vsync: this);
    getRoleType();
    isVacentBtnVisible.value = true;

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

    pendingDocumentsLoading.value = true;
    Future<dynamic>.delayed(const Duration(seconds: 1), (){
      pendingDocumentsList.value = <String>["document"];
    });

    Future<dynamic>.delayed(const Duration(seconds: 2), (){
      pendingDocumentsLoading.value = false;
    });


    compeletedDocumentsLoading.value = true;
    Future<dynamic>.delayed(const Duration(seconds: 1), (){
      completedDocumentsList.value = <String>["document"];
    });

    Future<dynamic>.delayed(const Duration(seconds: 2), (){
      compeletedDocumentsLoading.value = false;
    });
  }

  /// [dispose] Lifecycle method called when the controller is destroyed.
  ///
  /// Cleans up by resetting loading states and clearing lists and more...
  @override
  void dispose() {
    uploadedDoc.value = null;
    userLoading.value = false;
    isVacentBtnVisible.value = true;
    tabController.dispose();
    uploadedDoc.value = null;
    pendingDocumentsLoading.value = false;
    compeletedDocumentsLoading.value = false;
    pendingDocumentsList.clear();
    completedDocumentsList.clear();
    super.dispose();
  }
}
