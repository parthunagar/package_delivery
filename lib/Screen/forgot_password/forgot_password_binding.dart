import 'package:get/get.dart';

import 'forgot_password_logic.dart';

class Forgot_passwordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Forgot_passwordLogic());
  }
}
