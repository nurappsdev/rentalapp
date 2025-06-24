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
import '../widgets/banner_card.dart';
import 'package:alora/shared/widgets/home_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_owner_controller.dart';

class HomeOwnerScreen extends GetView<HomeOwnerController> {
  const HomeOwnerScreen({
    super.key
  });

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
          const SizedBox(width: AppSizes.sm,)
        ]
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
                isCreate: true,
                apartmentDropDown: const ApartmentDropDown(),
                onCreateApartmentCallback: () {
                  Get.toNamed(AppRoutes.ownerCreateApartmentFormSetupRoute);
                },
              ),
              const SizedBox(height: AppSizes.spaceBetweenSections,),

              Row(
                spacing: AppSizes.spaceBetweenItems,
                children: <Widget>[
                  Expanded(
                    child: HomeCard(
                      text: AppStrings.myApartment,
                      svgAsset: AppIcons.apartmentIcon,
                       onTapCallback: () => Get.toNamed(AppRoutes.ownerMyApartmentRoute),
                    ),
                  ),

                  Expanded(
                    child: HomeCard(
                      text: AppStrings.maintenanceReqList,
                      svgAsset: AppIcons.maintenanceIcon,
                      onTapCallback: () => Get.toNamed(AppRoutes.ownerMaintenanceRoute),
                    ),
                  ),
                  
                ],
              ),

              const SizedBox(height: AppSizes.spaceBetweenItems,),

              Row(
                spacing: AppSizes.spaceBetweenItems,
                children: <Widget>[
                  Expanded(
                    child: HomeCard(
                      svgAsset: AppIcons.usersIcon,
                      text: AppStrings.applicationReq,
                      onTapCallback: () => Get.toNamed(AppRoutes.ownerApplicationReqRoute),
                    ),
                  ),

                  Expanded(
                    child: HomeCard(
                      svgAsset: AppIcons.eventIcon,
                      text: AppStrings.events,
                      onTapCallback: () => Get.toNamed(AppRoutes.ownerEventsRoute),
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







class ApartmentDropDown extends StatefulWidget {
  const ApartmentDropDown({super.key});

  @override
  State createState() => _ApartmentDropDownState();
}

class _ApartmentDropDownState extends State<ApartmentDropDown> {
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _dropdownOverlay;

  void _toggleDropdown() {
    if (_dropdownOverlay == null) {
      _dropdownOverlay = _createDropdown();
      Overlay.of(context).insert(_dropdownOverlay!);
    } else {
      _dropdownOverlay?.remove();
      _dropdownOverlay = null;
    }
  }

  @override
  void dispose() {
    _dropdownOverlay?.remove();
    _dropdownOverlay = null;
    super.dispose();
  }

  

  OverlayEntry _createDropdown() {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final Offset offset = renderBox.localToGlobal(Offset.zero);

    return OverlayEntry(
      builder: (BuildContext context) => Positioned(
        right: offset.dx,
        top: offset.dy,
        width: 250.0,
        child: Material(
          elevation: 4,
          color: AppColors.whiteColor,
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Column(
              spacing: 0.0,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: AppSizes.xs,),
            
                GestureDetector(
                  onTap: _toggleDropdown,
                  child: Text(
                    "Suncity Apartment",
                    style: context.txtTheme.titleSmall,
                  ),
                ),
            
                const SizedBox(height: AppSizes.xs,),
            
                const Divider(
                  thickness: .5,
                  color: AppColors.dividerColor,
                ),
                
                const SizedBox(height: AppSizes.xs,),
                GestureDetector(
                  onTap: _toggleDropdown,
                  child: Text(
                     "Villa city",
                    style: context.txtTheme.titleSmall,
                  ),
                ),
                const SizedBox(height: AppSizes.xs,),
            
                const Divider(
                  thickness: .5,
                  color: AppColors.dividerColor,
                ),
                
                const SizedBox(height: AppSizes.xs,),
                GestureDetector(
                  onTap: _toggleDropdown,
                  child: Text(
                     "Police park",
                    style: context.txtTheme.titleSmall,
                  ),
                ),
                const SizedBox(height: AppSizes.xs,),
            
                const Divider(
                  thickness: .5,
                  color: AppColors.dividerColor,
                ),
            
                const SizedBox(height: AppSizes.xs,),
                GestureDetector(
                  onTap: _toggleDropdown,
                  child: Text(
                    "Green city",
                    style: context.txtTheme.titleSmall,
                  ),
                ),
                const SizedBox(height: AppSizes.sm,),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: _toggleDropdown,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                      Text(
                        "Suncity Apartment ",
                        style: context.txtTheme.titleMedium
                      ),
                      Text(
                        "Dhaka BD",
                        style: context.txtTheme.bodySmall
                      ),
                  ],
                ),
                const Icon(Icons.keyboard_arrow_down)
              ],
            ),
        
            const SizedBox(height: AppSizes.sm),
        
            Divider(
              thickness: AppSizes.dividerHeight,
              color: AppColors.dividerColor,
              indent: 0,
              endIndent: context.screenWidth * .2,
            ),
        
            const SizedBox(height: AppSizes.sm),
        
            Text(
              "\$ 43567",
              style: context.txtTheme.titleLarge?.copyWith(
                color: AppColors.orange
              ),
            ),
        
            const SizedBox(height: AppSizes.sm),
          ],
        ),
      )
    );
  }
}