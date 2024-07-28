import 'package:get/get.dart';
import 'package:package_delivery/AppRoute/NavigationArgs.dart';

class PaymentSuccessfulLogic extends GetxController with StateMixin<dynamic> {

  RxString? trackingID = ''.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    trackingID!.value = Get.arguments[NavigationArgs.kPaymentSuccessTrackingID].toString();

  }
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
