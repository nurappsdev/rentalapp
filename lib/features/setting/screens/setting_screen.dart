import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/setting_controller.dart';

class SettingScreen extends GetView<SettingController> {
  const SettingScreen({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting'),
        centerTitle: true,
      ),
      body: Center(
        child: Obx(() => Text('Count: ${controller.count}')),
      ),
    );
  }
}
