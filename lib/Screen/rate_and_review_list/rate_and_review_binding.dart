import 'package:get/get.dart';

import 'rate_and_review_logic.dart';

class RateReviewListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RateReviewListLogic());
  }
}
