import 'package:get/get.dart';

class SignUpController extends GetxController {

  final RxBool isAgreementAccepted = false.obs;

  set updateAgreementStatus(bool? value){
    if(value != null && value == true){
      isAgreementAccepted.value = true;
    }
    else{
      isAgreementAccepted.value = false;
    }
  }

  /// [onInit] Lifecycle method called when the controller is initialized.
  ///
  /// Resets loading states, clears existing data, and triggers and more..
  /// initial fetch
  /// 
  @override
  void onInit() {
    super.onInit();
    isAgreementAccepted.value = false;
  }

  /// [dispose] Lifecycle method called when the controller is destroyed.
  ///
  /// Cleans up by resetting loading states and clearing lists and more...
  @override
  void dispose() {
    super.dispose();
    isAgreementAccepted.value = false;
  }
}
