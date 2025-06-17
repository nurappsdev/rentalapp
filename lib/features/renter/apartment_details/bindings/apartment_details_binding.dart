import 'package:get/get.dart';
import '../controllers/apartment_details_controller.dart';

class ApartmentDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApartmentDetailsController>(
      () => ApartmentDetailsController()
    );
  }
}
