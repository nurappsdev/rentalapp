import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:alora/core/config/app_colors.dart';

class CustomPinCodeTextField extends StatelessWidget {
  final TextEditingController? textEditingController;
  final ValueChanged<String>? onCompleted;
  final ValueChanged<String>? onChanged;

  const CustomPinCodeTextField({
    super.key,
    this.textEditingController,
    this.onCompleted,
    this.onChanged
  });
  
  @override
  Widget build(BuildContext context) {
    return  Container(
      constraints: const BoxConstraints(
        maxWidth: 400.0,
      ),
      child: PinCodeTextField(
        backgroundColor: Colors.transparent,
        cursorColor: AppColors.primaryColor,
        controller: textEditingController,
          textStyle: context.textTheme.headlineMedium,
          autoFocus: false,
          appContext: context,
          length: 6,
          pinTheme: PinTheme(
              shape: PinCodeFieldShape.box,
              borderRadius: BorderRadius.circular(10.0),
              selectedColor: AppColors.primaryColor,
              activeFillColor: AppColors.primaryColor,
              selectedFillColor: Colors.transparent,
              inactiveFillColor: Colors.transparent,
              fieldWidth: 50,
              fieldHeight: 60,
              inactiveColor: AppColors.primaryColor,
              activeColor: AppColors.primaryColor,
          ),
          obscureText: false,
          keyboardType: TextInputType.number,
          onChanged: onChanged,
          onCompleted: onCompleted,
        ),
    );
  }
}

