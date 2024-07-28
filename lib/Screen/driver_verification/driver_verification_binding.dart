import 'package:get/get.dart';

import 'driver_verification_logic.dart';

class DriverVerificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DriverVerificationLogic());
  }
}
