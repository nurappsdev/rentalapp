import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/config/app_sizes.dart';
import 'package:alora/core/config/app_strings.dart';
import 'package:alora/core/routes/app_routes.dart';
import 'package:alora/core/utils/custom_bottom_sheet.dart';
import 'package:alora/core/widgets/custom_app_bar.dart';
import 'package:alora/shared/features/payment/widget/payment_card.dart';
import 'package:alora/shared/widgets/congratulation_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/renter_payment_controller.dart';

class RenterPaymentScreen extends GetView<RenterPaymentController> {
  const RenterPaymentScreen({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? arguments = Get.arguments;

    return Scaffold(
      appBar: const CustomAppBar(
        title: AppStrings.makePayment,
        showBackBtn: true,
        elevation: 0.0,
        backgroundColor: AppColors.whiteColor,
      ),
      backgroundColor: AppColors.surfaceColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.screenHorizontal),
          child: Column(
            children: <Widget>[
              const SizedBox(height: AppSizes.spaceBetweenItems,),
              Container(
                padding: const EdgeInsets.all(AppSizes.md),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: .5,
                    color: AppColors.dividerColor
                  ),
                  borderRadius: BorderRadius.circular(AppSizes.borderRadiusMd)
                ),
                child: PaymentCard(
                  price: arguments?["price"],
                  isAutoPay: true,
                  onPayCallBack: (PaymentData data){
                    CustomBottomSheet.showCustomBottomSheet(
                      context: context, 
                      isDismissible: false,
                      child: CongratulationSheet(
                        title: "Congratulations!",
                        description: "You have successfully registered your property. We will update you via email within 72 hours.",
                        onProceedCallback: (){
                          data.price = arguments?["price"];
                          data.email = "email.@gmail.com";
                          Get.toNamed(
                            AppRoutes.paymentTicketRoute,
                            arguments: data,
                          );
                        },
                      )
                    );
                  }
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
