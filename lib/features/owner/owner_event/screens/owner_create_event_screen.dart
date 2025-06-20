import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/owner_event_controller.dart';

class OwnerCreateEventScreen extends GetView<OwnerEventController> {
  const OwnerCreateEventScreen({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OwnerEvent'),
        centerTitle: true,
      ),
      body: Center(
        child: Obx(() => Text('Count: ${controller.count}')),
      ),
    );
  }
}
