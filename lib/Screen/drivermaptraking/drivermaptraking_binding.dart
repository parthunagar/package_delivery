import 'package:get/get.dart';

import 'drivermaptraking_logic.dart';

class DrivermaptrakingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DrivermaptrakingLogic());
  }
}
