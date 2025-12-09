import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/config/app_sizes.dart';
import 'package:alora/core/extensions/context_extensions.dart';
import 'package:alora/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/routes/app_routes.dart';

class PaymentDisclaimer extends StatelessWidget {
  const PaymentDisclaimer({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Disclaimer',
              style: context.txtTheme.headlineLarge?.copyWith(color: AppColors.orange),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Before Completing Payment Ensure You have a signed finalized lease.',
                textAlign: TextAlign.center,
                style: context.txtTheme.bodyMedium,
              ),
            ),
            const SizedBox(height: 20),
            const Row(
              spacing: AppSizes.sm,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Rent Due:'),
                Text('\$1200.00', style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 10),
            const Row(
              spacing: AppSizes.sm,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Required Deposit:'),
                Text('\$1200.00', style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 30),
            CustomButton(
              text: 'Pay Now',
              onTap: () {
                Get.toNamed(AppRoutes.renterBalanceDetailsRoute);
              },
            ),
          ],
        ),
      ),
    );
  }
}
