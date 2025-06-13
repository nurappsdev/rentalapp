import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_rentar_controller.dart';

class HomeRentarScreen extends GetView<HomeRentarController> {
  const HomeRentarScreen({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeRentar'),
        centerTitle: true,
      ),
      body: Center(
        child: Obx(() => Text('Count: ${controller.count}')),
      ),
    );
  }
}
