import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_delivery/AppRoute/app_route.dart';
import 'package:package_delivery/Constant/app_constant.dart';
import 'package:package_delivery/Screen/forgot_password/forgot_password_model.dart';
import 'package:package_delivery/Screen/forgot_password/forgot_password_provider.dart';
import 'package:package_delivery/widget/progress_dialog_utils.dart';
import 'package:get/get.dart';

class Forgot_passwordLogic extends GetxController with StateMixin<dynamic> {
  TextEditingController? cEmail = TextEditingController();
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

  submitEmail() async{
    if (cEmail!.text != '') {
      ProgressDialogUtils.showProgressDialog(Get.context);

      print('otp.value : ' + cEmail!.text);
      Map<String, dynamic> queryRequest = {
        'email': cEmail!.text,

      };
      // Get.toNamed(AppRoutes.driverVerification);
      ForgotPasswordProvider().callForgotPassword(queryRequest: queryRequest).then((userVerify) async{
        debugPrint('registerApi 112: '+ userVerify.toString());
        final forgotPass = ResetPasswrd.fromJson(userVerify);
        change(userVerify, status: RxStatus.success());
        Const().toast(forgotPass.message);
        ProgressDialogUtils.hideProgressDialog();
        Get.offAllNamed(AppRoutes.signInScreen);
      }, onError: (error) {
        debugPrint('registerApi 112: '+ error.toString());
        Const().toast(error['message'].toString());
        ProgressDialogUtils.hideProgressDialog();
        change(null, status: RxStatus.error(error.toString()));
      });

    } else {
      Const().toast('please enter valid Email');
    }
  }
}
