import 'package:alora/core/storage/secure_storage_service.dart';
import 'package:alora/features/auth/controllers/reset_password_controller.dart';
import 'package:alora/features/auth/controllers/taking_email_controller.dart';
import 'package:alora/features/auth/controllers/verify_email_controller.dart';
import 'package:get/get.dart';
import '../controllers/sign_in_controller.dart';
import '../controllers/sign_up_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignInController>(
      () => SignInController()
    );

    Get.lazyPut<SignUpController>(
      () => SignUpController()
    );

    Get.lazyPut<ResetPasswordController>(
      () => ResetPasswordController()
    );

    Get.lazyPut<TakingEmailController>(
      () => TakingEmailController()
    );

    Get.lazyPut<VerifyEmailController>(
      () => VerifyEmailController()
    );
  }
}
