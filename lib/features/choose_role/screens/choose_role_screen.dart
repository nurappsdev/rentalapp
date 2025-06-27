import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/config/app_sizes.dart';
import 'package:alora/core/config/app_strings.dart';
import 'package:alora/core/enums/role_type.dart';
import 'package:alora/core/extensions/context_extensions.dart';
import 'package:alora/core/extensions/widget_extensions.dart';
import 'package:alora/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/choose_role_controller.dart';
import '../widget/role_selection_container.dart';

class ChooseRoleScreen extends GetView<ChooseRoleController> {
  const ChooseRoleScreen({
    super.key
  });

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
                const SizedBox(height: AppSizes.spaceBetweenSections,),
        
                // choose role title & subtitle
                Text(
                  AppStrings.chooseRoleTitle,
                  textAlign: TextAlign.center,
                  style: context.txtTheme.headlineMedium,
                ).centered,
        
                const SizedBox(height: AppSizes.spaceBetweenItems,),
        
                Text(
                  AppStrings.chooseRoleSubTitle,
                  textAlign: TextAlign.center,
                  style: context.txtTheme.labelMedium,
                ).centered,
        
        
                const SizedBox(height: AppSizes.spaceBetweenSections,),
        
                // role selection
      
                Obx(
                  () => RoleSelectionContainer(
                    role: AppStrings.rentar,
                    roleDesc: AppStrings.rentarRoleDesc,
                    isSelected: controller.isRoleTypeMatch(RoleType.rentar).value,
                    onChanged: (bool? value) => controller.updateRoleType(RoleType.rentar, value),
                    onTap: () => controller.updateRoleType(RoleType.rentar, !controller.isRoleTypeMatch(RoleType.rentar).value),
                  ),
                ),
                const SizedBox(height: AppSizes.spaceBetweenSections,),
        
                 Obx(
                   () => RoleSelectionContainer(
                    role: AppStrings.owner,
                    roleDesc: AppStrings.ownerRoleDesc,
                    isSelected: controller.isRoleTypeMatch(RoleType.owner).value,
                    onChanged: (bool? value) => controller.updateRoleType(RoleType.owner, value),
                    onTap: () => controller.updateRoleType(RoleType.owner, !controller.isRoleTypeMatch(RoleType.owner).value),
                    ),
                 ),
                const SizedBox(height: AppSizes.spaceBetweenSections,),
        
        
                Obx(
                  () => RoleSelectionContainer(
                    role: AppStrings.crew,
                    roleDesc: AppStrings.crewRoleDesc,
                    isSelected: controller.isRoleTypeMatch(RoleType.crew).value,
                    onChanged: (bool? value) => controller.updateRoleType(RoleType.crew, value),
                    onTap: () => controller.updateRoleType(RoleType.crew, !controller.isRoleTypeMatch(RoleType.crew).value),
                    ),
                 ),
                const SizedBox(height: AppSizes.spaceBetweenSections,),


                Obx(
                  () => RoleSelectionContainer(
                    role: AppStrings.agent,
                    roleDesc: AppStrings.agentRoleDesc,
                    isSelected: controller.isRoleTypeMatch(RoleType.agent).value,
                    onChanged: (bool? value) => controller.updateRoleType(RoleType.agent, value),
                    onTap: () => controller.updateRoleType(RoleType.agent, !controller.isRoleTypeMatch(RoleType.agent).value),
                    ),
                 ),
                const SizedBox(height: AppSizes.spaceBetweenSections,),
        
              ],
            ),
          )
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.screenHorizontal, vertical: AppSizes.spaceBetweenSections),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            CustomButton(
              onTap: controller.handleContinue, 
              text: AppStrings.continueBtnTxt
            )
          ],
        ),
      ),
    );
  }
}



