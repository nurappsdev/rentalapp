import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RenterDocumentsController extends GetxController with GetSingleTickerProviderStateMixin {

  late TabController tabController;

  final RxList<String> pendingDocumentsList = <String>[].obs;
  final RxBool pendingDocumentsLoading = false.obs;

  final RxList<String> completedDocumentsList = <String>[].obs;
  final RxBool compeletedDocumentsLoading = false.obs;

  final Rx<File?> uploadedDoc = Rx<File?>(null);

  
  /// [onInit] Lifecycle method called when the controller is initialized.
  ///
  /// Resets loading states, clears existing data, and triggers and more..
  /// initial fetch
  /// 
  @override
  void onInit() {
    tabController = TabController(length: 2, vsync: this);
    uploadedDoc.value = null;
    pendingDocumentsLoading.value = true;
    Future<dynamic>.delayed(const Duration(seconds: 2), (){
      pendingDocumentsList.value = <String>["document"];
    });

    Future<dynamic>.delayed(const Duration(seconds: 4), (){
      pendingDocumentsLoading.value = false;
    });


    compeletedDocumentsLoading.value = true;
    Future<dynamic>.delayed(const Duration(seconds: 2), (){
      completedDocumentsList.value = <String>["document"];
    });

    Future<dynamic>.delayed(const Duration(seconds: 4), (){
      compeletedDocumentsLoading.value = false;
    });
    super.onInit();
  }

  /// [dispose] Lifecycle method called when the controller is destroyed.
  ///
  /// Cleans up by resetting loading states and clearing lists and more...
  @override
  void dispose() {
    tabController.dispose();
    uploadedDoc.value = null;
    pendingDocumentsLoading.value = false;
    compeletedDocumentsLoading.value = false;
    pendingDocumentsList.clear();
    completedDocumentsList.clear();
    super.dispose();
  }
}
