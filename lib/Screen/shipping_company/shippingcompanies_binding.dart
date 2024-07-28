
import 'package:get/get.dart';
import 'package:package_delivery/Screen/shipping_company/shippingcompanies_controller.dart';


class ShippingCompaniesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ShippingCompaniesLogic());
  }
}
