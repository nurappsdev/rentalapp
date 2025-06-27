import 'package:get/get.dart';
import '../controllers/owner_create_apartment_controller.dart';

class OwnerCreateApartmentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OwnerCreateApartmentController>(
      () => OwnerCreateApartmentController()
    );
  }
}
