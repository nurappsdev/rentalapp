import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/maintenance_details_controller.dart';

class MaintenanceDetailsScreen extends GetView<MaintenanceDetailsController> {
  const MaintenanceDetailsScreen({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MaintenanceDetails'),
        centerTitle: true,
      ),
      body: Center(
        child: Obx(() => Text('Count: ${controller.count}')),
      ),
    );
  }
}
