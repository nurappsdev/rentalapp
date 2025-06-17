import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ApartmentBookingController extends GetxController {

  String selectedApartmentId = '';
  set updateSelectedApartmentId(String selectedApartmentId) => this.selectedApartmentId = selectedApartmentId;

  String selectedApartmentName = '';
  set updateSelectedApartmentName(String selectedApartmentName) => this.selectedApartmentName = selectedApartmentName;

  String selectedUnitType = '';
  set updateSelectedUnitType(String selectedUnitType) => this.selectedUnitType = selectedUnitType;
  
  String selectedFloor = '';
  set updateSelectedFloor(String selectedFloor) => this.selectedFloor = selectedFloor;

  String selectedApartmentNumber = '';
  set updateSelectedApartmentNumber(String selectedApartmentNumber) => this.selectedApartmentNumber = selectedApartmentNumber;

  late TextEditingController movingDateCTRL;


  
  /// [onInit] Lifecycle method called when the controller is initialized.
  ///
  /// Resets loading states, clears existing data, and triggers and more..
  /// initial fetch
  /// 
  @override
  void onInit() {
    super.onInit();
    movingDateCTRL = TextEditingController();
  }

  /// [dispose] Lifecycle method called when the controller is destroyed.
  ///
  /// Cleans up by resetting loading states and clearing lists and more...
  @override
  void dispose() {
    movingDateCTRL.dispose();
    super.dispose();
  }
}
