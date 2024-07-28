import 'package:get/get.dart';
import 'package:package_delivery/Screen/paymentmethod/paymentmethod_controller.dart';

class PaymentMethodBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PaymentMethodLogic());
  }
}
