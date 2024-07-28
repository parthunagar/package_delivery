import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:package_delivery/AppRoute/app_route.dart';
import 'package:package_delivery/Constant/app_constant.dart';
import 'package:package_delivery/Screen/driver_verification/driver_verification_model.dart';
import 'package:package_delivery/Screen/driver_verification/driver_verification_provider.dart';
import 'package:package_delivery/Utils/preference.dart';
import 'package:package_delivery/widget/progress_dialog_utils.dart';

class DriverVerificationLogic extends GetxController with StateMixin<dynamic> {

  ///DRIVER VERIFICATION
  TextEditingController? cName = TextEditingController();
  TextEditingController? cAccNo = TextEditingController();
  TextEditingController? cIFSCCode = TextEditingController();
  TextEditingController? cBranchCode = TextEditingController();
  TextEditingController? cMobileNo = TextEditingController();
  TextEditingController? cVehicleName = TextEditingController();
  TextEditingController? cLicenseNumber = TextEditingController();
  TextEditingController? cVehicleColor = TextEditingController();

  RxString? countryCode = ''.obs;
  final Rx<ImagePicker> picker = ImagePicker().obs as Rx<ImagePicker>;
  final Rx<ImagePicker> picker2 = ImagePicker().obs as Rx<ImagePicker>;

  Rx<File>? image1 = File('').obs;
  Rx<File>? image2 = File('').obs;

  Future<DriverVerification?> saveDriverVerificationData() async {
    ProgressDialogUtils.showProgressDialog(Get.context);
    debugPrint('add photo 1: ${image1}');
    debugPrint('name : ${cName!.text.trim()}');
    debugPrint('account no : ${ cAccNo!.text.trim() }');
    debugPrint('ifsc code : ${cIFSCCode!.text.trim()}');
    debugPrint('branch code : ${cBranchCode!.text.trim()}');
    debugPrint('phone code : ${countryCode!.value}');
    debugPrint('phone number : ${cMobileNo!.text.trim()}');
    debugPrint('add photo 2: ${image2}');
    debugPrint('Vehicle Name : ${cVehicleName!.text.trim()}');
    debugPrint('License Number : ${cLicenseNumber!.text.trim() }');
    debugPrint('Vehicle Color : ${cVehicleColor!.text.trim()}');

    String apiToken = await Preference().read(Const.prefAPIToken);
       print('apiToken : $apiToken');
      DriverVerificationProvider().callDriverVerification(
        apiToken,
        cAccNo!.text.trim(),
        cIFSCCode!.text.trim(),
        image1!,
        cBranchCode!.text.trim(),
        cName!.text.trim(),
        cMobileNo!.text.trim(),
        image2!,
        cVehicleName!.text.trim(),
        cLicenseNumber!.text.trim(),
        cVehicleColor!.text.trim()
      ).then((verificationValue) async {
        final verification = DriverVerification.fromJson(verificationValue);
        if(verification.status == 0) {
          ProgressDialogUtils.hideProgressDialog();
          Const().toast(verification.message);
        }
        else {
          ProgressDialogUtils.hideProgressDialog();
          Const().toast(verification.message);
          await Preference().saveBool(Const.prefIsLoggedIn, true);
          Get.offAllNamed(AppRoutes.dashboardScreen);
        }
      });


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
