import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/config/app_icons.dart';
import 'package:alora/core/config/app_sizes.dart';
import 'package:alora/core/config/app_strings.dart';
import 'package:alora/core/extensions/context_extensions.dart';
import 'package:alora/core/utils/date_picker_utils.dart';
import 'package:alora/core/widgets/custom_app_bar.dart';
import 'package:alora/core/widgets/custom_button.dart';
import 'package:alora/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../controllers/owner_allocate_bill_controller.dart';

class OwnerCreateAllocateBillScreen extends GetView<OwnerAllocateBillController> {
  const OwnerCreateAllocateBillScreen({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: const CustomAppBar(
        title: AppStrings.allocateBill,
        showBackBtn: true,
        elevation: 0.0,
        backgroundColor: AppColors.whiteColor,
      ),
      backgroundColor: AppColors.surfaceColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.screenHorizontal, vertical: AppSizes.sm),
          child: Container(
            width: context.screenWidth,
            padding: const EdgeInsets.symmetric(horizontal: AppSizes.md),
            decoration: BoxDecoration(
              border: Border.all(
                  width: AppSizes.dividerThick,
                  color: AppColors.borderColor
              )
            ),
            child: Column(
              children: <Widget>[
                const SizedBox(height: AppSizes.spaceBetweenInputs,),

                CustomTextField(
                  controller: controller.calendarCTRL,
                  isBorder: true,
                  readOnly: true,
                  borderRadius: 12.0,
                  hintText: "Calendar",
                  suffixIcons: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(AppIcons.dateIcon),
                  ),
                  prefixIconCallBack: () async{
                    final String? date = await DatePickerUtils.pickFormatedDate(context: context);
                    if(date != null){
                      controller.calendarCTRL.text = date;
                    }
                  },
                  onTab: () async{
                    final String? date = await DatePickerUtils.pickFormatedDate(context: context);
                    if(date != null){
                      controller.calendarCTRL.text = date;
                    }
                  },
                ),

                const SizedBox(height: AppSizes.spaceBetweenInputs,),

                CustomTextField(
                  controller: controller.rentCTRL,
                  isBorder: true,
                  borderRadius: 12.0,
                  hintText: "Rent",
                ),

                const SizedBox(height: AppSizes.spaceBetweenInputs,),

                Obx(
                  () => ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.fields.length,
                    itemBuilder: (_, int index){
                      return CustomTextField(
                        controller: controller.fields[index].values.first,
                        isBorder: true,
                        keyboardType: TextInputType.number,
                        borderRadius: 12.0,
                        hintText: controller.fields[index].keys.first,
                      );
                    },
                    separatorBuilder: (_, int index){
                      if(controller.fields.length == (index + 1)){
                        return const SizedBox.shrink();
                      }
                      else{
                        return const SizedBox(height: AppSizes.spaceBetweenItems,);
                      }
                    },
                  ),
                ),


                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    CustomButton(
                      onTap: controller.handleAdd, 
                      width: 100.0,
                      text: AppStrings.add
                    )
                  ],
                ),

                const SizedBox(height: AppSizes.spaceBetweenInputs,),

                CustomTextField(
                  controller: controller.labelInputController,
                  isBorder: true,
                  borderRadius: 12.0,
                  hintText: "Type Bill Name",
                ),

                const SizedBox(height: AppSizes.spaceBetweenSections,),


                CustomButton(
                  onTap: controller.handleCreateBill, 
                  text: AppStrings.add
                ),

                const SizedBox(height: AppSizes.spaceBetweenSections,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
