import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/config/app_icons.dart';
import 'package:alora/core/config/app_sizes.dart';
import 'package:alora/core/config/app_strings.dart';
import 'package:alora/core/extensions/context_extensions.dart';
import 'package:alora/core/extensions/widget_extensions.dart';
import 'package:alora/core/routes/app_routes.dart';
import 'package:alora/core/widgets/custom_app_bar.dart';
import 'package:alora/core/widgets/custom_text_field.dart';
import 'package:alora/shared/widgets/apartment_card.dart';
import 'package:alora/features/renter/search_apartments/widget/apartments_shimmer.dart';
import 'package:alora/shared/widgets/maintenance_card.dart';
import 'package:alora/shared/widgets/maintenance_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../controllers/search_apartments_controller.dart';

class SearchApartmentsScreen extends GetView<SearchApartmentsController> {
  const SearchApartmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          (Get.arguments is bool)
              ? const CustomAppBar(
                showBackBtn: true,
                elevation: 0.0,
                backgroundColor: AppColors.whiteColor,
              )
              : null,
      backgroundColor: AppColors.surfaceColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.screenHorizontal,
            vertical: AppSizes.sm,
          ),
          child: CustomScrollView(
            slivers: <Widget>[
              // Sliver App Bar with Search Field
              SliverAppBar(
                pinned: false,
                floating: true,
                snap: true,
                shadowColor: Colors.grey.withValues(alpha: .2),
                elevation: 2,
                expandedHeight: 70,
                toolbarHeight: 70,
                backgroundColor: Colors.white,
                surfaceTintColor: Colors.transparent,
                automaticallyImplyLeading: false,
                flexibleSpace: CustomTextField(
                  controller: controller.searchCTRL,
                  hintText: AppStrings.searchApartmentHint,
                  prefixIcon: SvgPicture.asset(AppIcons.searchIcon),
                  isBorder: true,
                  borderRadius: 12.0,
                  onChange: (_) => controller.handleSearchApartments(),
                ),
              ),

              // Space between search and list
              const SliverToBoxAdapter(child: SizedBox(height: AppSizes.spaceBetweenItems)),

              // Reactive apartment list with loading/empty states
              Obx(() {
                if (controller.apartmentsLoading.value) {
                  return const SliverToBoxAdapter(child: ApartmentsShimmer());
                }

                if (controller.apartmentList.isEmpty) {
                  return SliverFillRemaining(
                    hasScrollBody: false,
                    child:
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxHeight: Get.height * 0.7,
                            maxWidth: Get.width * 0.7,
                          ),
                          child:
                              Text(
                                "Enter the address or name of your property in the search field.",
                                style: Get.textTheme.labelLarge,
                                textAlign: TextAlign.center,
                              ).centered,
                        ).centered,
                  );
                }

                return SliverList.separated(
                  itemCount: controller.apartmentList.length,
                  itemBuilder: (_, int index) {
                    return ApartmentCard(
                      apartment: controller.apartmentList[index],
                      onViewCallback: () {
                        Get.toNamed(
                          AppRoutes.apartmentDetailsRoute,
                          arguments: <String, String>{
                            "apartment_id": controller.apartmentList[index].id,
                            "type": "apartment",
                          },
                        );
                      },
                    );
                  },
                  separatorBuilder: (_, __) => const SizedBox(height: AppSizes.spaceBetweenItems),
                );
              }),

              const SliverToBoxAdapter(child: SizedBox(height: AppSizes.spaceBetweenSections)),
            ],
          ),
        ),
      ),
    );
  }
}
