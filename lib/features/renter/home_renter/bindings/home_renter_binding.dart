import 'package:get/get.dart';
import '../controllers/home_renter_controller.dart';

class HomeRenterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeRenterController>(
      () => HomeRenterController()
    );
  }
}
