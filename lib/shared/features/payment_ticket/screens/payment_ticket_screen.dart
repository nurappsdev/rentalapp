import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/config/app_icons.dart';
import 'package:alora/core/config/app_sizes.dart';
import 'package:alora/core/config/app_strings.dart';
import 'package:alora/core/extensions/context_extensions.dart';
import 'package:alora/core/extensions/widget_extensions.dart';
import 'package:alora/core/widgets/custom_app_bar.dart';
import 'package:alora/core/widgets/custom_button.dart';
import 'package:alora/core/widgets/custom_rounded_inner_icon.dart';
import 'package:alora/shared/widgets/dashed_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../controllers/payment_ticket_controller.dart';



class PaymentTicketScreen extends GetView<PaymentTicketController> {
  const PaymentTicketScreen({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    controller.updatePaymentData = Get.arguments;
    return Scaffold(
      appBar: const CustomAppBar(
        title: AppStrings.paymentTicket,
        backgroundColor: AppColors.whiteColor,
        elevation: 0.0,
      ),
      backgroundColor: AppColors.surfaceColor,
      body: SingleChildScrollView(
        child:  Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.screenHorizontal),
          child: Column(
            children: <Widget>[
              transactionCard(
                context: context, 
              ),

              const SizedBox(height: AppSizes.spaceBetweenSections,),

              Obx(
                () => CustomButton(
                  loading: controller.isLoading.value, 
                  text: AppStrings.backToHome,
                  onTap: controller.handleBackToHome,
                ),
              ),

              const SizedBox(height: AppSizes.spaceBetweenSections,),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox transactionCard({required BuildContext context}) {
    return SizedBox(
      child: RepaintBoundary(
        key: controller.transactionCardKey,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: <Color>[
                Color(0XFF2CB5EB),
                Color(0XFF196685),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter
            ),
            borderRadius: BorderRadius.circular(AppSizes.borderRadiusLg)
          ),
          child: Column(
            children: <Widget>[
        
              Obx(
                () =>  Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    margin: const EdgeInsets.only(top: AppSizes.md, right: AppSizes.md),
                    child: CustomRoundedInnerIcon(
                      onTap: controller.captureAndSaveCard,
                      icon: AppIcons.fileDownloadIcon,
                      containerSize: 42.0,
                      bgColor: AppColors.whiteColor,
                      iconColor: AppColors.primaryColor,
                    ),
                  ),
                ).visible(controller.showDownloadButton.value),
              ),
              const SizedBox(height: AppSizes.spaceBetweenItems,),
        
              SvgPicture.asset(
                AppIcons.verifiedIcon,
                width: 48.0,
                height: 48.0,
              ),
        
              const SizedBox(height: AppSizes.spaceBetweenSections,),
        
              Text(
                AppStrings.transactionSuccessfulTitle,
                style: context.txtTheme.headlineLarge?.copyWith(
                  color: AppColors.textWhiteColor
                ),
              ),
        
              const SizedBox(height: AppSizes.sm,),
        
              Text(
                AppStrings.transactionSuccessfulSubTitle,
                style: context.txtTheme.labelLarge?.copyWith(
                  color: AppColors.textWhiteColor
                ),
              ),
        
        
              const SizedBox(height: AppSizes.spaceBetweenSections,),
        
              Text(
                AppStrings.submissionFee,
                style: context.txtTheme.titleLarge?.copyWith(
                  color: AppColors.textWhiteColor
                ),
              ),
        
              const SizedBox(height: AppSizes.sm,),
        
              Text(
                "\$ ${controller.paymentData?.price?.toString() ?? 'N/A'}",
                style: context.txtTheme.titleLarge?.copyWith(
                  color: AppColors.textWhiteColor
                ),
              ),
        
              const SizedBox(height: AppSizes.spaceBetweenSections,),
        
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: AppSizes.md),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        AppStrings.paymentDetails,
                        style: context.txtTheme.headlineMedium?.copyWith(
                          color: AppColors.textWhiteColor
                        ),
                      ),
        
                      const SizedBox(height: AppSizes.spaceBetweenItems,),
        
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: AppSizes.sm,
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                  Text(
                                    AppStrings.name,
                                    style: context.txtTheme.titleLarge?.copyWith(
                                      color: AppColors.textWhiteColor
                                    ),
                                  ),
                                  Text(
                                    controller.paymentData?.cardHolderName ?? '',
                                    style: context.txtTheme.bodyLarge?.copyWith(
                                      color: AppColors.textWhiteColor
                                    ),
                                  ),
                            
                                  const SizedBox(height: AppSizes.spaceBetweenItems,),
                            
                                  Text(
                                    AppStrings.paymentDate,
                                    style: context.txtTheme.titleLarge?.copyWith(
                                      color: AppColors.textWhiteColor
                                    ),
                                  ),
                                  Text(
                                    controller.paymentData?.paymentDate ?? '',
                                    style: context.txtTheme.bodyLarge?.copyWith(
                                      color: AppColors.textWhiteColor
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                  Text(
                                    AppStrings.email,
                                    style: context.txtTheme.titleLarge?.copyWith(
                                      color: AppColors.textWhiteColor
                                    ),
                                  ),
                                  Text(
                                    controller.paymentData?.email ?? 'N/A',
                                    style: context.txtTheme.bodyLarge?.copyWith(
                                      color: AppColors.textWhiteColor
                                    ),
                                  ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
        
              const SizedBox(height: AppSizes.spaceBetweenItems,),
        
              const DashedDivider(
                height: AppSizes.dividerHeight,
                dashWidth: 20.0,
                color: AppColors.whiteColor,
              ),
        
              const SizedBox(height: AppSizes.spaceBetweenItems,),
        
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: AppSizes.md),
                  child: Text(
                    AppStrings.totalTopUp,
                    style: context.txtTheme.titleLarge?.copyWith(
                      color: AppColors.textWhiteColor
                    ),
                  ),
                ),
              ),
        
              const SizedBox(height: AppSizes.spaceBetweenItems,),
        
              Container(
                margin: const EdgeInsets.symmetric(horizontal: AppSizes.md),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(AppSizes.borderRadiusMd)
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
                    controller.paymentData?.transactionId ?? "N/A",
                    style: context.txtTheme.bodySmall
                  ),
                ),
              ),
              const SizedBox(height: AppSizes.spaceBetweenItems,),
            ],
          ),
        ),
      ),
    );
  }
}
