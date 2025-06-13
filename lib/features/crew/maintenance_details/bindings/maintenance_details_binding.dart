import 'package:get/get.dart';
import '../controllers/maintenance_details_controller.dart';

class MaintenanceDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MaintenanceDetailsController>(
      () => MaintenanceDetailsController()
    );
  }
}
