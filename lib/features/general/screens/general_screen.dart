import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/config/app_sizes.dart';
import 'package:alora/core/config/app_strings.dart';
import 'package:alora/core/extensions/context_extensions.dart';
import 'package:alora/core/extensions/date_time_extensions.dart';
import 'package:alora/core/utils/helper_method.dart';
import 'package:alora/core/widgets/custom_app_bar.dart';
import 'package:alora/features/general/widgets/genereal_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/general_controller.dart';

class GeneralScreen extends GetView<GeneralController> {
  const GeneralScreen({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> arguments = Get.arguments;
    controller.handleRetriveGeneralInfo(arguments["generalType"]);
    return Scaffold(
      appBar: CustomAppBar(
        showBackBtn: true,
        elevation: 0.0,
        backgroundColor: AppColors.whiteColor,
        title: HelperMethod.getGeneralTitleByType(arguments["generalType"]),
      ),
      backgroundColor: AppColors.surfaceColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.screenHorizontal),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              Obx(
                (){
                  if(controller.isLoading.value){
                    return const GenerealShimmer();
                  }
                  else if(controller.content.value == null || controller.lastUpdated.value == null){
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          HelperMethod.getGeneralTitleByType(arguments["generalType"]),
                          style: context.txtTheme.titleLarge,
                        ),

                        const SizedBox(height: AppSizes.xs,),

                        Obx(
                          ()=> Text(
                            AppStrings.lastUpdated,
                            style: context.txtTheme.labelSmall,
                          ),
                        ),

                        const SizedBox(height: AppSizes.spaceBetweenItems,),
                        
                        Obx(
                          ()=> Text(
                            "No Info found",
                            textAlign: TextAlign.justify,
                            style: context.txtTheme.labelLarge,
                          ),
                        ),
                      ],
                    );
                  }
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        HelperMethod.getGeneralTitleByType(arguments["generalType"]),
                        style: context.txtTheme.titleLarge,
                      ),

                      const SizedBox(height: AppSizes.xs,),

                      Obx(
                        ()=> Text(
                          "${AppStrings.lastUpdated} ${controller.lastUpdated.value?.formattedMonthYear ?? ''}",
                          style: context.txtTheme.labelSmall,
                        ),
                      ),

                      const SizedBox(height: AppSizes.spaceBetweenItems,),
                      
                      Obx(
                        ()=> Text(
                          controller.content.value ?? "No Info found",
                          textAlign: TextAlign.justify,
                          style: context.txtTheme.labelLarge,
                        ),
                      ),
                    ],
                  );
                }
              )
            ],
          ),
        ),
      ),
    );
  }
}
