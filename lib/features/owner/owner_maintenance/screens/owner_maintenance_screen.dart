import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/owner_maintenance_controller.dart';

class OwnerMaintenanceScreen extends GetView<OwnerMaintenanceController> {
  const OwnerMaintenanceScreen({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OwnerMaintenance'),
        centerTitle: true,
      ),
      body: Center(
        child: Obx(() => Text('Count: ${controller.count}')),
      ),
    );
  }
}
