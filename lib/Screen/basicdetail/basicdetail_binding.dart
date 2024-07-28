import 'package:get/get.dart';
import 'package:package_delivery/Screen/basicdetail/basicdetail_controller.dart';

class BasicDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BasicDetailsLogic());
  }
}
