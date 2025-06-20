import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/owner_maintenance_crew_controller.dart';

class OwnerCreateMaintenanceCrewScreen extends GetView<OwnerMaintenanceCrewController> {
  const OwnerCreateMaintenanceCrewScreen({
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
