import 'package:get/get.dart';
import '../controllers/search_apartments_controller.dart';

class SearchApartmentsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchApartmentsController>(
      () => SearchApartmentsController()
    );
  }
}
