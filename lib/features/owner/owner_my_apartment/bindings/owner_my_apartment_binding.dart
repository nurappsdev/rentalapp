import 'package:get/get.dart';
import '../controllers/owner_my_apartment_controller.dart';

class OwnerMyApartmentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OwnerMyApartmentController>(
      () => OwnerMyApartmentController()
    );
  }
}
