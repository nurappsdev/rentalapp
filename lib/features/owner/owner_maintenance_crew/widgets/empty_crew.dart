import 'package:alora/core/config/app_icons.dart';
import 'package:alora/core/config/app_sizes.dart';
import 'package:alora/core/config/app_strings.dart';
import 'package:alora/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class EmptyCrew extends StatelessWidget{
  const EmptyCrew({
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
          AppStrings.eventsCrew,
          textAlign: TextAlign.center,
          style: context.txtTheme.titleSmall,
        )
      ],
    );
  }
}