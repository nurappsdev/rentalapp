
import 'package:get/get.dart';

import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/utils/custom_snack_bar.dart';
import '../../../owner_subscription/model/subscription_model.dart';

class ManageSubController extends GetxController{


  final RxList<SubscriptionModel> subscriptions = <SubscriptionModel>[].obs;
  final RxBool subscriptionsLoading = false.obs;

  final Rxn<SubscriptionModel?> selectedSubscription = Rxn<SubscriptionModel?>(null);

  final RxBool isAgreementAccepted = false.obs;
  set updateAgreement(bool? value) {
    if(value != null){
      isAgreementAccepted.value = value;
    }
  }


  Future<void> handleContinue() async{
    if(selectedSubscription.value == null){
      return CustomSnackBar.show(
          message: "Select one subscription",
          type: SnackBarType.warning
      );
    }
    Get.toNamed(
        AppRoutes.manageSubscription,
        arguments: <String, double?>{
          "price": selectedSubscription.value?.price,
        }
    );
  }

  Future<void> handleRetrieveSubscriptions(String unitType) async{
    subscriptionsLoading.value = true;
    await Future<dynamic>.delayed(const Duration(seconds: 1), (){
      subscriptions.value = SubscriptionModel.dummySubscriptions.where((SubscriptionModel subs) => subs.unitType == unitType).toList();
    });

    await Future<dynamic>.delayed(const Duration(seconds: 2), (){
      subscriptionsLoading.value = false;
    });
  }



  /// [onInit] Lifecycle method called when the controller is initialized.
  ///
  /// Resets loading states, clears existing data, and triggers and more..
  /// initial fetch
  ///
  @override
  void onInit() {
    super.onInit();
    selectedSubscription.value = null;
    isAgreementAccepted.value = false;


    // subscriptionsLoading.value = true;
    // Future<dynamic>.delayed(const Duration(seconds: 1), (){
    //   subscriptions.value = SubscriptionModel.dummySubscriptions;
    // });

    // Future<dynamic>.delayed(const Duration(seconds: 2), (){
    //   subscriptionsLoading.value = false;
    // });
  }

  /// [dispose] Lifecycle method called when the controller is destroyed.
  ///
  /// Cleans up by resetting loading states and clearing lists and more...
  @override
  void dispose() {
    subscriptionsLoading.value = false;
    isAgreementAccepted.value = false;
    selectedSubscription.value = null;
    super.dispose();
  }
}