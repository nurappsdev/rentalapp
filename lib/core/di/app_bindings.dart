import 'package:get/get.dart';
import 'package:alora/core/network/network_service.dart';

class AppBindings extends Bindings{
  @override
  void dependencies() {
    Get.put<NetworkService>(NetworkService());
  }
}
