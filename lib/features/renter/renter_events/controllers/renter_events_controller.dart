import 'package:alora/features/renter/renter_events/models/renter_event_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RenterEventsController extends GetxController with GetSingleTickerProviderStateMixin {

  late TabController tabController;

  final RxList<RenterEventModel> allEvents = <RenterEventModel>[].obs;
  final RxBool allEventsLoading = false.obs;

  final RxList<RenterEventModel> currentWeekEvents = <RenterEventModel>[].obs;
  final RxBool currentWeekEventsLoading = false.obs;

  final RxList<RenterEventModel> currentMonthEvents = <RenterEventModel>[].obs;
  final RxBool currentMonthsEventsLoading = false.obs;

  final Rx<DateTime> selectedDate = (DateTime.now()).obs;


  
  /// [onInit] Lifecycle method called when the controller is initialized.
  ///
  /// Resets loading states, clears existing data, and triggers and more..
  /// initial fetch
  /// 
  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 3, vsync: this);
    // all event fetch
    allEventsLoading.value = true;
    Future<dynamic>.delayed(const Duration(seconds: 1), (){
      allEvents.value = RenterEventModel.renterEvents;
    });

    Future<dynamic>.delayed(const Duration(seconds: 2), (){
      allEventsLoading.value = false;
    });

     // current week event fetch
    final DateTime now = DateTime.now();
    final DateTime beginningOfWeek = now.subtract(Duration(days: now.weekday - 1)); // Monday
    final DateTime endOfWeek = beginningOfWeek.add(const Duration(days: 6));

    currentWeekEventsLoading.value = true;
    Future<dynamic>.delayed(const Duration(seconds: 1), (){
      currentWeekEvents.value = RenterEventModel.renterEvents.where((RenterEventModel event) {
        return event.date.isAfter(beginningOfWeek.subtract(const Duration(days: 1))) &&
              event.date.isBefore(endOfWeek.add(const Duration(days: 1)));
      }).toList();
    });

    Future<dynamic>.delayed(const Duration(seconds: 2), (){
      currentWeekEventsLoading.value = false;
    });


    // current month event fetch
    final DateTime beginningOfMonth = DateTime(now.year, now.month, 1);
    final DateTime endOfMonth = DateTime(now.year, now.month + 1, 0);

    currentMonthsEventsLoading.value = true;
    Future<dynamic>.delayed(const Duration(seconds: 1), (){
      currentMonthEvents.value = RenterEventModel.renterEvents.where((RenterEventModel event) {
        return event.date.isAfter(beginningOfMonth.subtract(const Duration(days: 1))) &&
              event.date.isBefore(endOfMonth.add(const Duration(days: 1)));
      }).toList();
    });

    Future<dynamic>.delayed(const Duration(seconds: 2), (){
      currentMonthsEventsLoading.value = false;
    });
  }

  /// [dispose] Lifecycle method called when the controller is destroyed.
  ///
  /// Cleans up by resetting loading states and clearing lists and more...
  @override
  void dispose() {
    tabController.dispose();
    allEventsLoading.value = false;
    currentWeekEventsLoading.value = false;
    currentMonthsEventsLoading.value = false;
    super.dispose();
  }
}
