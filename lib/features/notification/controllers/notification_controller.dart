import 'package:alora/features/notification/models/notification_model.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {

  final RxList<NotificationModel> notificationList = <NotificationModel>[].obs;
  final RxBool notificationLoading = false.obs;


  
  /// [onInit] Lifecycle method called when the controller is initialized.
  ///
  /// Resets loading states, clears existing data, and triggers and more..
  /// initial fetch
  /// 
  @override
  void onInit() {
    super.onInit();
    notificationLoading.value = true;
    Future<dynamic>.delayed(const Duration(seconds: 2), (){
      notificationList.value = NotificationModel.dummyNotifications;
    });

    Future<dynamic>.delayed(const Duration(seconds: 4), (){
      notificationLoading.value = false;
    });
  }

  /// [dispose] Lifecycle method called when the controller is destroyed.
  ///
  /// Cleans up by resetting loading states and clearing lists and more...
  @override
  void dispose() {
    notificationLoading.value = false;
    super.dispose();
  }
}
