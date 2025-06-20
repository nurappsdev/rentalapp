import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/owner_allocate_bill_controller.dart';

class OwnerCreateAllocateBillScreen extends GetView<OwnerAllocateBillController> {
  const OwnerCreateAllocateBillScreen({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OwnerAllocateBill'),
        centerTitle: true,
      ),
      body: Center(
        child: Obx(() => Text('Count: ${controller.count}')),
      ),
    );
  }
}
