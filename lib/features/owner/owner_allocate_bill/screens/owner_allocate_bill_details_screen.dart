import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/config/app_sizes.dart';
import 'package:alora/core/config/app_strings.dart';
import 'package:alora/core/extensions/context_extensions.dart';
import 'package:alora/core/extensions/date_time_extensions.dart';
import 'package:alora/core/routes/app_routes.dart';
import 'package:alora/core/widgets/custom_app_bar.dart';
import 'package:alora/core/widgets/custom_button.dart';
import 'package:alora/shared/widgets/owner_apartment_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/owner_allocate_bill_controller.dart';

class OwnerAllocateBillDetailsScreen extends GetView<OwnerAllocateBillController> {
  const OwnerAllocateBillDetailsScreen({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    controller.handleRetriveSingleApartment();
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
            children: <Widget>[
              Container(
                padding: const EdgeInsets.symmetric(horizontal: AppSizes.md, vertical: AppSizes.sm),
                decoration: BoxDecoration(
                  color:  AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(AppSizes.borderRadiusSm)
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      DateTime.now().formattedDate,
                      style: context.txtTheme.bodyLarge?.copyWith(
                        color: AppColors.textWhiteColor
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: AppSizes.spaceBetweenItems,),

              Obx(
                (){
                  if(controller.singleApartment.value == null){
                    return const SizedBox.shrink();
                  }
                  return  OwnerApartmentCard(
                    apartment: controller.singleApartment.value!,
                    isShowImage: false,
                  );
                }
              ),

              const SizedBox(height: AppSizes.spaceBetweenItems,),

              _billRow(context: context, label: "Gas Bill", bill: 245),
              _billRow(context: context, label: "Water Bill", bill: 34),
              _billRow(context: context, label: "Utility Administation Fee", bill: 467),
              _billRow(context: context, label: "Trush Reimbursement", bill: 232),
              _billRow(context: context, label: "Renters Insurance", bill: 143),
              _billRow(context: context, label: "Parking Rent", bill: 12),
              _billRow(context: context, label: "Pest Controll Bill", bill: 45),

              const SizedBox(height: AppSizes.spaceBetweenItems,),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    "${AppStrings.totalBalance} : ",
                    style: context.txtTheme.headlineLarge,
                  ),
                  Text(
                    "\$ 3456",
                    style: context.txtTheme.titleLarge,
                  )
                ],
              ),
              const SizedBox(height: AppSizes.spaceBetweenSections,),

              CustomButton(
                onTap: () => Get.offAllNamed(AppRoutes.homeOwnerRoute), 
                text: AppStrings.sendBill
              ),
              
              const SizedBox(height: AppSizes.spaceBetweenSections,),
            ],
          ),
        ),
      ),
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
              style: context.txtTheme.bodyMedium,
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

