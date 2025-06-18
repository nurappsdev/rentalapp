import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/config/app_icons.dart';
import 'package:alora/core/config/app_images.dart';
import 'package:alora/core/config/app_sizes.dart';
import 'package:alora/core/config/app_strings.dart';
import 'package:alora/core/enums/payment_option.dart';
import 'package:alora/core/widgets/custom_button.dart';
import 'package:alora/core/widgets/custom_text_field.dart';
import 'package:alora/shared/features/payment/controllers/payment_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class PaymentData{
  final PaymentOption option;
  final String cardHolderName;
  final String cvv;
  final String mm;

  PaymentData({
    required this.option,
    required this.cardHolderName,
    required this.cvv,
    required this.mm,
  });

  @override
  String toString() {
    return "Payment Info Option : ${option.name} || Holder Name : $cardHolderName || CVV/CVC : $cvv || MM/YY : $mm";
  }
}

class PaymentCard extends StatelessWidget {
  final double? price;
  final Function(PaymentData data) onPayCallBack;

  const PaymentCard({
    super.key,
    this.price,
    required this.onPayCallBack
  });

  @override
  Widget build(BuildContext context) {
    final PaymentController controller = Get.put<PaymentController>(PaymentController());
    return Column(
      children: <Widget>[
        Text(
          'Select Payment Method',
          style: context.textTheme.bodyLarge
        ),
        const SizedBox(height: 16.0),
        Row(
          spacing: AppSizes.sm,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            // option visa
            Obx(
              () => Radio<PaymentOption>(
                value: PaymentOption.visa,
                groupValue: controller.selectedPaymentOption.value,
                onChanged: (PaymentOption? value) => controller.updateSelectedPaymentOption = value,
              ),
            ),
            _paymentOption(PaymentOption.visa, 'Visa', AppImages.visa, controller),

            // option paypal
            Obx(
              () => Radio<PaymentOption>(
                value: PaymentOption.paypal,
                groupValue: controller.selectedPaymentOption.value,
                onChanged: (PaymentOption? value) => controller.updateSelectedPaymentOption = value,
              ),
            ),
            _paymentOption(PaymentOption.paypal, 'Paypal', AppImages.paypal, controller),
          ],
        ),

        const SizedBox(height: AppSizes.spaceBetweenSections),

        CustomTextField(
          controller: controller.holderNameCTRL,
          isBorder: true,
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
            child: SvgPicture.asset(AppIcons.userIcon),
          ),
          hintText: 'Card holder name',
        ),
        const SizedBox(height: AppSizes.spaceBetweenInputs),


        CustomTextField(
          controller: controller.cardNumberCTRL,
          isBorder: true,
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
            child: SvgPicture.asset(AppIcons.cardIcon),
          ),
          keyboardType: TextInputType.number,
          hintText: 'Card number',
        ),
        const SizedBox(height: AppSizes.spaceBetweenInputs),


        Row(
          children: <Widget>[
            Expanded(
              child: CustomTextField(
                controller: controller.cvvCTRL,
                isBorder: true,
                keyboardType: TextInputType.number,
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
                  child: SvgPicture.asset(AppIcons.cardIcon),
                ),
                hintText: 'CVV/CVC',
              ),
            ),

            const SizedBox(width: AppSizes.spaceBetweenInputs),


            Expanded(
              child: CustomTextField(
                controller: controller.mmCTRL,
                isBorder: true,
                keyboardType: TextInputType.number,
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
                  child: SvgPicture.asset(AppIcons.dateIcon),
                ),
                hintText: 'MM/YY',
              ),
            ),
          ],
        ),

        if(price != null) ...<Widget>[
          const SizedBox(height: AppSizes.spaceBetweenSections),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                "${AppStrings.submissionFee} ",
                style: context.textTheme.headlineLarge,
              ),
              Text(
                "\$ $price",
                style: context.textTheme.titleLarge?.copyWith(
                  color: AppColors.primaryColor
                ),
              )
            ],
          )
        ],

        const SizedBox(height: AppSizes.spaceBetweenItems),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          spacing: AppSizes.xs,
          children: <Widget>[
            Obx(
              () => Checkbox(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                value: controller.isAgreementAccepted.value, 
                onChanged: (bool? value) => controller.updateAgreementStatus = value,
              ),
            ),
            Expanded(
              child: Text(
                AppStrings.paymentTermsAndConditionAgreement,
                style: context.textTheme.labelMedium
              ),
            ),
            const SizedBox(width: AppSizes.lg,)
          ],
        ),

        const SizedBox(height: AppSizes.spaceBetweenItems),

        CustomButton(
          onTap: () async{
            final PaymentData? paymentData = await controller.handlePayNow();
            if(paymentData != null){
              onPayCallBack(paymentData);
            }
          }, 
          text: AppStrings.payNow
        ),

        const SizedBox(height: AppSizes.spaceBetweenSections),
      ],
    );
  }

  GestureDetector _paymentOption(PaymentOption option, String method, String assetPath, PaymentController controller) {
    return GestureDetector(
      onTap: () => controller.updateSelectedPaymentOption = option,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Image.asset(assetPath, width: 32.0, height: 32.0),
      ),
    );
  }
}