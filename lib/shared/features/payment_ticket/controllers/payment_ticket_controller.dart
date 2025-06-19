import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:alora/core/enums/role_type.dart';
import 'package:alora/core/routes/app_routes.dart';
import 'package:alora/core/utils/custom_snack_bar.dart';
import 'package:alora/core/utils/helper_method.dart';
import 'package:alora/core/utils/logger_utils.dart';
import 'package:alora/shared/features/payment/widget/payment_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class PaymentTicketController extends GetxController {

  PaymentData? paymentData;
  set updatePaymentData(PaymentData? paymentData){
    this.paymentData = paymentData;
  }

  final RxBool isLoading = false.obs;
  Future<void> handleBackToHome() async{
    final RoleType roleType = await HelperMethod.getRoleType();
    isLoading.value = true;
    
    switch(roleType){
      case RoleType.rentar:
        Get.offAllNamed(AppRoutes.homeRentarRoute);
        break;
      case RoleType.owner:
        Get.offAllNamed(AppRoutes.homeOwnerRoute);
        break;
      case RoleType.crew:
        Get.offAllNamed(AppRoutes.homeCrewRoute);
        break;
    }
    
    isLoading.value = false;
  }

  final GlobalKey transactionCardKey = GlobalKey();

  final RxBool showDownloadButton = true.obs;

  Future<void> captureAndSaveCard() async {
    try {
        showDownloadButton.value = false;
        await Future<dynamic>.delayed(const Duration(milliseconds: 200));
        
        // if (Platform.isAndroid) {
        //   final PermissionStatus status = await Permission.storage.request();
        //   if (!status.isGranted) {
        //     LoggerUtils.info("Storage permission denied");
        //     return;
        //   }
        // }

        final RenderRepaintBoundary? boundary = transactionCardKey.currentContext?.findRenderObject() as RenderRepaintBoundary?;
        if (boundary == null){
          return;
        }

        final ui.Image image = await boundary.toImage(pixelRatio: 3.0);
        final ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
        final Uint8List pngBytes = byteData!.buffer.asUint8List();


        Directory? directory;
        if (Platform.isAndroid) {
          directory = Directory('/storage/emulated/0/Download'); 
        } else if (Platform.isIOS) {
          directory = await getApplicationDocumentsDirectory(); 
        }
        if (directory == null || !(await directory.exists())) {
        LoggerUtils.debug("Directory not found: ${directory?.path}");
        return;
      }


      final String filePath = "${directory.path}/transaction_${DateTime.now().millisecondsSinceEpoch}.png";
      final File file = File(filePath);
      await file.writeAsBytes(pngBytes);

      LoggerUtils.debug("Image saved to $filePath");

      CustomSnackBar.show(message: "Image downloaded successfully.");

      OpenFile.open(file.path);
    } 
    catch (e) {
      LoggerUtils.error("Error capturing card: $e");
    }
    finally{
      showDownloadButton.value = true;
    }
  }


  
  /// [onInit] Lifecycle method called when the controller is initialized.
  ///
  /// Resets loading states, clears existing data, and triggers and more..
  /// initial fetch
  /// 
  @override
  void onInit() {
    super.onInit();
    paymentData = null;
    isLoading.value = false;
  }

  /// [dispose] Lifecycle method called when the controller is destroyed.
  ///
  /// Cleans up by resetting loading states and clearing lists and more...
  @override
  void dispose() {
    paymentData = null;
    isLoading.value = false;
    super.dispose();
  }
}
