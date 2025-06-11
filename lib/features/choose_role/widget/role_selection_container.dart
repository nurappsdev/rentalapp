import 'dart:ui';
import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/config/app_icons.dart';
import 'package:alora/core/config/app_images.dart';
import 'package:alora/core/config/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class RoleSelectionContainer extends StatelessWidget {
  final String role;
  final String roleDesc;
  final bool isSelected;
  final Function(bool?)? onChanged;
  final VoidCallback onTap;

  const RoleSelectionContainer({
    super.key, 
    required this.role, 
    required this.roleDesc,
    required this.onChanged, 
    required this.isSelected,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: .5,
        color: AppColors.whiteColor,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.blue50,
              width: AppSizes.dividerHeight
            ),
            borderRadius: BorderRadius.circular(AppSizes.borderRadiusMd),
          ),
          child: Stack(
            children: <Widget>[
               Align(
                alignment: Alignment.topLeft,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(AppSizes.borderRadiusMd),
                  child: Image.asset(
                    AppImages.cardTopCornerWave
                  ),
                ),
              ),
      
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSizes.xs, vertical: AppSizes.md),
                child: Row(
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
                                    borderRadius: BorderRadius.circular(AppSizes.borderRadiusMd),
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 1,
                                    ),
                                  ),
                                ),
                              ),
      
                              SvgPicture.asset(
                                AppIcons.userBgIcon,
                                width: 32,
                                height: 32,
                              )
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
                            role,
                            style: context.textTheme.titleMedium,
                          ),
                                            
                          Text(
                            roleDesc,
                            style: context.textTheme.labelSmall,
                          ),
                        ],
                      ),
                    ),
                    Checkbox(
                      value: isSelected, 
                      onChanged: onChanged
                    ),
                  ],
                ),
              ),
              
            ],
          ),
        )
      ),
    );
  }
}
