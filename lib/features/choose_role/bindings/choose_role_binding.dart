import 'package:alora/core/storage/secure_storage_service.dart';
import 'package:get/get.dart';
import '../controllers/choose_role_controller.dart';

class ChooseRoleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChooseRoleController>(
      () => ChooseRoleController(
        SecureStorageService()
      )
    );
  }
}
