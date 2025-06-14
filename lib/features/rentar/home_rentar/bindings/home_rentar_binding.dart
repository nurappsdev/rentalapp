import 'package:get/get.dart';
import '../controllers/home_rentar_controller.dart';

class HomeRentarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeRentarController>(
      () => HomeRentarController()
    );
  }
}
