import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/config/app_sizes.dart';
import 'package:alora/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class CustomChipLayout extends StatelessWidget {
  const CustomChipLayout({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: (AppSizes.sm + 2),
        horizontal: (AppSizes.md - 4),
      ),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[Color(0XFF2CB5EB), Color(0XFF196685)],
        ),
        borderRadius: BorderRadius.circular(AppSizes.sm),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(name, style: context.txtTheme.bodyMedium?.copyWith(color: AppColors.textWhiteColor)),
        ],
      ),
    );
  }
}
