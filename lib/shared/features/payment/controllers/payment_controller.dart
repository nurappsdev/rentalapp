import 'package:alora/core/enums/payment_option.dart';
import 'package:alora/core/extensions/date_time_extensions.dart';
import 'package:alora/core/utils/custom_snack_bar.dart';
import 'package:alora/shared/features/payment/widget/payment_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentController extends GetxController{
  final Rxn<PaymentOption?> selectedPaymentOption = Rxn<PaymentOption>(null);

  set updateSelectedPaymentOption(PaymentOption? paymentOption){
    if(paymentOption != null){
      selectedPaymentOption.value = paymentOption;
    }
  }

  late final TextEditingController holderNameCTRL;
  late final TextEditingController cardNumberCTRL;
  late final TextEditingController cvvCTRL;
  late final TextEditingController mmCTRL;

  final RxBool isAgreementAccepted = false.obs;

  set updateAgreementStatus(bool? value){
    if(value != null){
      isAgreementAccepted.value = value;
    }
    else{
      isAgreementAccepted.value = false;
    }
  }

  Future<PaymentData?> handlePayNow() async{
    if(!isAgreementAccepted.value){
      CustomSnackBar.show(message: "Mark the Check Box for accepting.");
      return null;
    }

    if(selectedPaymentOption.value == null){
      CustomSnackBar.show(message: "Select Payment Option");
      return null;
    }

    if(holderNameCTRL.text.trim().isEmpty){
      CustomSnackBar.show(message: "Fill the Holder Name Field");
      return null;
    }

    if(cvvCTRL.text.trim().isEmpty){
      CustomSnackBar.show(message: "Fill the CVV/CVC Field");
      return null;
    }

    if(mmCTRL.text.trim().isEmpty){
      CustomSnackBar.show(message: "Fill the MM/YY Field");
      return null;
    }
    
    return PaymentData(
      option: selectedPaymentOption.value!, 
      cardHolderName: holderNameCTRL.text.trim(), 
      cvv: cvvCTRL.text.trim(), 
      mm: mmCTRL.text.trim(),
      transactionId: "1234 5678 2345",
      paymentDate: DateTime.now().formattedDateTime,
    );
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
    holderNameCTRL = TextEditingController();
    cardNumberCTRL = TextEditingController();
    cvvCTRL = TextEditingController();
    mmCTRL = TextEditingController();
  }

  /// [dispose] Lifecycle method called when the controller is destroyed.
  ///
  /// Cleans up by resetting loading states and clearing lists and more...
  @override
  void dispose() {
    isAgreementAccepted.value = false;
    holderNameCTRL.dispose();
    cardNumberCTRL.dispose();
    cvvCTRL.dispose();
    mmCTRL.dispose();
    super.dispose();
  }
}