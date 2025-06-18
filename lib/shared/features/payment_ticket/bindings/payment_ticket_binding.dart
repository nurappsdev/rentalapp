import 'package:get/get.dart';
import '../controllers/payment_ticket_controller.dart';

class PaymentTicketBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PaymentTicketController>(
      () => PaymentTicketController()
    );
  }
}
