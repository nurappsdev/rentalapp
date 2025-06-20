import 'package:get/get.dart';
import '../controllers/owner_subscription_controller.dart';

class OwnerSubscriptionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OwnerSubscriptionController>(
      () => OwnerSubscriptionController()
    );
  }
}
