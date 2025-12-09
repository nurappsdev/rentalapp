import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/config/app_icons.dart';
import 'package:alora/core/config/app_sizes.dart';
import 'package:alora/core/extensions/context_extensions.dart';
import 'package:alora/core/utils/custom_bottom_sheet.dart';
import 'package:alora/core/utils/file_picker_utils.dart';
import 'package:alora/core/widgets/custom_app_bar.dart';
import 'package:alora/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../controllers/renter_documents_controller.dart';

class RenterMyDocumentsScreen extends GetView<RenterDocumentsController> {
  const RenterMyDocumentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        showBackBtn: true,
        title: "My Documents",
        backgroundColor: AppColors.surfaceColor,
      ),
      backgroundColor: AppColors.surfaceColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.screenHorizontal,
          vertical: AppSizes.sm,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListView.separated(
              shrinkWrap: true,
              itemCount: 3,
              separatorBuilder:
                  (BuildContext context, int index) =>
                      const Divider(color: AppColors.dividerColor, thickness: .5),
              itemBuilder:
                  (BuildContext context, int index) => ListTile(
                    leading: SvgPicture.asset(AppIcons.pdfIcon),
                    title: Text("Document $index", style: context.txtTheme.bodyLarge),
                    subtitle: Text("modified 2/1/25", style: context.txtTheme.bodyMedium),
                    trailing: PopupMenuButton<String>(
                      color: AppColors.whiteColor,
                      onSelected: (String value) {
                        // switch (value) {
                        //   case 'resolve':
                        //     break;
                        // }
                      },
                      itemBuilder:
                          (BuildContext context) => <PopupMenuEntry<String>>[
                            const PopupMenuItem<String>(
                              value: 'download',
                              child: Row(
                                children: <Widget>[Icon(Icons.download), Text('Download')],
                              ),
                            ),
                            const PopupMenuItem<String>(
                              value: 'print',
                              child: Row(children: <Widget>[Icon(Icons.print), Text('Print')]),
                            ),
                            const PopupMenuItem<String>(
                              value: 'rename',
                              child: Row(children: <Widget>[Icon(Icons.edit), Text('Rename')]),
                            ),

                            const PopupMenuItem<String>(
                              value: 'delete',
                              child: Row(
                                children: <Widget>[Icon(Icons.delete_outline), Text('Delete')],
                              ),
                            ),
                          ],
                    ),
                  ),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: <Color>[Color(0XFF2CB5EB), Color.fromARGB(255, 19, 152, 204)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: FloatingActionButton(
          onPressed: () {
            CustomBottomSheet.showCustomBottomSheet(
              context: context,
              child: const UploadDocumentBottomSheet(),
            );
          },
          backgroundColor: Colors.transparent,
          child: const Icon(Icons.add, size: 28.0, color: AppColors.whiteColor),
        ),
      ),
    );
  }
}

class UploadDocumentBottomSheet extends StatelessWidget {
  const UploadDocumentBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onTap: () {
        FilePickerUtils.pickFile();
      },
      text: "Upload Documents",
      isOutline: true,
      textColor: AppColors.blackColor,
      borderColor: AppColors.blackColor,
    );
  }
}
