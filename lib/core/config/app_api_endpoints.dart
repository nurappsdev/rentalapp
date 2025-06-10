part of 'package:alora/core/network/network_service.dart';

class AppApiEndpoints{
  AppApiEndpoints._();
  
  // auth end points
  static const String signUp = "${AppConstants.apiBaseUrl}/auth/register";
  static const String verifyEmail = "${AppConstants.apiBaseUrl}/auth/verify-email";
  static const String login = "${AppConstants.apiBaseUrl}/auth/login";
  static const String forgotPassword = "${AppConstants.apiBaseUrl}/auth/forgot-password";
  static const String resetPassword = "${AppConstants.apiBaseUrl}/auth/reset-password";
  static const String changePassword = "${AppConstants.apiBaseUrl}/auth/change-password";
  static const String logout = "${AppConstants.apiBaseUrl}/auth/logout";



  // general end points
  static const String privacyPolicy = "${AppConstants.apiBaseUrl}/setting/privacy_policy";
  static const String termsCondition = "${AppConstants.apiBaseUrl}/setting/term_condition";
  static const String aboutUs = "${AppConstants.apiBaseUrl}/setting/about";

}