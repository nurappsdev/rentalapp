import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/config/app_colors.dart';
import '../../../../../core/config/app_strings.dart';
import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../controller/billongs_controller.dart';

class BankAccountScreen extends GetView<BillingsController> {
  const BankAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const CustomAppBar(
        title: 'Account Setup',
        showBackBtn: true,
        elevation: 0.0,
        backgroundColor: AppColors.whiteColor,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              SizedBox(height: 20.h,),
              CustomButton(
                  onTap:(){
                    Get.toNamed(AppRoutes.bankDetailsAccount);
                  },text: "Bank Account"),
            ],
          ),
        ),
      ),
    );
  }
}




