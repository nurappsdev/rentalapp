import 'package:alora/features/renter/renter_payment/models/renter_balance_details_model.dart';
import 'package:get/get.dart';

class RenterPaymentController extends GetxController {

  Rx<RenterBalanceDetailsModel?> balanceDetails = Rx<RenterBalanceDetailsModel?>(null);
  final RxBool balanceDetailsLoading = false.obs;

  final RxList<RenterBalanceDetailsModel> pastPayments = <RenterBalanceDetailsModel>[].obs;
  final RxBool pastPaymentsLoading = false.obs;


  Future<void> handleRetrievePastPayments() async{
    pastPaymentsLoading.value = true;
    Future<dynamic>.delayed(const Duration(seconds: 1), (){
      pastPayments.value = RenterBalanceDetailsModel.dummyBalanceDetailsList;
    });

    Future<dynamic>.delayed(const Duration(seconds: 2), (){
      pastPaymentsLoading.value = false;
    });
  }


  Rx<RenterBalanceDetailsModel?> pastPayment = Rx<RenterBalanceDetailsModel?>(null);
  final RxBool singlePastPaymentLoading = false.obs;

  String paymentId = '';
  set updatePaymentId(String paymentId) => this.paymentId = paymentId;

  Future<void> handleRetrieveSinglePastPayments() async{
    singlePastPaymentLoading.value = true;
    Future<dynamic>.delayed(const Duration(seconds: 1), (){
      pastPayment.value = RenterBalanceDetailsModel.dummyBalanceDetailsList.firstWhere(
        (RenterBalanceDetailsModel balance) => paymentId == balance.id
      );
    });

    Future<dynamic>.delayed(const Duration(seconds: 2), (){
      singlePastPaymentLoading.value = false;
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
    balanceDetailsLoading.value = true;
    Future<dynamic>.delayed(const Duration(seconds: 1), (){
      balanceDetails.value = RenterBalanceDetailsModel.dummyBalanceDetailsList.first;
    });

    Future<dynamic>.delayed(const Duration(seconds: 2), (){
      balanceDetailsLoading.value = false;
    });
  }

  /// [dispose] Lifecycle method called when the controller is destroyed.
  ///
  /// Cleans up by resetting loading states and clearing lists and more...
  @override
  void dispose() {
    balanceDetailsLoading.value = false;
    balanceDetails.value = null;
    super.dispose();
  }
}
