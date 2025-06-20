import 'package:get/get.dart';
import '../controllers/owner_renter_list_controller.dart';

class OwnerRenterListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OwnerRenterListController>(
      () => OwnerRenterListController()
    );
  }
}
