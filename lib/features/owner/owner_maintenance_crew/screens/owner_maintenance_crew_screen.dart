import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/owner_maintenance_crew_controller.dart';

class OwnerMaintenanceCrewScreen extends GetView<OwnerMaintenanceCrewController> {
  const OwnerMaintenanceCrewScreen({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OwnerMaintenanceCrew'),
        centerTitle: true,
      ),
      body: Center(
        child: Obx(() => Text('Count: ${controller.count}')),
      ),
    );
  }
}
