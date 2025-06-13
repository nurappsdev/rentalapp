import 'package:alora/core/config/app_icons.dart';
import 'package:alora/core/config/app_sizes.dart';
import 'package:alora/core/config/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class EmptyMaintenance extends StatelessWidget{
  const EmptyMaintenance({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SvgPicture.asset(
          AppIcons.emptyIcon
        ),
    
        const SizedBox(height: AppSizes.sm,),
    
        Text(
          AppStrings.maintenanceEmpty,
          textAlign: TextAlign.center,
          style: context.textTheme.titleSmall,
        )
      ],
    );
  }
}