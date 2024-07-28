import 'package:get/get.dart';

import 'traking_logic.dart';

class TrakingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TrakingLogic());
  }
}
