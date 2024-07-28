import 'package:get/get.dart';

import 'add_edit_card_logic.dart';

class AddEditCardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddEditCardLogic());
  }
}
