import 'package:alora/core/extensions/context_extensions.dart';
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
    return  PinCodeTextField(
      backgroundColor: Colors.transparent,
      cursorColor: AppColors.primaryColor,
      controller: textEditingController,
        textStyle: context.txtTheme.headlineSmall,
        autoFocus: false,
        appContext: context,
        length: 6,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(width: 8.0,);
        },
        pinTheme: PinTheme(
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(8.0),
            selectedColor: AppColors.primaryColor,
            activeFillColor: AppColors.primaryColor,
            selectedFillColor: Colors.transparent,
            inactiveFillColor: Colors.transparent,
            fieldWidth: 40,
            fieldHeight: 40,
            inactiveColor: AppColors.primaryColor,
            activeColor: AppColors.primaryColor,
        ),
        obscureText: false,
        keyboardType: TextInputType.number,
        onChanged: onChanged,
        onCompleted: onCompleted,
      );
  }
}

