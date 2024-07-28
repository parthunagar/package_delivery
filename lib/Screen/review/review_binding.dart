import 'package:get/get.dart';
import 'package:package_delivery/Screen/review/review_controller.dart';

class ReviewBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => ReviewLogic());
  }
}
