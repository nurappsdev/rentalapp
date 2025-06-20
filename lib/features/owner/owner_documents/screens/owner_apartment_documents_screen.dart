import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/owner_documents_controller.dart';

class OwnerApartmentDocumentsScreen extends GetView<OwnerDocumentsController> {
  const OwnerApartmentDocumentsScreen({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OwnerDocuments'),
        centerTitle: true,
      ),
      body: Center(
        child: Obx(() => Text('Count: ${controller.count}')),
      ),
    );
  }
}
