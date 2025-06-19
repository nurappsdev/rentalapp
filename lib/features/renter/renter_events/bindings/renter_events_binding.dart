import 'package:get/get.dart';
import '../controllers/renter_events_controller.dart';

class RenterEventsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RenterEventsController>(
      () => RenterEventsController()
    );
  }
}
