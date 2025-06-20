import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/owner_renter_list_controller.dart';

class OwnerRenterListScreen extends GetView<OwnerRenterListController> {
  const OwnerRenterListScreen({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OwnerRenterList'),
        centerTitle: true,
      ),
      body: Center(
        child: Obx(() => Text('Count: ${controller.count}')),
      ),
    );
  }
}
