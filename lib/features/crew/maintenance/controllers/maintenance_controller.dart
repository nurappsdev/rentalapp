import 'package:alora/shared/models/maintenance_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MaintenanceController extends GetxController with GetTickerProviderStateMixin {

  late TabController tabController;

  final RxList<MaintenanceModel> maintenanceList = <MaintenanceModel>[].obs;
  final RxBool maintenanceLoading = false.obs;



  
  /// [onInit] Lifecycle method called when the controller is initialized.
  ///
  /// Resets loading states, clears existing data, and triggers and more..
  /// initial fetch
  /// 
  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
    maintenanceLoading.value = true;
    Future<dynamic>.delayed(const Duration(seconds: 2), (){
      maintenanceList.value = MaintenanceModel.dummyMaintenanceList;
    });

    Future<dynamic>.delayed(const Duration(seconds: 4), (){
      maintenanceLoading.value = false;
    });
  }

  /// [dispose] Lifecycle method called when the controller is destroyed.
  ///
  /// Cleans up by resetting loading states and clearing lists and more...
  @override
  void dispose() {
    tabController.dispose();
    maintenanceLoading.value = false;
    super.dispose();
  }
}
