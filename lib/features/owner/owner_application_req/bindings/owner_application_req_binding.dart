import 'package:get/get.dart';
import '../controllers/owner_application_req_controller.dart';

class OwnerApplicationReqBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OwnerApplicationReqController>(
      () => OwnerApplicationReqController()
    );
  }
}
