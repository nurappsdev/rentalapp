import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/config/app_icons.dart';
import 'package:alora/core/config/app_sizes.dart';
import 'package:alora/core/config/app_strings.dart';
import 'package:alora/core/extensions/context_extensions.dart';
import 'package:alora/core/extensions/date_time_extensions.dart';
import 'package:alora/core/widgets/custom_button.dart';
import 'package:alora/core/widgets/custom_rounded_inner_icon.dart';
import 'package:alora/features/renter/renter_payment/models/renter_balance_details_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class RenterBalanceCard extends StatelessWidget {
  final VoidCallback onMakePayment;
  final VoidCallback onAddAccount;
  const RenterBalanceCard({
    super.key,
    required this.balanceDetails,
    required this.onAddAccount,
    required this.onMakePayment,
  });

  final RenterBalanceDetailsModel balanceDetails;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.md, vertical: AppSizes.sm),
          decoration: BoxDecoration(
             color: balanceDetails.isSuccess ? AppColors.successColor : AppColors.primaryColor.withValues(alpha: .5),
             borderRadius: BorderRadius.circular(AppSizes.borderRadiusSm)
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                balanceDetails.date.formattedDate,
                style: context.txtTheme.bodyLarge?.copyWith(
                  color: balanceDetails.isSuccess ? AppColors.textWhiteColor : AppColors.textBlackColor,
                ),
              ),
              if(balanceDetails.isSuccess) Text(
                AppStrings.paymentSuccess,
                style: context.txtTheme.labelLarge?.copyWith(
                  color: balanceDetails.isSuccess ? AppColors.textWhiteColor : AppColors.textBlackColor,
                ),
              ),
            ],
          ),
        ),
    
        const SizedBox(height: AppSizes.spaceBetweenItems,),
    
        _billRow(context: context, label: "Rent", bill: balanceDetails.rent),
        _billRow(context: context, label: "Gas Bill", bill: balanceDetails.gasBill),
        _billRow(context: context, label: "Water Bill", bill: balanceDetails.waterBill),
        _billRow(context: context, label: "Utility Administation Fee", bill: balanceDetails.utilityAdminFee),
        _billRow(context: context, label: "Trush Reimbursement", bill: balanceDetails.trashReimbursement),
        _billRow(context: context, label: "Renters Insurance", bill: balanceDetails.rentersInsurance),
        _billRow(context: context, label: "Parking Rent", bill: balanceDetails.parkingRent),
        _billRow(context: context, label: "Pest Controll Bill", bill: balanceDetails.pestControlBill),

        const SizedBox(height: AppSizes.spaceBetweenSections),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(
              balanceDetails.isSuccess ? "Total balance : " : "Total Due balance : ",
              style: context.txtTheme.titleLarge,
            ),
            Text(
              "\$ ${balanceDetails.totalBill}",
              style: context.txtTheme.titleLarge?.copyWith(
                color: balanceDetails.isSuccess ? null : AppColors.orange
              ),
            )
          ],
        ),


        const SizedBox(height: AppSizes.spaceBetweenItems,),
        
        if(balanceDetails.isSuccess) Container(
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(AppSizes.borderRadiusMd),
            border: Border.all(
              color: AppColors.dividerColor,
              width: AppSizes.dividerHeight
            )
          ),
          child: ListTile(
            leading: const CustomRoundedInnerIcon(
              icon: AppIcons.walletIcon,
              bgColor: AppColors.primaryColor,
              iconColor: AppColors.whiteColor,
              boxShape: BoxShape.rectangle,
              containerSize: 32.0,
            ),
            title: Text(
              AppStrings.transactionId,
              style: context.txtTheme.bodyLarge
            ),
            subtitle: Text(
              balanceDetails.transactionId ?? "N/A",
              style: context.txtTheme.bodySmall
            ),
          ),
        )
        else ...<Widget>[
          CustomButton(
            onTap: onMakePayment, 
            text: AppStrings.makePayment
          ),

          // const SizedBox(height: AppSizes.spaceBetweenItems,),

          // CustomButton(
          //   onTap: onAddAccount, 
          //   isOutline: true,
          //   text: AppStrings.addAccount
          // ),

        ],

        const SizedBox(height: AppSizes.spaceBetweenItems,),


      ],
    );
  }

  Column _billRow({
    required BuildContext context,
    required String label,
    required double bill,
  }) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              label,
              style: context.txtTheme.bodyMedium,
            ),
        
            Text(
              "\$ $bill",
              style: context.txtTheme.bodyMedium?.copyWith(
                color: balanceDetails.isSuccess ? null : AppColors.orange
              )
            ),
          ],
        ),
        const SizedBox(height: AppSizes.sm,),

        const Divider(
          thickness: .5,
          color: AppColors.dividerColor,
        ),
        const SizedBox(height: AppSizes.sm,),
      ],
    );
  }
}
