import 'package:get/get.dart';

import 'followed_list_controller.dart';

class FollowedListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FollowedListLogic());
  }
}
