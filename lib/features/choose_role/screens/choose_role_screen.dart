import 'dart:ui';

import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/config/app_sizes.dart';
import 'package:alora/core/config/app_strings.dart';
import 'package:alora/core/enums/role_type.dart';
import 'package:alora/core/extensions/context_extensions.dart';
import 'package:alora/core/extensions/widget_extensions.dart';
import 'package:alora/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../core/config/app_icons.dart';
import '../../../core/config/app_images.dart';
import '../controllers/choose_role_controller.dart';
import '../widget/role_selection_container.dart';

class ChooseRoleScreen extends GetView<ChooseRoleController> {
  const ChooseRoleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surfaceColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSizes.screenHorizontal),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: AppSizes.spaceBetweenSections),

                // choose role title & subtitle
                Text(
                  AppStrings.chooseRoleTitle,
                  textAlign: TextAlign.center,
                  style: context.txtTheme.headlineMedium,
                ).centered,

                const SizedBox(height: AppSizes.spaceBetweenItems),

                Text(
                  AppStrings.chooseRoleSubTitle,
                  textAlign: TextAlign.center,
                  style: context.txtTheme.labelMedium,
                ).centered,

                const SizedBox(height: AppSizes.spaceBetweenSections),

                // role selection
                Obx(
                  () => RoleSelectionContainer(
                    role: AppStrings.renter,
                    roleDesc: AppStrings.renterRoleDesc,
                    isSelected: controller.isRoleTypeMatch(RoleType.renter).value,
                    onChanged: (bool? value) => controller.clearSelectionAndSelectRenter(),
                    onTap: () => controller.clearSelectionAndSelectRenter(),
                  ),
                ),
                const SizedBox(height: AppSizes.spaceBetweenSections),

                Card(
                  elevation: .5,
                  color: AppColors.whiteColor,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.blue50, width: AppSizes.dividerHeight),
                      borderRadius: BorderRadius.circular(AppSizes.borderRadiusMd),
                    ),
                    child: Stack(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.topLeft,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(AppSizes.borderRadiusMd),
                            child: Image.asset(AppImages.cardTopCornerWave),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppSizes.xs,
                            vertical: AppSizes.md,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: AppSizes.md),
                                child: SizedBox(
                                  width: 72,
                                  height: 72,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(AppSizes.borderRadiusMd),
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: <Widget>[
                                        // Frosted glass background
                                        BackdropFilter(
                                          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.grey.withValues(alpha: .1),
                                              borderRadius: BorderRadius.circular(
                                                AppSizes.borderRadiusMd,
                                              ),
                                              border: Border.all(color: Colors.white, width: 1),
                                            ),
                                          ),
                                        ),

                                        SvgPicture.asset(
                                          AppIcons.userBgIcon,
                                          width: 32,
                                          height: 32,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "Apartment Management",
                                      style: context.txtTheme.titleMedium,
                                    ),

                                    Text(
                                      "Create your account as a Apartment Owner.",
                                      style: context.txtTheme.labelSmall,
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                key: controller.buttonKey,
                                onPressed: () {
                                  showPopupMenu(context, controller, controller.buttonKey);
                                },
                                icon: const Icon(Icons.keyboard_arrow_down, size: 24),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                //  Obx(
                //    () => RoleSelectionContainer(
                //     role: AppStrings.owner,
                //     roleDesc: AppStrings.ownerRoleDesc,
                //     isSelected: controller.isRoleTypeMatch(RoleType.owner).value,
                //     onChanged: (bool? value) => controller.updateRoleType(RoleType.owner, value),
                //     onTap: () => controller.updateRoleType(RoleType.owner, !controller.isRoleTypeMatch(RoleType.owner).value),
                //     ),
                //  ),
                // const SizedBox(height: AppSizes.spaceBetweenSections,),

                // Obx(
                //   () => RoleSelectionContainer(
                //     role: AppStrings.crew,
                //     roleDesc: AppStrings.crewRoleDesc,
                //     isSelected: controller.isRoleTypeMatch(RoleType.crew).value,
                //     onChanged: (bool? value) => controller.updateRoleType(RoleType.crew, value),
                //     onTap: () => controller.updateRoleType(RoleType.crew, !controller.isRoleTypeMatch(RoleType.crew).value),
                //     ),
                //  ),
                // const SizedBox(height: AppSizes.spaceBetweenSections,),

                // Obx(
                //   () => RoleSelectionContainer(
                //     role: AppStrings.agent,
                //     roleDesc: AppStrings.agentRoleDesc,
                //     isSelected: controller.isRoleTypeMatch(RoleType.agent).value,
                //     onChanged: (bool? value) => controller.updateRoleType(RoleType.agent, value),
                //     onTap: () => controller.updateRoleType(RoleType.agent, !controller.isRoleTypeMatch(RoleType.agent).value),
                //     ),
                //  ),
                const SizedBox(height: AppSizes.spaceBetweenSections),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.screenHorizontal,
          vertical: AppSizes.spaceBetweenSections,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            CustomButton(onTap: controller.handleContinue, text: AppStrings.continueBtnTxt),
          ],
        ),
      ),
    );
  }

  void showPopupMenu(BuildContext context, ChooseRoleController controller, GlobalKey buttonKey) {
    final RenderBox? button = buttonKey.currentContext?.findRenderObject() as RenderBox?;
    if (button == null) {
      return;
    }

    final RenderBox overlay = Overlay.of(context).context.findRenderObject() as RenderBox;
    final Size buttonSize = button.size;
    final Offset buttonPosition = button.localToGlobal(Offset.zero, ancestor: overlay);

    final RelativeRect position = RelativeRect.fromRect(
      Rect.fromLTWH(
        buttonPosition.dx,
        buttonPosition.dy + buttonSize.height,
        buttonSize.width,
        buttonSize.height,
      ),
      Offset.zero & overlay.size,
    );

    showMenu(
      context: context,
      position: position,
      color: AppColors.whiteColor,
      items:
          controller.items.map((RoleItem item) {
            return PopupMenuItem<String>(
              value: item.name,
              onTap: () => controller.selectRole(item.role),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    item.name,
                    style: context.txtTheme.bodyMedium?.copyWith(
                      color: item.isSelected ? AppColors.primaryColor : null,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
    );
  }
}
