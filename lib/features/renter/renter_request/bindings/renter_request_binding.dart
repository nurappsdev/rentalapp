import 'package:get/get.dart';
import '../controllers/renter_request_controller.dart';

class RenterRequestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RenterRequestController>(
      () => RenterRequestController()
    );
  }
}
