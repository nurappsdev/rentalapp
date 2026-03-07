
import 'package:get/get.dart';

import '../controller/billongs_controller.dart';

class BillingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BillingsController>(
            () => BillingsController()
    );
  }
}