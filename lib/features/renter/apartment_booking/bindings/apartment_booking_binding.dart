import 'package:get/get.dart';
import '../controllers/apartment_booking_controller.dart';

class ApartmentBookingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApartmentBookingController>(
      () => ApartmentBookingController()
    );
  }
}
