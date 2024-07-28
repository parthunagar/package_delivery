import 'package:get/get.dart';

import 'card_list_logic.dart';

class CardListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CardListLogic());
  }
}
