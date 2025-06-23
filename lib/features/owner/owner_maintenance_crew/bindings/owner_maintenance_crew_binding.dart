import 'package:get/get.dart';
import '../controllers/owner_maintenance_crew_controller.dart';

class OwnerMaintenanceCrewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OwnerMaintenanceCrewController>(
      () => OwnerMaintenanceCrewController()
    );
  }
}
