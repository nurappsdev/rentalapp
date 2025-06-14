import 'package:get/get.dart';

class ContactUsController extends GetxController {

  final RxBool isLoading = false.obs;

  final Rx<String?> email = Rx<String?>(null);
  final Rx<String?> phone = Rx<String?>(null);

  Future<void> handleContactUsInfo() async{
    isLoading.value = true;
    try {
      await Future<dynamic>.delayed(const Duration(seconds: 3));
      email.value = "Support.info@gmail.com";
      phone.value = "+8801996655";
    }
    finally{
      isLoading.value = false;
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
    isLoading.value = false;
    handleContactUsInfo();
    email.value = null;
    phone.value = null;
  }

  /// [dispose] Lifecycle method called when the controller is destroyed.
  ///
  /// Cleans up by resetting loading states and clearing lists and more...
  @override
  void dispose() {
    isLoading.value = false;
    email.value = null;
    phone.value = null;
    super.dispose();
  }
}
