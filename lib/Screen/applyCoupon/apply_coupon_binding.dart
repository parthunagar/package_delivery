import 'package:get/get.dart';
import 'package:package_delivery/Screen/applyCoupon/apply_coupon_controller.dart';

class ApplyCouponBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApplyCouponLogic());
  }
}
