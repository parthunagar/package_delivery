import 'package:get/get.dart';
import '../roleselection/roleselection_controller.dart';


class RoleSelectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RoleSelectionLogic());
  }
}