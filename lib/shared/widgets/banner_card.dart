import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/config/app_images.dart';
import 'package:alora/core/config/app_sizes.dart';
import 'package:alora/core/config/app_strings.dart';
import 'package:alora/core/extensions/context_extensions.dart';
import 'package:alora/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class BannerCard extends StatelessWidget {
  final double price;
  final String text;
  final VoidCallback onMakePaymentCallback;

  const BannerCard({
    super.key,
    required this.price,
    this.text = AppStrings.apartmentDueBalance,
    required this.onMakePaymentCallback,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      color: AppColors.whiteColor,
      shadowColor: AppColors.whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.borderRadiusLg),
      ),
      child: Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(AppSizes.borderRadiusLg),
            child: Ink.image(
              image: const AssetImage(
                AppImages.bannerCard,
              ),
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
      
          // 🔹 Text and button
          Positioned(
            left: 16,
            right: 16,
            bottom: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "\$ $price",
                  style: context.textTheme.headlineSmall?.copyWith(
                    fontSize: 36.0,
                    color: AppColors.orange
                  ),
                ),
                const SizedBox(height: AppSizes.sm),

                Text(
                  text,
                  style: context.textTheme.labelLarge
                ),

                const SizedBox(height: AppSizes.sm),

                Divider(
                  thickness: AppSizes.dividerHeight,
                  color: AppColors.dividerColor,
                  indent: 0,
                  endIndent: context.screenWidth * .2,
                ),

                const SizedBox(height: AppSizes.sm),

                CustomButton(
                  onTap: onMakePaymentCallback, 
                  text: AppStrings.makePayment,
                  width: 130.0,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
