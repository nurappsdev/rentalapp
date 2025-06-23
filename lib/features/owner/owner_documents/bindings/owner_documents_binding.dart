import 'package:get/get.dart';
import '../controllers/owner_documents_controller.dart';

class OwnerDocumentsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OwnerDocumentsController>(
      () => OwnerDocumentsController()
    );
  }
}
