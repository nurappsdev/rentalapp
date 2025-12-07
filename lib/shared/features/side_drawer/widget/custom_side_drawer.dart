import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/config/app_icons.dart';
import 'package:alora/core/config/app_sizes.dart';
import 'package:alora/core/config/app_strings.dart';
import 'package:alora/core/enums/role_type.dart';
import 'package:alora/core/extensions/context_extensions.dart';
import 'package:alora/core/routes/app_routes.dart';
import 'package:alora/core/utils/custom_bottom_sheet.dart';
import 'package:alora/core/utils/custom_loader.dart';
import 'package:alora/core/widgets/custom_button.dart';
import 'package:alora/core/widgets/custom_rounded_inner_icon.dart';
import 'package:alora/core/widgets/profile_image.dart';
import 'package:alora/shared/features/side_drawer/controllers/custom_side_drawer_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CustomSideDrawer extends StatelessWidget {
  const CustomSideDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final CustomSideDrawerController controller = Get.put(CustomSideDrawerController());
    return Drawer(
      backgroundColor: AppColors.surfaceColor,
      child: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSizes.screenHorizontal),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                
                // header section
                const SizedBox(height: AppSizes.spaceBetweenSections,),
                Obx(
                  () => ProfileImage(
                    imageUrl: controller.user.value?.profileImage,
                    height: 100.0,
                    width: 100.0,
                    borderWidth: AppSizes.dividerThick,
                    borderColor: AppColors.primaryColor,
                  ),
                ),
                  
                const SizedBox(height: AppSizes.md,),
                  
                Obx(
                  () => Text(
                    controller.user.value?.name ?? "Unknown",
                    style: context.txtTheme.titleMedium,
                  ),
                ),
                  
                const SizedBox(height: AppSizes.xs,),
                  
                GestureDetector(
                  onTap: () => Get.toNamed(AppRoutes.profileRoute),
                  child: Text(
                  AppStrings.viewProfile,
                    style: context.txtTheme.labelMedium?.copyWith(
                      color: AppColors.textPrimaryColor,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.primaryColor
                    ),
                  ),
                ),

                const SizedBox(height: AppSizes.spaceBetweenSections,),

                const Divider(
                  thickness: AppSizes.dividerHeight,
                ),
                
                const SizedBox(height: AppSizes.sm,),
                
                // items section
                Obx((){
                  if(controller.isRoleLoading.value){
                    return const CustomLoading(size: 28,);
                  }
                  else{
                    if(controller.isRoleTypeMatch(RoleType.crew).value){
                      return Column(
                        children: <Widget>[
                          item(
                            context: context,
                            text: AppStrings.myMaintenance,
                            svgAsset: AppIcons.maintenanceIcon,
                            onTapCallback: () => Get.toNamed(AppRoutes.maintenanceRoute),
                          ),

                          item(
                            context: context,
                            text: AppStrings.contactUs,
                            svgAsset: AppIcons.contactUsIcon,
                            onTapCallback: () => Get.toNamed(AppRoutes.contactUsRoute),
                          ),
                        ],
                      );
                    }
                    else if(controller.isRoleTypeMatch(RoleType.renter).value){
                       return Column(
                         children: <Widget>[
                          const PaymentDropDown(),
                           item(
                            context: context,
                            text: AppStrings.maintenance,
                            svgAsset: AppIcons.maintenanceIcon,
                            onTapCallback: () => Get.toNamed(AppRoutes.renterMaintenanceRoute),
                          ),
                          item(
                            context: context,
                            text: AppStrings.events,
                            svgAsset: AppIcons.eventSideDrawerIcon,
                            onTapCallback: () => Get.toNamed(AppRoutes.renterEventsRoute),
                          ),
                          item(
                            context: context,
                            text: AppStrings.myDocuments,
                            svgAsset: AppIcons.docIcon,
                            onTapCallback: () => Get.toNamed(AppRoutes.renterDocumentRoute),
                          ),
                         ],
                       );
                    }
                    else if(controller.isRoleTypeMatch(RoleType.owner).value || controller.isRoleTypeMatch(RoleType.agent).value){
                       return Column(
                         children: <Widget>[
                          const PaymentDropDown(isOwner: true,),

                          item(
                            context: context,
                            text: AppStrings.renterList,
                            svgAsset: AppIcons.apartmentIcon,
                            onTapCallback: () => Get.toNamed(AppRoutes.ownerRenterListRoute),
                          ),

                          item(
                            context: context,
                            text: AppStrings.maintenance,
                            svgAsset: AppIcons.maintenanceIcon,
                            onTapCallback: () => Get.toNamed(AppRoutes.ownerMaintenanceRoute),
                          ),

                          item(
                            context: context,
                            text: AppStrings.events,
                            svgAsset: AppIcons.eventIcon,
                            onTapCallback: () => Get.toNamed(AppRoutes.ownerEventsRoute),
                          ),

                          item(
                            context: context,
                            text: AppStrings.myDocuments,
                            svgAsset: AppIcons.docIcon,
                            onTapCallback: () => Get.toNamed(AppRoutes.ownerDocumentsRoute),
                          ),

                          item(
                            context: context,
                            text: AppStrings.maintenanceCrew,
                            svgAsset: AppIcons.fileDownloadIcon,
                            onTapCallback: () => Get.toNamed(AppRoutes.ownerMaintenanceCrewRoute),
                          ),
                         ],
                       );
                    }
                    else{
                      return const SizedBox.shrink();
                    }
                  }
                }),

                item(
                  context: context,
                  text: AppStrings.setting,
                  svgAsset: AppIcons.settingsIcon,
                  onTapCallback: () => Get.toNamed(AppRoutes.settingRoute),
                ),

                SizedBox(height: context.screenHeight * .1,),

                const Divider(
                  thickness: AppSizes.dividerHeight,
                ),
            
                item(
                  context: context,
                  text: AppStrings.logout,
                  svgAsset: AppIcons.logoutIcon,
                  onTapCallback: () {
                    CustomBottomSheet.showCustomBottomSheet(
                      context: context, 
                      child: LogoutBottomSheet(controller: controller,)
                    );
                  },
                ),
            
              ],
            ),
          ),
        ),
      ),
    );
  }

  ListTile item({
    required BuildContext context, 
    required String text,  
    required String svgAsset,  
    required VoidCallback onTapCallback,  
    }) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CustomRoundedInnerIcon(
        icon: svgAsset,
        containerSize: 32.0,
        bgColor: AppColors.primaryColor,
        iconColor: AppColors.whiteColor,
      ),
      title: Text(
        text,
        style: context.txtTheme.bodyMedium,
      ),
      onTap: onTapCallback,
    );
  }
}

