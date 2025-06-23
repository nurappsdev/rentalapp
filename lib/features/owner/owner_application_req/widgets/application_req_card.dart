import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/config/app_sizes.dart';
import 'package:alora/core/extensions/context_extensions.dart';
import 'package:alora/core/widgets/custom_network_image.dart';
import 'package:alora/features/owner/owner_application_req/model/application_req_model.dart';
import 'package:flutter/material.dart';

class ApplicationReqCard extends StatelessWidget {
  final ApplicationReqModel applicationReq;
  final VoidCallback onPressCallback;
  const ApplicationReqCard({super.key, required this.applicationReq, required this.onPressCallback});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressCallback,
      child: Card(
        color: AppColors.whiteColor,
        child: Container(
           width: context.screenWidth,
           padding: const EdgeInsets.all(AppSizes.xs),
           decoration: BoxDecoration(
            border: Border.all(
              width: AppSizes.dividerThick,
              color: AppColors.borderColor
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(AppSizes.borderRadiusMd),
                child: CustomNetworkImage(
                  imageUrl: applicationReq.image, 
                  height: 90.0, 
                  boxShape: BoxShape.rectangle,
                  width: double.infinity
                ),
              ),
              const Divider(
                color: AppColors.dividerColor,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    applicationReq.type,
                    style: context.txtTheme.titleMedium,
                  ),
                  Text(
                    "(${applicationReq.count})",
                    style: context.txtTheme.titleMedium,
                  ),
                ],
              ),
      
              const SizedBox(height: AppSizes.sm,)
            ],
          ),
        ),
      ),
    );
  }
}