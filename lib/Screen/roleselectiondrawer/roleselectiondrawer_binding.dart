import 'package:get/get.dart';
import 'package:package_delivery/Screen/roleselectiondrawer/roleselectiondrawer_controller.dart';


class RoleSelectionDrawerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RoleSelectionDrawerLogic());
  }
}