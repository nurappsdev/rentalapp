import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/renter_maintenance_create_controller.dart';

class RenterMaintenanceCreateScreen extends GetView<RenterMaintenanceCreateController> {
  const RenterMaintenanceCreateScreen({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RenterMaintenanceCreate'),
        centerTitle: true,
      ),
      body: Center(
        child: Obx(() => Text('Count: ${controller.count}')),
      ),
    );
  }
}
