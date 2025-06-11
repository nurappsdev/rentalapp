import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/config/app_icons.dart';
import 'package:alora/core/config/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_utils/get_utils.dart';

enum TitleAlignment { left, center, right }


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isTitleUnderline;
  final TitleAlignment titleAlignment;
  final bool centerTitle;
  final List<Widget>? actions;
  final Widget? leading;
  final Color backgroundColor;
  final double elevation;
  final bool showBackBtn;
  final bool showDrawerIcon;
  final GlobalKey<ScaffoldState>? scaffoldKey;

  const CustomAppBar({
    super.key,
    required this.title,
    this.titleAlignment = TitleAlignment.center,
    this.centerTitle = true,
    this.showBackBtn = false,
    this.showDrawerIcon = false,
    this.isTitleUnderline = false,
    this.actions,
    this.leading,
    this.scaffoldKey,
    this.backgroundColor = AppColors.whiteColor,
    this.elevation = 4.0,
  }) : assert(!(showBackBtn && showDrawerIcon),
            'Cannot show both back button and drawer icon'),
      assert(!showDrawerIcon || scaffoldKey != null,
        'scaffoldKey must be provided if showDrawerIcon is true');

  @override
  Widget build(BuildContext context) {
    Widget? leading;

    if (showBackBtn) {
      leading = IconButton(
        icon: SvgPicture.asset(
          AppIcons.backIcon, 
          width: 24.0, 
          height: 24.0,
          colorFilter: const ColorFilter.mode(AppColors.blackColor, BlendMode.srcATop),
        ),
        onPressed: () => Navigator.of(context).pop(),
      );
    } else if (showDrawerIcon) {
      leading = IconButton(
        icon: SvgPicture.asset(
          AppIcons.sideDrawerIcon, 
          width: 24.0, 
          height: 24.0,
          colorFilter: const ColorFilter.mode(AppColors.blackColor, BlendMode.srcATop),
        ),
        onPressed: () {
          if(scaffoldKey != null && scaffoldKey!.currentState != null && scaffoldKey!.currentState!.hasDrawer){
            if(!scaffoldKey!.currentState!.isDrawerOpen){
              scaffoldKey!.currentState!.openDrawer();
            }
            else{
              scaffoldKey!.currentState!.closeDrawer();
            }
          }
        },
      );
    }

    return AppBar(
      backgroundColor: backgroundColor,
      elevation: elevation,
      leading: leading,
      titleTextStyle: context.textTheme.headlineSmall?.copyWith(
        decoration: isTitleUnderline ? TextDecoration.underline : null,
        decorationColor: Colors.black,
        decorationThickness: 2.0,
      ),
      title: Align(
        alignment: _getTitleAlignment(),
        child: Text(
            title,
            style: context.textTheme.headlineSmall?.copyWith(
              decoration: isTitleUnderline ? TextDecoration.underline : null,
              decorationColor: AppColors.blackColor,
              decorationThickness: AppSizes.dividerHeight,
            ),
          ),
      ),
      centerTitle: false,
      actions: actions,
    );
  }

  Alignment _getTitleAlignment() {
    switch (titleAlignment) {
      case TitleAlignment.left:
        return Alignment.centerLeft;
      case TitleAlignment.right:
        return Alignment.centerRight;
      case TitleAlignment.center:
        return Alignment.center;
    }
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
