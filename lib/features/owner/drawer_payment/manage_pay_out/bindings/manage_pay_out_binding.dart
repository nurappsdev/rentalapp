
import 'package:alora/features/owner/drawer_payment/manage_pay_out/controller/manage_pay_out_controller.dart';
import 'package:get/get.dart';

class ManagePayOutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ManagePayOutController>(
            () => ManagePayOutController()
    );
  }
}
