import 'package:get/get.dart';
import 'package:package_delivery/Screen/profile/profile_controller.dart';



class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileLogic());
  }
}
