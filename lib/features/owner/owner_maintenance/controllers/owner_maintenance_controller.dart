import 'package:alora/core/config/app_icons.dart';
import 'package:alora/features/renter/search_apartments/model/apartment_model.dart';
import 'package:alora/shared/models/maintenance_model.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoItemModel {
  final String url;
  late final VideoPlayerController videoController;
  late final ChewieController chewieController;
  bool initialized = false;

  VideoItemModel({required this.url});
}

class OwnerMaintenanceController extends GetxController with GetSingleTickerProviderStateMixin {

  final RxInt count = 0.obs;

  late TabController tabController;

  final RxList<MaintenanceModel> maintenances = <MaintenanceModel>[].obs;
  final RxBool apartmentsLoading = false.obs;

  String maintenenceId = '';
  set updateMaintenanceId(String maintenenceId) => this.maintenenceId = maintenenceId;


  Rx<MaintenanceModel?> maintenance = Rx<MaintenanceModel?>(null);
  final RxBool maintenanceLoading = false.obs;

  final RxList<VideoItemModel> videoItems = <VideoItemModel>[].obs;

  Future<void> handleRetriveSingleMaintenance() async{
    maintenanceLoading.value = true;
    Future<dynamic>.delayed(const Duration(seconds: 1), (){
      maintenance.value = MaintenanceModel.dummyMaintenanceList.firstWhere(
        (MaintenanceModel item) => item.id == maintenenceId,
      );
      if(maintenance.value != null){
        _initializeVideos(maintenance.value!.issueVideos);
      }
    });

    Future<dynamic>.delayed(const Duration(seconds: 2), (){
      maintenanceLoading.value = false;
    });
  }

  Future<void> _initializeVideos(List<String> urls) async {

    for (final String url in urls) {
      final VideoItemModel item = VideoItemModel(url: url);

      // Initialize video player controller
      item.videoController = VideoPlayerController.networkUrl(Uri.parse(url));
      await item.videoController.initialize();

      // Initialize chewie controller (adds UI controls)
      item.chewieController = ChewieController(
        videoPlayerController: item.videoController,
        autoPlay: false,
        looping: true,
        showControlsOnInitialize: true,
      );

      item.initialized = true;
      videoItems.add(item);
    }
  }

  // Play only one video at a time
  void playOnly(int index) {
    for (int i = 0; i < videoItems.length; i++) {
      if (i == index) {
        videoItems[i].videoController.play();
      } else {
        videoItems[i].videoController.pause();
      }
    }
  }

  void clearVideos(){
    for (final VideoItemModel item in videoItems) {
      item.chewieController.dispose();
      item.videoController.dispose();
    }
  }
  @override
  void onClose() {
    clearVideos();
    super.onClose();
  }

  
  /// [onInit] Lifecycle method called when the controller is initialized.
  ///
  /// Resets loading states, clears existing data, and triggers and more..
  /// initial fetch
  /// 
  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);

    apartmentsLoading.value = true;
    Future<dynamic>.delayed(const Duration(milliseconds: 500), (){
      maintenances.value = MaintenanceModel.dummyMaintenanceList;
    });

    Future<dynamic>.delayed(const Duration(seconds: 1), (){
      apartmentsLoading.value = false;
    });
  }

  /// [dispose] Lifecycle method called when the controller is destroyed.
  ///
  /// Cleans up by resetting loading states and clearing lists and more...
  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
}
