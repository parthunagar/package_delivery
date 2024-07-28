import 'package:get/get.dart';

import 'upload_image_screen_logic.dart';

class UploadImageScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UploadImageScreenLogic());
  }
}
