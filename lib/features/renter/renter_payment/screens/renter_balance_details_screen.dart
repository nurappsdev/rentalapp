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

class RenterBalanceDetailsScreen extends GetView<RenterPaymentController> {
  const RenterBalanceDetailsScreen({
    super.key
  });

  @override
  Widget build(BuildContext context) {
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

              Text(
                "Your current due balance is ",
                style: context.txtTheme.headlineSmall,
              ),

              const SizedBox(height: AppSizes.xs,),

              Obx(
                (){
                  if(controller.balanceDetailsLoading.value){
                    return const RenterBalanceShimmer();
                  }
                  else if(controller.balanceDetails.value == null){
                    return const EmptyBalanceDetails().centered;
                  }
                  final RenterBalanceDetailsModel balanceDetails = controller.balanceDetails.value!;
                  return Column(
                    children: <Widget>[
                      Text(
                        "\$ ${balanceDetails.totalBill}",
                        style: context.txtTheme.headlineLarge?.copyWith(
                          color: AppColors.orange
                        ),
                      ),
                      const SizedBox(height: AppSizes.spaceBetweenItems,),
                      RenterBalanceCard(
                        balanceDetails: balanceDetails,
                        onMakePayment: () {
                          Get.toNamed(
                            AppRoutes.renterPaymentRoute,
                            arguments: <String, dynamic>{
                              "price": balanceDetails.totalBill
                            }
                          );
                        },
                        onAddAccount: () {
                          
                        },
                      ),
                    ],
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

