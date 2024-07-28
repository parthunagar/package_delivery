import 'package:get/get.dart';
import 'package:package_delivery/Screen/shipmentsummary/shipmentsummary_controller.dart';

class ShipmentSummaryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ShipmentSummaryLogic());
  }
}
