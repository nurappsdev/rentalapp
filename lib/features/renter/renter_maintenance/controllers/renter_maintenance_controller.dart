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

  final RxList<RenterMaintenanceModel> openMaintainanceList = <RenterMaintenanceModel>[].obs;
  final RxBool openMaintenanceLoading = false.obs;

  final RxList<RenterMaintenanceModel> pastMaintainanceList = <RenterMaintenanceModel>[].obs;
  final RxBool pastMaintenanceLoading = false.obs;


  final RxMap<int, RxList<VideoItemModel>> openReqeustVideoItems = <int, RxList<VideoItemModel>>{}.obs;
  final RxMap<int, RxList<VideoItemModel>> pastReqeustVideoItems = <int, RxList<VideoItemModel>>{}.obs;

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
        pastReqeustVideoItems.putIfAbsent(index, () => <VideoItemModel>[].obs).add(item);
      }
      else{
        openReqeustVideoItems.putIfAbsent(index, () => <VideoItemModel>[].obs).add(item);
      }
    }
    LoggerUtils.debug(<RxMap<int, RxList<VideoItemModel>>>{pastReqeustVideoItems, openReqeustVideoItems});
  }

  // Play only one video at a time
  void playOnly(int index, int videoIndex, bool isPast) {
    if(isPast){
      if (!pastReqeustVideoItems.containsKey(index)) {
        return;
      }
      for (int i = 0; i < (pastReqeustVideoItems[index]?.length ?? 0); i++) {
        if (i == videoIndex) {
          pastReqeustVideoItems[index]?[i].videoController.play();
        } else {
          pastReqeustVideoItems[index]?[i].videoController.pause();
        }
      }
    }
    else{
      if (!openReqeustVideoItems.containsKey(index)) {
        return;
      }
      for (int i = 0; i < (openReqeustVideoItems[index]?.length ?? 0); i++) {
        if (i == videoIndex) {
          openReqeustVideoItems[index]?[i].videoController.play();
        } else {
          openReqeustVideoItems[index]?[i].videoController.pause();
        }
      }
    }
  }

  @override
  void onClose() {
    for (final MapEntry<int, RxList<VideoItemModel>> item in pastReqeustVideoItems.entries) {
      for(final VideoItemModel it in item.value){
        it.chewieController.dispose();
        it.videoController.dispose();
      }
    }

    for (final MapEntry<int, RxList<VideoItemModel>> item in openReqeustVideoItems.entries) {
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
      openMaintainanceList.value = <RenterMaintenanceModel>[];
      if(openMaintainanceList.isNotEmpty){
        for(int i = 0; i < openMaintainanceList.length; i++){
          _initializeVideos(i, openMaintainanceList[i].issueVideos, false);
        }
      }
    });

    Future<dynamic>.delayed(const Duration(seconds: 4), (){
      openMaintenanceLoading.value = false;
    });


    pastMaintenanceLoading.value = true;
    Future<dynamic>.delayed(const Duration(seconds: 2), (){
      pastMaintainanceList.value = RenterMaintenanceModel.dummyMaintenanceList;
      if(pastMaintainanceList.isNotEmpty){
        for(int i = 0; i < pastMaintainanceList.length; i++){
          _initializeVideos(i, pastMaintainanceList[i].issueVideos, true);
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
