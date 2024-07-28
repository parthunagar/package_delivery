import 'package:get/get.dart';

import 'followers_list_logic.dart';

class FollowersListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FollowersListLogic());
  }
}
