import 'package:get/get.dart';

import 'coupon_history_list_logic.dart';

class CouponHistoryListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CouponHistoryListLogic());
  }
}
