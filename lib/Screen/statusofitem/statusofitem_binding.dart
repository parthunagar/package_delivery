import 'package:get/get.dart';
import 'package:package_delivery/Screen/statusofitem/statusofitem_controller.dart';


class StatusofItemBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StatusofItemLogic());
  }
}
