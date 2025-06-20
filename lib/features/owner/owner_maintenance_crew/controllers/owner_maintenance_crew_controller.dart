import '../models/maintenance_crew_model.dart';
import 'package:get/get.dart';

class OwnerMaintenanceCrewController extends GetxController {


  final RxList<MaintenanceCrewModel> crews = <MaintenanceCrewModel>[].obs;
  final RxBool crewsLoading = false.obs;


  final Rxn<MaintenanceCrewModel> singleCrew = Rxn<MaintenanceCrewModel>(null);
  final RxBool singleCrewLoading = false.obs;

  String crewId = '';
  set updateCrewId(String? crewId){
    if(crewId != null){
      this.crewId = crewId;
    }
  }

  Future<void> hanldeRetriveSingleCrew() async{
    singleCrewLoading.value = true;

    await Future<dynamic>.delayed(const Duration(milliseconds: 400), (){
      singleCrew.value = MaintenanceCrewModel.dummyMaintenanceCrewModels.firstWhere(
        (MaintenanceCrewModel crew) => crew.id == crewId
      );
    });

    await Future<dynamic>.delayed(const Duration(milliseconds: 800), (){
      singleCrewLoading.value = false;
    });
  }

  
  /// [onInit] Lifecycle method called when the controller is initialized.
  ///
  /// Resets loading states, clears existing data, and triggers and more..
  /// initial fetch
  /// 
  @override
  void onInit() {
    super.onInit();

    crewsLoading.value = true;
    Future<dynamic>.delayed(const Duration(seconds: 1), (){
      crews.value = MaintenanceCrewModel.dummyMaintenanceCrewModels;
    });

    Future<dynamic>.delayed(const Duration(seconds: 2), (){
      crewsLoading.value = false;
    });
  }

  /// [dispose] Lifecycle method called when the controller is destroyed.
  ///
  /// Cleans up by resetting loading states and clearing lists and more...
  @override
  void dispose() {
    crewsLoading.value = false;
    updateCrewId = '';
    crews.clear();
    super.dispose();
  }
}
