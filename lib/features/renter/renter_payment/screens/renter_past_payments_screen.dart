import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/config/app_icons.dart';
import 'package:alora/core/config/app_sizes.dart';
import 'package:alora/core/config/app_strings.dart';
import 'package:alora/core/extensions/context_extensions.dart';
import 'package:alora/core/extensions/date_time_extensions.dart';
import 'package:alora/core/routes/app_routes.dart';
import 'package:alora/core/widgets/custom_app_bar.dart';
import 'package:alora/core/widgets/custom_rounded_inner_icon.dart';
import 'package:alora/features/renter/renter_payment/models/renter_balance_details_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../controllers/renter_payment_controller.dart';

class RenterPastPaymentsScreen extends GetView<RenterPaymentController> {
  const RenterPastPaymentsScreen({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    controller.handleRetrivePastPayments();
    return Scaffold(
      appBar: const CustomAppBar(
        title: AppStrings.pastPayment,
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
                Container(),
                const SizedBox(height: AppSizes.spaceBetweenItems,),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    CustomRoundedInnerIcon(
                      icon: AppIcons.dateIcon,
                      iconColor: AppColors.whiteColor,
                      containerSize: 32.0,
                      bgColor: AppColors.primaryColor,
                    ),
                  ],
                ),
                const SizedBox(height: AppSizes.spaceBetweenItems,),

                ListView.separated(
                  shrinkWrap: true,
                  itemCount: controller.pastPayments.length,
                  itemBuilder: (_, int index){
                    final RenterBalanceDetailsModel pastPayment = controller.pastPayments[index];
                    return GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        Get.toNamed(
                          AppRoutes.renterPaymentDetailsRoute,
                          arguments: pastPayment.id
                        );
                      },
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                pastPayment.isSuccess ? 'Payment Success' : "Payment Due",
                                style: context.txtTheme.bodyMedium
                              ),
                              SvgPicture.asset(AppIcons.infoIcon, width: 24.0, height: 24.0,)
                            ],
                          ),
                      
                          const SizedBox(height: AppSizes.sm,),
                      
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                pastPayment.date.formattedDateTime12,
                                style: context.txtTheme.titleLarge
                              ),
                      
                              Text(
                                pastPayment.totalBill.toString(),
                                style: context.txtTheme.titleLarge
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  }, 
                  separatorBuilder: (_, int index){
                    if((index - 1) == controller.pastPayments.length){
                      return const SizedBox.shrink();
                    }
                    return const Column(
                      children: <Widget>[
                        SizedBox(height: AppSizes.sm,),
                        Divider(
                          thickness: .5,
                          color: AppColors.dividerColor,
                        ),
                        SizedBox(height: AppSizes.sm,),
                      ],
                    );
                  }, 
                ),
              ],
           ),
        ),
      ),
    );
  }
}
