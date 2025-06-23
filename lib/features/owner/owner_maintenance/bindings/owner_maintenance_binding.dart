import 'package:get/get.dart';
import '../controllers/owner_maintenance_controller.dart';

class OwnerMaintenanceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OwnerMaintenanceController>(
      () => OwnerMaintenanceController()
    );
  }
}
