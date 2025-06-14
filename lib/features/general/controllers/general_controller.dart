import 'package:alora/core/enums/general_type.dart';
import 'package:get/get.dart';

class GeneralController extends GetxController {

  final RxBool isLoading = false.obs;

  final Rx<DateTime?> lastUpdated = Rx<DateTime?>(null);
  final Rx<String?> content = Rx<String?>(null);

  Future<void> handleRetriveGeneralInfo(GeneralType generalType) async{
    isLoading.value = true;
    try {
      await Future<dynamic>.delayed(const Duration(seconds: 1));
      lastUpdated.value = DateTime.now().subtract(const Duration(days: 8));
      content.value = "Lorem ipsum dolor sit amet consectetur. Ultrices id feugiat venenatis habitant mattis viverra elementum purus volutpat. Lacus eu molestie pulvinar rhoncus integer proin elementum. Pretium sit fringilla massa tristique aenean commodo leo. Aliquet viverra amet sit porta elementum et pellentesque posuere. Ullamcorper viverra tortor lobortis viverra auctor egestas. Nulla condimentum ac metus quam turpis gravida ut velit. Porta justo lacus consequat sed platea. Ut dui massa quam elit faucibus consectetur sapien aenean auctor. Felis ipsum amet justo in. Netus amet in egestas sed auctor lorem. Justo ullamcorper velit habitasse lorem eu arcu. Non enim a elit urna eget nibh quisque donec condimentum. Elit ut pellentesque neque in quis at viverra. Nisl etiam tristique odio eget convallis.";
    }
    finally{
      isLoading.value = false;
    }
  }


  /// [onInit] Lifecycle method called when the controller is initialized.
  ///
  /// Resets loading states, clears existing data, and triggers and more..
  /// initial fetch
  /// 
  @override
  void onInit() {
    super.onInit();
    isLoading.value = false;
    lastUpdated.value = null;
    content.value = null;
  }

  /// [dispose] Lifecycle method called when the controller is destroyed.
  ///
  /// Cleans up by resetting loading states and clearing lists and more...
  @override
  void dispose() {
    isLoading.value = false;
    lastUpdated.value = null;
    content.value = null;
    super.dispose();
  }
}
