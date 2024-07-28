import 'package:get/get.dart';

import 'select_dispatcher_logic.dart';

class SelectDispatcherBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SelectDispatcherLogic());
  }
}
