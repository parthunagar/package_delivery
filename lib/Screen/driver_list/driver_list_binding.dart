import 'package:get/get.dart';

import 'driver_list_logic.dart';

class DriverListBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => DriverListLogic());
  }
}
