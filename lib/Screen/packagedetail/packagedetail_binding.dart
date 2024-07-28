import 'package:get/get.dart';

import 'packagedetail_logic.dart';

class PackagedetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PackagedetailLogic());
  }
}
