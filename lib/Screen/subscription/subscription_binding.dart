import 'package:get/get.dart';
import 'package:package_delivery/Screen/subscription/subscription_controller.dart';


class SubscriptionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SubscriptionLogic());
  }
}