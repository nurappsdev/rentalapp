import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/owner_allocate_bill_controller.dart';

class OwnerAllocateBillDetailsScreen extends GetView<OwnerAllocateBillController> {
  const OwnerAllocateBillDetailsScreen({
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
