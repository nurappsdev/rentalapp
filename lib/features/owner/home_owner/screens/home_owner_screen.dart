import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_owner_controller.dart';

class HomeOwnerScreen extends GetView<HomeOwnerController> {
  const HomeOwnerScreen({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeOwner'),
        centerTitle: true,
      ),
      body: Center(
        child: Obx(() => Text('Count: ${controller.count}')),
      ),
    );
  }
}
