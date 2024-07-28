import 'package:get/get.dart';
import 'package:package_delivery/Screen/dashboard/dashboard_controller.dart';
import 'package:package_delivery/Screen/home/home_controller.dart';
import 'package:package_delivery/Screen/mypackages/mypackages_controller.dart';
import 'package:package_delivery/Screen/otp/otp_controller.dart';
import 'package:package_delivery/Screen/profile/profile_controller.dart';
import 'package:package_delivery/Screen/roleselection/roleselection_controller.dart';
import 'package:package_delivery/Screen/traking/traking_logic.dart';


class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeLogic>(HomeLogic());
    Get.put<MyPackagesLogic>((MyPackagesLogic()));
    Get.put<TrakingLogic>(TrakingLogic());
    Get.put<ProfileLogic>(ProfileLogic());
    // Get.lazyPut(() => ProfileLogic(),fenix: true);
    Get.lazyPut(() => DashboardLogic());

  }
}
