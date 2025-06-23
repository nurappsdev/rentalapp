import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/config/app_icons.dart';
import 'package:alora/core/config/app_sizes.dart';
import 'package:alora/core/config/app_strings.dart';
import 'package:alora/core/extensions/context_extensions.dart';
import 'package:alora/core/extensions/widget_extensions.dart';
import 'package:alora/core/routes/app_routes.dart';
import 'package:alora/core/widgets/custom_app_bar.dart';
import 'package:alora/core/widgets/custom_text_field.dart';
import 'package:alora/features/renter/search_apartments/widget/apartments_shimmer.dart';
import 'package:alora/shared/widgets/owner_apartment_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../controllers/owner_renter_list_controller.dart';

class OwnerRenterListScreen extends GetView<OwnerRenterListController> {
  const OwnerRenterListScreen({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: AppStrings.renterList,
        showBackBtn: true,
        elevation: 0.0,
        backgroundColor: AppColors.whiteColor,
      ),
      backgroundColor: AppColors.surfaceColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.screenHorizontal),
          child: Column(
            children: <Widget>[

              const SizedBox(height: AppSizes.spaceBetweenItems,),

              CustomTextField(
                controller: TextEditingController(),
                isBorder: true,
                hintText: "Search Apartment",
                prefixIcon: SvgPicture.asset(AppIcons.searchIcon),
              ),

              const SizedBox(height: AppSizes.spaceBetweenItems,),
              
              // apartment list with handling loading and empty state
              Obx((){
                if(controller.apartmentList.isEmpty){
                  return SizedBox(
                    width: context.screenWidth,
                    height: context.screenHeight * .6,
                    child: const Text(
                      "Not Found!! Empty List"
                    ).centered,
                  );
                }
                else if(controller.apartmentsLoading.value){
                  return const ApartmentsShimmer();
                }
                return ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.apartmentList.length,
                  itemBuilder: (_, int index){
                    return OwnerApartmentCard(
                      onViewCallback: () {
                        Get.toNamed(AppRoutes.ownerRenterListDetailsRoute, arguments: <String, dynamic>{
                          "id": controller.apartmentList[index].id
                        });
                      },
                      apartment: controller.apartmentList[index]
                    );
                  },
                  separatorBuilder: (_, _) => const SizedBox(height: AppSizes.spaceBetweenItems,),
                );
              }),
          
              const SizedBox(height: AppSizes.spaceBetweenSections,),
            ],
          ),
        ),
      ),
    );
  }
}
