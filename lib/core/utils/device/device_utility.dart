import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:alora/core/utils/logger_utils.dart';
import 'package:vibration/vibration.dart';
import 'package:url_launcher/url_launcher.dart';

class DeviceUtility {
  DeviceUtility._();

  // Set Status Bar Color
  static void setStatusBarColor(Color color) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: color));
  }

  // Enable/Disable Full-Screen Mode
  static void setFullScreen(bool enable) {
    SystemChrome.setEnabledSystemUIMode(
      enable ? SystemUiMode.immersiveSticky : SystemUiMode.edgeToEdge,
    );
  }

  // Check if Running on Physical Device
  static bool isPhysicalDevice() {
    return Platform.isAndroid || Platform.isIOS;
  }

  // Device Type Checks
  static bool isIOS() {
    return Platform.isIOS;
  }

  static bool isAndroid() {
    return Platform.isAndroid;
  }

  // Vibrate Device
  static void vibrate(Duration duration) async{
    if (await Vibration.hasVibrator()) {
      if (await Vibration.hasAmplitudeControl()) {
        Vibration.vibrate(duration: duration.inMilliseconds, amplitude: 255);
      }
      else {
        Vibration.vibrate(duration: duration.inMilliseconds);
      }
    }
    else{
      HapticFeedback.heavyImpact();
      Future<dynamic>.delayed(duration, HapticFeedback.vibrate);
    }
  }


  static void hapticFeedback(Duration duration) async{
    HapticFeedback.heavyImpact();
  }

  // Set Preferred Orientations
  static Future<void> setPreferredOrientations(List<DeviceOrientation> orientations) async {
    await SystemChrome.setPreferredOrientations(orientations);
  }

  // Hide Status Bar
  static void hideStatusBar() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: <SystemUiOverlay>[]);
  }

  // Show Status Bar
  static void showStatusBar() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
  }

  // Launch URL Safely

  static Future<void> launchEmail(String email) async {
    final Uri emailUri = Uri(scheme: 'mailto', path: email);
      if (await canLaunchUrl(emailUri)) {
        await launchUrl(emailUri);
      } else {
        throw 'Could not launch $emailUri';
      }
  }

  static Future<void> launchPhone(String phoneNumber) async {
    final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      throw 'Could not launch phone $phoneUri';
    }
  }
}
