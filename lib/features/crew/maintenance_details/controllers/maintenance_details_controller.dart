import 'package:alora/shared/models/maintenance_model.dart';
import 'package:get/get.dart';

class MaintenanceDetailsController extends GetxController {

  String maintenenceId = '';

  set updateMaintenanceId(String maintenenceId) => this.maintenenceId = maintenenceId;

  Rx<MaintenanceModel?> maintenance = Rx<MaintenanceModel?>(null);
  final RxBool maintenanceLoading = false.obs;

  
  /// [onInit] Lifecycle method called when the controller is initialized.
  ///
  /// Resets loading states, clears existing data, and triggers and more..
  /// initial fetch
  /// 
  @override
  void onInit() {
    super.onInit();
    maintenanceLoading.value = true;
    Future<dynamic>.delayed(const Duration(seconds: 2), (){
      maintenance.value = MaintenanceModel.dummyMaintenanceList.firstWhere(
        (MaintenanceModel item) => item.id == maintenenceId,
      );
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
    maintenanceLoading.value = false;
    super.dispose();
  }
}
