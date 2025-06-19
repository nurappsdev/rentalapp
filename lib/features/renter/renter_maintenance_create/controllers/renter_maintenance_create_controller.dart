import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class RenterMaintenanceCreateController extends GetxController {

  final Rxn<File?> issueImage = Rxn<File>(null);
  final Rxn<File?> issuVideo = Rxn<File>(null);

  final RxBool isNeedEarlyService = false.obs;
  set updateNeedEarlyService(bool? value){
    if(value != null){
      isNeedEarlyService.value = value;
    }
  }

  final RxBool isYes = true.obs;
  set updateYes(bool? value){
    if(value != null){
      isYes.value = value;
    }
  }

  final TextEditingController calendarCTRL = TextEditingController();


  
  /// [onInit] Lifecycle method called when the controller is initialized.
  ///
  /// Resets loading states, clears existing data, and triggers and more..
  /// initial fetch
  /// 
  @override
  void onInit() {
    super.onInit();
    issueImage.value = null;
    issuVideo.value = null;
    isNeedEarlyService.value = false;
    isYes.value = true;
  }

  /// [dispose] Lifecycle method called when the controller is destroyed.
  ///
  /// Cleans up by resetting loading states and clearing lists and more...
  @override
  void dispose() {
    issueImage.value = null;
    issuVideo.value = null;
    isNeedEarlyService.value = false;
    isYes.value = true;
    super.dispose();
  }
}
