import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/config/app_icons.dart';
import 'package:alora/core/config/app_strings.dart';
import 'package:alora/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../controllers/general_controller.dart';

class GeneralScreen extends GetView<GeneralController> {
  const GeneralScreen({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        showBackBtn: true,
        title: AppStrings.setting,
        backgroundColor: AppColors.whiteColor,
        elevation: 0.0,
      ),
      body: ListView(
        children: [
          ListTile(
            leading: SvgPicture.asset(AppIcons.privacyPolicyIcon),
          )
        ],
      ),
    );
  }
}
