import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/config/app_icons.dart';
import 'package:alora/core/config/app_sizes.dart';
import 'package:alora/core/config/app_strings.dart';
import 'package:alora/core/enums/role_type.dart';
import 'package:alora/core/extensions/context_extensions.dart';
import 'package:alora/core/extensions/widget_extensions.dart';
import 'package:alora/core/routes/app_routes.dart';
import 'package:alora/core/utils/image_picker_utils.dart';
import 'package:alora/core/widgets/custom_app_bar.dart';
import 'package:alora/core/widgets/custom_button.dart';
import 'package:alora/core/widgets/profile_image.dart';
import 'package:alora/features/profile/widgets/empty_user_info.dart';
import 'package:alora/features/profile/widgets/user_shimmer.dart';
import 'package:alora/shared/models/maintenance_model.dart';
import 'package:alora/shared/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../controllers/profile_controller.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        showBackBtn: true,
        title: AppStrings.personalInformation,
        backgroundColor: AppColors.whiteColor,
        elevation: 0.0,
      ),
      backgroundColor: AppColors.surfaceColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.screenHorizontal),
        child: Column(
          children: <Widget>[
            const SizedBox(height: AppSizes.spaceBetweenItems,),

            Obx(
              () => ProfileImage(
                boxShape: BoxShape.rectangle,
                imageFile: controller.profileImageFile.value,
                imageUrl: MaintenanceModel.userImage,
                borderColor: AppColors.primaryColor,
                borderWidth: AppSizes.dividerThick,
                isEdit: true,
                editProfile: () async{
                 controller.profileImageFile.value = await ImagePickerUtils.pickImageFile();
                },
              ),
            ),

            const SizedBox(height: AppSizes.spaceBetweenItems,),

            Card(
              color: AppColors.whiteColor,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(AppSizes.md),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSizes.borderRadiusMd),
                  border: Border.all(
                    color: AppColors.greyColor,
                    width: AppSizes.dividerHeight
                  )
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      AppStrings.personalInformation,
                      style: context.txtTheme.titleMedium,
                    ),

                    const SizedBox(height: AppSizes.spaceBetweenItems,),

                    const Divider(
                      thickness: AppSizes.dividerThick,
                    ),

                    const SizedBox(height: AppSizes.spaceBetweenItems,),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () => Get.toNamed(AppRoutes.editProfileRoute),
                          child: Text(
                            AppStrings.editProfile,
                            style: context.txtTheme.labelMedium?.copyWith(
                              decoration: TextDecoration.underline
                            ),
                          ),
                        ),

                        const SizedBox(width: AppSizes.lg,),


                        GestureDetector(
                          onTap: () => Get.toNamed(AppRoutes.changePasswordRoute),
                          child: Text(
                            AppStrings.changePassword,
                            style: context.txtTheme.labelMedium?.copyWith(
                              decoration: TextDecoration.underline
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: AppSizes.spaceBetweenSections,),



                    Obx((){
                      if(controller.userLoading.value){
                        return const UserShimmer();
                      }
                      else if(controller.user.value == null){
                        return const EmptyUserInfo().centered;
                      }
                      final UserModel user = controller.user.value!;
                      return Column(
                        children: <Widget>[
                          userDetails(context, user),
                          const SizedBox(height: AppSizes.spaceBetweenSections,),
                          CustomButton(
                            onTap: (){
                              controller.isVacantBtnVisible.value = !controller.isVacantBtnVisible.value;
                            },
                            width: 100.0,
                            isOutline: true,
                            text: "Vacant Notice"
                          ).centered.visible(controller.isVacantBtnVisible.value),

                          if(!controller.isVacantBtnVisible.value)
                            Row(
                              spacing: AppSizes.md,
                              children: <Widget>[
                                Expanded(
                                  child: CustomButton(
                                    onTap: (){
                                    },
                                    text: "Download Pdf"
                                  ),
                                ),
                                Expanded(
                                  child: CustomButton(
                                    onTap: (){
                                      Get.toNamed(AppRoutes.renterProfileDocumentsRoute);
                                    },
                                    isOutline: true,
                                    text: "Submit Document"
                                  ),
                                )
                              ],
                            )
                        ],
                      );
                    }),

                  ],
                ),
              ),
            )

          ],
        ),
      ),
    );
  }

  Column userDetails(BuildContext context, UserModel user) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            SvgPicture.asset(
              AppIcons.userNamePrefixIcon,
              width: 24.0,
              height: 24.0,
            ),
            const SizedBox(width: AppSizes.md,),

            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  AppStrings.name,
                  style: context.txtTheme.labelSmall,
                ),
            
                const SizedBox(height: AppSizes.xs,),
            
                Text(
                  user.name,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: context.txtTheme.bodySmall,
                )
              ],
            ),
          ],
        ),

        const SizedBox(height: AppSizes.spaceBetweenItems,),

        Row(
          children: <Widget>[
            SvgPicture.asset(
              AppIcons.emailPrefixIcon,
              width: 20.0,
              height: 20.0,
            ),
            const SizedBox(width: AppSizes.md,),

            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  AppStrings.email,
                  style: context.txtTheme.labelSmall,
                ),
            
                const SizedBox(height: AppSizes.xs,),
            
                Text(
                  user.email,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: context.txtTheme.bodySmall,
                )
              ],
            ),
          ],
        ),

        const SizedBox(height: AppSizes.spaceBetweenItems,),

        Row(
          children: <Widget>[
            SvgPicture.asset(
              AppIcons.phonePrefixIcon,
              width: 24.0,
              height: 24.0,
            ),
            const SizedBox(width: AppSizes.md,),

            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  AppStrings.phoneNo,
                  style: context.txtTheme.labelSmall,
                ),
            
                const SizedBox(height: AppSizes.xs,),
            
                Text(
                  user.phoneNumber,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: context.txtTheme.bodySmall,
                )
              ],
            ),
          ],
        ),

        const SizedBox(height: AppSizes.spaceBetweenItems,),

        Row(
          children: <Widget>[
            SvgPicture.asset(
              AppIcons.locationPrefixIcon,
              width: 24.0,
              height: 24.0,
            ),
            const SizedBox(width: AppSizes.md,),

            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  AppStrings.address,
                  style: context.txtTheme.labelSmall,
                ),
            
                const SizedBox(height: AppSizes.xs,),
            
                Text(
                  user.address,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: context.txtTheme.bodySmall,
                )
              ],
            ),
          ],
        )

      ],
    );
  }
}
