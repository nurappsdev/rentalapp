import 'package:get/get.dart';
import '../controllers/renter_payment_controller.dart';

class RenterPaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RenterPaymentController>(
      () => RenterPaymentController()
    );
  }
}
