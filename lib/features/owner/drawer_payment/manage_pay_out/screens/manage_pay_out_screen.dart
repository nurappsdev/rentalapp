

import 'package:alora/features/owner/drawer_payment/manage_sub/controller/manage_sub_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/config/app_colors.dart';
import '../../../../../core/routes/app_routes.dart' show AppRoutes;
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../core/widgets/custom_button.dart';
class ManagePayOutScreen extends GetView<ManageSubController> {
  const ManagePayOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FB),

      appBar: const CustomAppBar(
        title:         'Manage Pay Out',
        showBackBtn: true,
        elevation: 0.0,
        backgroundColor: AppColors.whiteColor,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _BalanceCard(
              label: 'Total Balance',
              amount: r'$19.500.00',
              amountColor: const Color(0xFF4A90E2),
            ),
            SizedBox(height: 14.h),
            _BalanceCard(
              label: 'Last Withdrawal Amount',
              amount: r'$15.500.00',
              amountColor: const Color(0xFFE05252),
            ),
            SizedBox(height: 28.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Transactions History',
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  'See all',
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF4A90E2),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            const _TransactionCard(
              type: 'Withdrawal',
              totalAmountLabel: 'Total Amount :',
              totalAmountValue: 'Completed : \$100',
              paymentDateLabel: 'Payment Date :',
              paymentDateValue: '12 Jan 25 8.00AM',
            ),
          ],
        ),
      ),
      bottomNavigationBar:Padding(
        padding:  EdgeInsets.all(20),
        child: CustomButton(
            onTap: (){
              Get.toNamed(AppRoutes.withdrawBalanceScreen);
            },
            text: "Withdraw balance"
        ),
      ),
    );
  }
}

class _BalanceCard extends StatelessWidget {
  final String label;
  final String amount;
  final Color amountColor;

  const _BalanceCard({
    required this.label,
    required this.amount,
    required this.amountColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 110.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8.r,
            offset: Offset(0, 2.h),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14.r),
        child: Stack(
          children: [
            // ✅ Top-left small circle
            Positioned(
              top: -48.r,
              left: -40.r,
              child: Container(
                width: 120.r,
                height: 200.r,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFE8EEF8),
                ),
              ),
            ),

            // ✅ Bottom-right large circle
            Positioned(
              bottom: -50.r,
              right: -50.r,
              child: Container(
                width: 130.r,
                height: 130.r,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFE8EEF8),
                ),
              ),
            ),

            // ✅ Content on top
            Padding(
              padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  _DashedDivider(),
                  SizedBox(height: 10.h),
                  Text(
                    amount,
                    style: TextStyle(
                      fontSize: 26.sp,
                      fontWeight: FontWeight.w700,
                      color: amountColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class _TransactionCard extends StatelessWidget {
  final String type;
  final String totalAmountLabel;
  final String totalAmountValue;
  final String paymentDateLabel;
  final String paymentDateValue;

  const _TransactionCard({
    required this.type,
    required this.totalAmountLabel,
    required this.totalAmountValue,
    required this.paymentDateLabel,
    required this.paymentDateValue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(16.w, 14.h, 16.w, 14.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8.r,
            offset: Offset(0, 2.h),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            type,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 8.h),
          _DashedDivider(),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(totalAmountLabel,
                  style: TextStyle(fontSize: 13.sp, color: Colors.black54)),
              Text(
                totalAmountValue,
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF4CAF50),
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          _DashedDivider(),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(paymentDateLabel,
                  style: TextStyle(fontSize: 13.sp, color: Colors.black54)),
              Text(
                paymentDateValue,
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _DashedDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        const dashWidth = 5.0;
        const dashSpace = 4.0;
        final count =
        (constraints.constrainWidth() / (dashWidth + dashSpace)).floor();
        return Row(
          children: List.generate(count, (_) {
            return Padding(
              padding: EdgeInsets.only(right: dashSpace.w),
              child: Container(
                width: dashWidth.w,
                height: 1.h,
                color: Colors.grey.shade300,
              ),
            );
          }),
        );
      },
    );
  }
}