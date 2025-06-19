import 'package:get/get.dart';
import '../controllers/renter_maintenance_create_controller.dart';

class RenterMaintenanceCreateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RenterMaintenanceCreateController>(
      () => RenterMaintenanceCreateController()
    );
  }
}
