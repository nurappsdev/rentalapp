import 'package:alora/core/storage/secure_storage_service.dart';
import 'package:get/get.dart';
import '../controllers/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(
      () => SplashController(
        SecureStorageService()
      )
    );
  }
}
