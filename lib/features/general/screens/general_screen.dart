import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/general_controller.dart';

class GeneralScreen extends GetView<GeneralController> {
  const GeneralScreen({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('General'),
        centerTitle: true,
      ),
      body: Center(
        child: Obx(() => Text('Count: ${controller.count}')),
      ),
    );
  }
}