class LogoutBottomSheet extends StatelessWidget {
  final CustomSideDrawerController controller;
  const LogoutBottomSheet({
    super.key,
    required this.controller
  });


  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SvgPicture.asset(AppIcons.logoutBottomSheetIcon),

            const SizedBox(height: AppSizes.spaceBetweenItems),

            Text(
              AppStrings.logoutBottomSheetTitle,
              style: context.txtTheme.bodyLarge,
            ),

            const SizedBox(height: AppSizes.sm),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                AppStrings.logoutBottomSheetSubTitle, 
                style: context.txtTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
            ),

            const SizedBox(height: AppSizes.spaceBetweenSections),
            Row(
              spacing: AppSizes.sm,
              children: <Widget>[
                Expanded(
                  child: CustomButton(
                    onTap: () => Get.back(), 
                    text: AppStrings.no,
                    isOutline: true,
                  ),
                ),
                Expanded(
                  child: Obx(
                    () => CustomButton(
                      loading: controller.isLogoutLoading.value,
                      onTap: controller.handleLogout, 
                      text: AppStrings.yes
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
    );
  }
}



class PaymentDropDown extends StatefulWidget {
  final bool isOwner;
  const PaymentDropDown({super.key, this.isOwner = false});

  @override
  State createState() => _PaymentDropDownState();
}

class _PaymentDropDownState extends State<PaymentDropDown> {
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
    final Size size = renderBox.size;

    return OverlayEntry(
      builder: (BuildContext context) => Stack(
        children: <Widget>[
           Positioned.fill(
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: _toggleDropdown,
              child: const SizedBox.expand(),
            ),
          ),

          Positioned(
            left: offset.dx,
            top: offset.dy + size.height,
            width: size.width,
            child: Material(
              elevation: 4,
              color: AppColors.whiteColor,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    if(widget.isOwner)...<Widget>[
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          AppStrings.pastPayment,
                          style: context.txtTheme.bodyMedium,
                        ), 
                        onTap: (){
                          _toggleDropdown();
                          Get.toNamed(
                            AppRoutes.renterPastPaymentsRoute,
                          );
                        }
                      ),
          
                      const Divider(
                        thickness: .5,
                        color: AppColors.dividerColor,
                      ),
                      
          
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          AppStrings.allocateBill,
                          style: context.txtTheme.bodyMedium,
                        ), 
                        onTap: (){
                          _toggleDropdown();
                          Get.toNamed(
                            AppRoutes.ownerAllocateBillRoute,
                            arguments: true,
                          );
                        }
                      ),
          
                    ]
                    else ...<Widget>[
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          AppStrings.makePayment,
                          style: context.txtTheme.bodyMedium,
                        ), 
                        onTap: (){
                          _toggleDropdown();
                          Get.toNamed(
                            AppRoutes.renterBalanceDetailsRoute,
                          );
                        }
                      ),
                      const Divider(
                        thickness: .5,
                        color: AppColors.dividerColor,
                      ),
                      
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          AppStrings.pastPayment,
                          style: context.txtTheme.bodyMedium,
                        ), 
                        onTap: (){
                          _toggleDropdown();
                          Get.toNamed(
                            AppRoutes.renterPastPaymentsRoute,
                          );
                        }
                      ),
                  
                      // const Divider(
                      //   thickness: .5,
                      //   color: AppColors.dividerColor,
                      // ),
                      
                      // ListTile(
                      //   contentPadding: EdgeInsets.zero,
                      //   title: Text(
                      //     AppStrings.balanceDetails,
                      //     style: context.txtTheme.bodyMedium,
                      //   ), 
                      //   onTap: (){
                      //     _toggleDropdown();
                      //     Get.toNamed(
                      //       AppRoutes.renterBalanceDetailsRoute,
                      //       arguments: false,
                      //     );
                      //   }
                      // ),
                    ]
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: ListTile(
      contentPadding: EdgeInsets.zero,
      leading: const CustomRoundedInnerIcon(
        icon: AppIcons.paymentIcon,
        containerSize: 32.0,
        bgColor: AppColors.primaryColor,
        iconColor: AppColors.whiteColor,
      ),
      title: Text(
        AppStrings.payment,
        style: context.txtTheme.bodyMedium,
      ),
      trailing: const Icon(Icons.arrow_drop_down, size: 24.0,),
      onTap: _toggleDropdown,
    ),
    );
  }
}
