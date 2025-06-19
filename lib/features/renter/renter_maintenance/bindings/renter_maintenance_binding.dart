import 'package:get/get.dart';
import '../controllers/renter_maintenance_controller.dart';

class RenterMaintenanceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RenterMaintenanceController>(
      () => RenterMaintenanceController()
    );
  }
}
