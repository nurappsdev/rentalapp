

import 'package:alora/features/owner/drawer_payment/account_analylical_screen/controller/account_analytical_controller.dart';
import 'package:get/get.dart';



class AccountAnalyticalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccountAnalyticalController>(
            () => AccountAnalyticalController()
    );
  }
}
