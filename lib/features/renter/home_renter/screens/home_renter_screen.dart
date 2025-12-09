import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/config/app_icons.dart';
import 'package:alora/core/config/app_images.dart';
import 'package:alora/core/config/app_sizes.dart';
import 'package:alora/core/config/app_strings.dart';
import 'package:alora/core/extensions/context_extensions.dart';
import 'package:alora/core/routes/app_routes.dart';
import 'package:alora/core/utils/custom_bottom_sheet.dart';
import 'package:alora/core/widgets/custom_app_bar.dart';
import 'package:alora/core/widgets/custom_button.dart';
import 'package:alora/core/widgets/custom_rounded_inner_icon.dart';
import 'package:alora/shared/features/side_drawer/widget/custom_side_drawer.dart';
import 'package:alora/features/renter/home_renter/widgets/banner_card.dart';
import 'package:alora/shared/widgets/home_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../shared/widgets/payment_disclaimer.dart';
import '../controllers/home_renter_controller.dart';

class HomeRenterScreen extends GetView<HomeRenterController> {
  const HomeRenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      appBar: CustomAppBar(
        showDrawerIcon: true,
        scaffoldKey: scaffoldKey,
        elevation: 0.0,
        actions: <Widget>[
          CustomRoundedInnerIcon(
            icon: AppIcons.notificationIcon,
            containerSize: 32.0,
            isBorder: false,
            bgColor: AppColors.greyColor,
            boxShape: BoxShape.rectangle,
            onTap: () => Get.toNamed(AppRoutes.notificationRoute),
          ),
          const SizedBox(width: AppSizes.sm),
        ],
      ),
      backgroundColor: AppColors.surfaceColor,
      drawer: const CustomSideDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.screenHorizontal),
          child: Column(
            children: <Widget>[
              BannerCard(
                price: 1959.90,
                onMakePaymentCallback: () {
                  Get.dialog(const PaymentDisclaimer());
                },
              ),
              const SizedBox(height: AppSizes.spaceBetweenSections),

              Row(
                spacing: AppSizes.spaceBetweenItems,
                children: <Widget>[
                  Expanded(
                    child: HomeCard(
                      text: AppStrings.maintenance,
                      svgAsset: AppIcons.homeMaintenanceIcon,
                      onTapCallback: () => Get.toNamed(AppRoutes.renterMaintenanceRoute),
                    ),
                  ),
                  Expanded(
                    child: HomeCard(
                      svgAsset: AppIcons.eventIcon,
                      text: AppStrings.events,
                      onTapCallback: () => Get.toNamed(AppRoutes.renterEventsRoute),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: AppSizes.spaceBetweenItems),

              Row(
                spacing: AppSizes.spaceBetweenItems,
                children: <Widget>[
                  Expanded(
                    child: HomeCard(
                      svgAsset: AppIcons.searchIcon,
                      text: AppStrings.searchProperty,
                      onTapCallback:
                          () => Get.toNamed(AppRoutes.searchApartmentsRoute, arguments: true),
                    ),
                  ),
                  Expanded(
                    child: HomeCard(
                      svgAsset: AppIcons.contactUsIcon,
                      text: AppStrings.contactUs,
                      onTapCallback: () => Get.toNamed(AppRoutes.contactUsRoute),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
