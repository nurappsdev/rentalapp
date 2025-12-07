import 'package:alora/core/utils/logger_utils.dart';
import 'package:alora/features/renter/renter_maintenance/model/renter_maintenance_model.dart';
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

class RenterMaintenanceController extends GetxController with GetSingleTickerProviderStateMixin{

  late TabController tabController;

  final RxList<RenterMaintenanceModel> openMaintenanceList = <RenterMaintenanceModel>[].obs;
  final RxBool openMaintenanceLoading = false.obs;

  final RxList<RenterMaintenanceModel> pastMaintenanceList = <RenterMaintenanceModel>[].obs;
  final RxBool pastMaintenanceLoading = false.obs;


  final RxMap<int, RxList<VideoItemModel>> openRequestVideoItems = <int, RxList<VideoItemModel>>{}.obs;
  final RxMap<int, RxList<VideoItemModel>> pastRequestVideoItems = <int, RxList<VideoItemModel>>{}.obs;

  Future<void> _initializeVideos(int index, List<String> urls, bool isPast) async {
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
      if(isPast){
        pastRequestVideoItems.putIfAbsent(index, () => <VideoItemModel>[].obs).add(item);
      }
      else{
        openRequestVideoItems.putIfAbsent(index, () => <VideoItemModel>[].obs).add(item);
      }
    }
    LoggerUtils.debug(<RxMap<int, RxList<VideoItemModel>>>{pastRequestVideoItems, openRequestVideoItems});
  }

  // Play only one video at a time
  void playOnly(int index, int videoIndex, bool isPast) {
    if(isPast){
      if (!pastRequestVideoItems.containsKey(index)) {
        return;
      }
      for (int i = 0; i < (pastRequestVideoItems[index]?.length ?? 0); i++) {
        if (i == videoIndex) {
          pastRequestVideoItems[index]?[i].videoController.play();
        } else {
          pastRequestVideoItems[index]?[i].videoController.pause();
        }
      }
    }
    else{
      if (!openRequestVideoItems.containsKey(index)) {
        return;
      }
      for (int i = 0; i < (openRequestVideoItems[index]?.length ?? 0); i++) {
        if (i == videoIndex) {
          openRequestVideoItems[index]?[i].videoController.play();
        } else {
          openRequestVideoItems[index]?[i].videoController.pause();
        }
      }
    }
  }

  @override
  void onClose() {
    for (final MapEntry<int, RxList<VideoItemModel>> item in pastRequestVideoItems.entries) {
      for(final VideoItemModel it in item.value){
        it.chewieController.dispose();
        it.videoController.dispose();
      }
    }

    for (final MapEntry<int, RxList<VideoItemModel>> item in openRequestVideoItems.entries) {
      for(final VideoItemModel it in item.value){
        it.chewieController.dispose();
        it.videoController.dispose();
      }
    }
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

    openMaintenanceLoading.value = true;
    Future<dynamic>.delayed(const Duration(seconds: 2), (){
      openMaintenanceList.value = <RenterMaintenanceModel>[];
      if(openMaintenanceList.isNotEmpty){
        for(int i = 0; i < openMaintenanceList.length; i++){
          _initializeVideos(i, openMaintenanceList[i].issueVideos, false);
        }
      }
    });

    Future<dynamic>.delayed(const Duration(seconds: 4), (){
      openMaintenanceLoading.value = false;
    });


    pastMaintenanceLoading.value = true;
    Future<dynamic>.delayed(const Duration(seconds: 2), (){
      pastMaintenanceList.value = RenterMaintenanceModel.dummyMaintenanceList;
      if(pastMaintenanceList.isNotEmpty){
        for(int i = 0; i < pastMaintenanceList.length; i++){
          _initializeVideos(i, pastMaintenanceList[i].issueVideos, true);
        }
      }
    });

    Future<dynamic>.delayed(const Duration(seconds: 4), (){
      pastMaintenanceLoading.value = false;
    });
  }

  /// [dispose] Lifecycle method called when the controller is destroyed.
  ///
  /// Cleans up by resetting loading states and clearing lists and more...
  @override
  void dispose() {
    tabController.dispose();
    pastMaintenanceLoading.value = false;
    openMaintenanceLoading.value = false;
    super.dispose();
  }
}
