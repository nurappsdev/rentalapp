import 'package:get/get.dart';
import '../controllers/renter_documents_controller.dart';

class RenterDocumentsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RenterDocumentsController>(
      () => RenterDocumentsController()
    );
  }
}
