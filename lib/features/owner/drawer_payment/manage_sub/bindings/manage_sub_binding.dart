
import 'package:get/get.dart';

import '../controller/manage_sub_controller.dart';


class ManageSubBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ManageSubController>(
            () => ManageSubController()
    );
  }
}
