import 'package:get/get.dart';
import 'package:package_delivery/Screen/paymentsuccessful/paymentsuccessful_controller.dart';

class PaymentSuccessfulBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PaymentSuccessfulLogic());
  }
}
