import 'package:get/get.dart';
import '../controllers/owner_event_controller.dart';

class OwnerEventBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OwnerEventController>(
      () => OwnerEventController()
    );
  }
}
