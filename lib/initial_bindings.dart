import 'package:get/get.dart';
import 'package:package_delivery/Screen/dashboard/dashboard_controller.dart';
import 'package:package_delivery/Screen/home/home_controller.dart';
import 'package:package_delivery/Screen/otp/otp_binding.dart';
import 'package:package_delivery/Screen/otp/otp_controller.dart';
import 'package:package_delivery/Screen/otp/otp_verification_model.dart';
import 'package:package_delivery/Screen/profile/profile_controller.dart';
import 'package:package_delivery/Screen/roleselection/roleselection_controller.dart';
import 'package:package_delivery/Screen/select_dispatcher/select_dispatcher_logic.dart';
class InitialBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    // Get.put<DashboardLogic>(DashboardLogic());
    Get.put<HomeLogic>(HomeLogic());
    Get.put<OtpVerificationController>((OtpVerificationController()));
    Get.put<RoleSelectionLogic>(RoleSelectionLogic());
    Get.put<ProfileLogic>(ProfileLogic());
  }
}