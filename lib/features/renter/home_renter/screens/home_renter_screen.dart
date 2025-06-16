import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_renter_controller.dart';

class HomeRentarScreen extends GetView<HomeRenterController> {
  const HomeRentarScreen({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeRenter'),
        centerTitle: true,
      ),
      body: Center(
        child: Obx(() => Text('Count: ${controller.count}')),
      ),
    );
  }
}
