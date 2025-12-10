import 'package:get/get.dart';
import '../../maintenance/controllers/maintenance_controller.dart';
import '../controllers/home_crew_controller.dart';

class HomeCrewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeCrewController>(
      () => HomeCrewController()
    );
    Get.lazyPut<MaintenanceController>(
      () => MaintenanceController()
    );
  }
}
