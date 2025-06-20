import 'package:get/get.dart';
import '../controllers/owner_allocate_bill_controller.dart';

class OwnerAllocateBillBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OwnerAllocateBillController>(
      () => OwnerAllocateBillController()
    );
  }
}
