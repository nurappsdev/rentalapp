import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/search_apartments_controller.dart';

class SearchApartmentsScreen extends GetView<SearchApartmentsController> {
  const SearchApartmentsScreen({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SearchApartments'),
        centerTitle: true,
      ),
      body: Center(
        child: Obx(() => Text('Count: ${controller.count}')),
      ),
    );
  }
}
