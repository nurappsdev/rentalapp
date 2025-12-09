import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/config/app_icons.dart';
import 'package:alora/core/config/app_sizes.dart';
import 'package:alora/core/config/app_strings.dart';
import 'package:alora/core/extensions/context_extensions.dart';
import 'package:alora/core/extensions/date_time_extensions.dart';
import 'package:alora/core/extensions/widget_extensions.dart';
import 'package:alora/core/routes/app_routes.dart';
import 'package:alora/core/widgets/custom_app_bar.dart';
import 'package:alora/core/widgets/custom_button.dart';
import 'package:alora/core/widgets/custom_rounded_inner_icon.dart';
import 'package:alora/features/renter/renter_payment/models/renter_balance_details_model.dart';
import 'package:alora/features/renter/renter_payment/widgets/empty_balance_details.dart';
import 'package:alora/features/renter/renter_payment/widgets/renter_balance_card.dart';
import 'package:alora/features/renter/renter_payment/widgets/renter_balance_shimmer.dart';
import 'package:alora/shared/widgets/empty_maintenance_details.dart';
import 'package:alora/shared/widgets/maintenance_details_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/renter_payment_controller.dart';

class RenterPaymentDetailsScreen extends GetView<RenterPaymentController> {
  const RenterPaymentDetailsScreen({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    controller.updatePaymentId = Get.arguments;
    controller.handleRetrieveSinglePastPayments();

    return Scaffold(
      appBar: const CustomAppBar(
        title: AppStrings.balanceDetails,
        showBackBtn: true,
        elevation: 0.0,
        backgroundColor: AppColors.whiteColor,
      ),
      backgroundColor: AppColors.surfaceColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.screenHorizontal),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: AppSizes.spaceBetweenItems,),

              Obx(
                (){
                  if(controller.singlePastPaymentLoading.value){
                    return const RenterBalanceShimmer();
                  }
                  else if(controller.pastPayment.value == null){
                    return const EmptyBalanceDetails().centered;
                  }
                  final RenterBalanceDetailsModel balanceDetails = controller.pastPayment.value!;
                  return RenterBalanceCard(
                    balanceDetails: balanceDetails,
                    onMakePayment: () {
                      Get.toNamed(
                        AppRoutes.renterPaymentRoute,
                        arguments: <String, dynamic>{
                          "isAutoPay": false,
                          "price": balanceDetails.totalBill
                        }
                      );
                    },
                    onAddAccount: () {
                      
                    },
                  );
                }
              ),

            ],
          ),
        ),
      ),
    );
  }
}

