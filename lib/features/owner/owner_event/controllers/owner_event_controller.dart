import 'dart:io';

import 'package:flutter/material.dart';

import '../models/owner_event_model.dart';
import 'package:get/get.dart';

class OwnerEventController extends GetxController {

  final RxList<OwnerEventModel> events = <OwnerEventModel>[].obs;
  final RxBool eventsLoading = false.obs;

  late TextEditingController dateCTRL;
  late TextEditingController titleCTRL;
  late TextEditingController descriptionCTRL;
  final Rxn<File?> eventImage = Rxn<File?>(null);

  Future<void> handleAddOrEditEvent() async{
    Get.back();
    dateCTRL.clear();
    titleCTRL.clear();
    descriptionCTRL.clear();
    eventImage.value = null;
  }


  
  /// [onInit] Lifecycle method called when the controller is initialized.
  ///
  /// Resets loading states, clears existing data, and triggers and more..
  /// initial fetch
  /// 
  @override
  void onInit() {
    super.onInit();
    dateCTRL = TextEditingController();
    titleCTRL = TextEditingController();
    descriptionCTRL = TextEditingController();

    eventsLoading.value = true;
    Future<dynamic>.delayed(const Duration(seconds: 1), (){
      events.value = OwnerEventModel.ownerEvents;
    });

    Future<dynamic>.delayed(const Duration(seconds: 2), (){
      eventsLoading.value = false;
    });
  }

  /// [dispose] Lifecycle method called when the controller is destroyed.
  ///
  /// Cleans up by resetting loading states and clearing lists and more...
  @override
  void dispose() {
    events.clear();
    dateCTRL.dispose();
    titleCTRL.dispose();
    descriptionCTRL.dispose();
    eventsLoading.value = false;
    super.dispose();
  }
}
