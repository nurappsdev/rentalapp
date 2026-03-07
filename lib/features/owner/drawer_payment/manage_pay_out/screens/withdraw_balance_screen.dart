

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../core/config/app_colors.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../core/widgets/custom_button.dart';

class WithdrawBalanceScreen extends StatelessWidget {
  const WithdrawBalanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FB),

      appBar: const CustomAppBar(
        title:  'Withdraw Balance',
        showBackBtn: true,
        elevation: 0.0,
        backgroundColor: AppColors.whiteColor,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(16.r),
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
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Please Information For The Withdrawal',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 16.h),
              _InputField(
                icon: Icons.account_circle_outlined,
                hint: 'Bank Name',
              ),
              SizedBox(height: 12.h),
              _InputField(
                icon: Icons.account_circle_outlined,
                hint: 'Account Type',
              ),
              SizedBox(height: 12.h),
              _InputField(
                icon: Icons.credit_card,
                hint: 'Account Number',
              ),
              SizedBox(height: 12.h),
              _InputField(
                icon: Icons.credit_card,
                hint: 'Withdrawal Amount',
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar:Padding(
        padding:  EdgeInsets.all(20),
        child: CustomButton(
            onTap: (){
            //  Get.toNamed(AppRoutes.withdrawBalanceScreen);
            },
            text: "Withdraw"
        ),
      ),
    );
  }
}

class _InputField extends StatelessWidget {
  final IconData icon;
  final String hint;

  const _InputField({
    required this.icon,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: const Color(0xFFE0E0E0), width: 1),
      ),
      child: TextField(
        style: TextStyle(fontSize: 13.sp, color: Colors.black87),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
            fontSize: 13.sp,
            color: Colors.grey.shade400,
          ),
          prefixIcon: Icon(icon, size: 20.r, color: Colors.grey.shade400),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 14.h),
        ),
      ),
    );
  }
}