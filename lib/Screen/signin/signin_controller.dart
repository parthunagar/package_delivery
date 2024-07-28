import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_delivery/AppRoute/app_route.dart';
import 'package:package_delivery/Constant/app_constant.dart';
import 'package:package_delivery/Screen/signin/signin_model.dart';
import 'package:package_delivery/Screen/signin/signin_provider.dart';
import 'package:package_delivery/Utils/preference.dart';
import 'package:package_delivery/widget/progress_dialog_utils.dart';

class SignInLogic extends GetxController with StateMixin<dynamic> {
  RxBool? rememberMe = false.obs;

  // FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  // ///SIGNIN
  // TextEditingController? cEmail = TextEditingController(text: 'e1.customer@yopmail.com');
  // TextEditingController? cPassword = TextEditingController(text: '123456789');

  ///SIGNIN
  TextEditingController? cEmail = TextEditingController();
  TextEditingController? cPassword = TextEditingController();

  getPrefData() async {
    dynamic a = await Preference().read(Const.prefRememberMe);
    String? email = await Preference().read(Const.prefEmail);
    debugPrint('getPrefData => email : $email');
    String? pass = await Preference().read(Const.prefPass);
    debugPrint('getPrefData => pass : $pass');
    if(a == 'true') {
      cEmail!.text = email!;
      cPassword!.text = pass!;
      try{
        rememberMe!.value =  a.toLowerCase() == '$a' ;
      }catch(e) {
        debugPrint('getPrefData => ERROR : $e');
      }
    }
  }

  Future<Signin?> saveSignInData() async {
    ProgressDialogUtils.showProgressDialog(Get.context);
    var token = await FirebaseMessaging.instance.getToken();
    debugPrint('saveSignInData => FCM token : $token');
    SiginProvider().callLogin(cEmail!.text.trim(),cPassword!.text.trim(),token!).then((callLoginValue) async {
      final singIn = Signin.fromJson(callLoginValue);
      change(value, status: RxStatus.success());
      if(singIn.status == 0) {
        ProgressDialogUtils.hideProgressDialog();
        Const().toast(singIn.message);
        // return Signin.fromJson(callLoginValue);
      }
     else if(singIn.status == 2) {
        ProgressDialogUtils.hideProgressDialog();
        await Preference().save(Const.prefEmail, cEmail!.text.trim());
        debugPrint('email : ${cEmail!.text.trim()}');
        debugPrint('password : ${cPassword!.text.trim()}');
        debugPrint('loginApi => singIn.signinData.id : ${singIn.signinData!.id}');
        debugPrint('loginApi => singIn.signinData.username : ${singIn.signinData!.username}');
        debugPrint('loginApi => singIn.signinData.email : ${singIn.signinData!.email}');
        debugPrint('loginApi => singIn.signinData.role : ${singIn.signinData!.role}');
        debugPrint('loginApi => singIn.signinData.address : ${singIn.signinData!.address}');
        debugPrint('loginApi => singIn.signinData.currentLatitude : ${singIn.signinData!.currentLatitude}');
        debugPrint('loginApi => singIn.signinData.currentLongitude : ${singIn.signinData!.currentLongitude}');
        debugPrint('loginApi => singIn.signinData.phoneCode : ${singIn.signinData!.phoneCode}');
        debugPrint('loginApi => singIn.signinData.contactNumber : ${singIn.signinData!.contactNumber}');
        debugPrint('loginApi => singIn.signinData.verificationCode : ${singIn.signinData!.verificationCode}');
        debugPrint('loginApi => singIn.signinData.API token : ${singIn.signinData!.token}');
        await Preference().save(Const.prefRememberMe, rememberMe!.value.toString());
        await Preference().save(Const.prefEmail, cEmail!.text.trim().toString());
        await Preference().save(Const.prefPass, cPassword!.text.trim().toString());
        await Preference().save(Const.prefAddress, singIn.signinData!.address.toString());
        await Preference().save(Const.prefName, singIn.signinData!.username.toString());
        await Preference().save(Const.prefPhoneCode, singIn.signinData!.phoneCode.toString());
        await Preference().save(Const.prefPhone, singIn.signinData!.contactNumber.toString());
        await Preference().save(Const.prefFCMToken, token.toString());
        await Preference().saveInt(Const.prefUserId, singIn.signinData!.id);
        await Preference().save(Const.prefGender, singIn.signinData!.gender.toString());
        await Preference().saveBool(Const.prefNotificationRoutesSet, false);
        Const().toast(singIn.message);
        Get.toNamed(AppRoutes.otpScreen);
        // return Signin.fromJson(callLoginValue);
      }
      else {
        debugPrint('email : ${cEmail!.text.trim()}');
        debugPrint('password : ${cPassword!.text.trim()}');
        debugPrint('loginApi => singIn.signinData.id : ${singIn.signinData!.id}');
        debugPrint('loginApi => singIn.signinData.username : ${singIn.signinData!.username}');
        debugPrint('loginApi => singIn.signinData.email : ${singIn.signinData!.email}');
        debugPrint('loginApi => singIn.signinData.role : ${singIn.signinData!.role}');
        debugPrint('loginApi => singIn.signinData.address : ${singIn.signinData!.address}');
        debugPrint('loginApi => singIn.signinData.currentLatitude : ${singIn.signinData!.currentLatitude}');
        debugPrint('loginApi => singIn.signinData.currentLongitude : ${singIn.signinData!.currentLongitude}');
        debugPrint('loginApi => singIn.signinData.phoneCode : ${singIn.signinData!.phoneCode}');
        debugPrint('loginApi => singIn.signinData.contactNumber : ${singIn.signinData!.contactNumber}');
        debugPrint('loginApi => singIn.signinData.verificationCode : ${singIn.signinData!.verificationCode}');
        debugPrint('loginApi => singIn.signinData.API token : ${singIn.signinData!.token}');
        debugPrint('loginApi => singIn.signinData.getRole.id : ${singIn.signinData!.getRole!.id}');
        debugPrint('loginApi => singIn.signinData.getRole.name : ${singIn.signinData!.getRole!.name}');
        await Preference().save(Const.prefRememberMe, rememberMe!.value.toString());
        await Preference().save(Const.prefEmail, cEmail!.text.trim().toString());
        await Preference().save(Const.prefPass, cPassword!.text.trim().toString());
        await Preference().save(Const.prefAddress, singIn.signinData!.address.toString());
        await Preference().save(Const.prefName, singIn.signinData!.username.toString());
        await Preference().save(Const.prefPhoneCode, singIn.signinData!.phoneCode.toString());
        await Preference().save(Const.prefPhone, singIn.signinData!.contactNumber.toString());
        await Preference().save(Const.prefFCMToken, token.toString());
        await Preference().saveInt(Const.prefUserId, singIn.signinData!.id);
        await Preference().saveInt(Const.prefUserRoleId, singIn.signinData!.getRole!.id);
        await Preference().save(Const.prefUserRoleName, singIn.signinData!.getRole!.name.toString());
        await Preference().save(Const.prefAPIToken, singIn.signinData!.token.toString());
        await Preference().save(Const.prefGender, singIn.signinData!.gender.toString());
        await Preference().saveBool(Const.prefNotificationRoutesSet, false);

        var a = await Preference().readBool(Const.prefIsLoggedIn);
        debugPrint('saveData => a : $a');
        ProgressDialogUtils.hideProgressDialog();

        if(singIn.signinData!.getRole!.id == 4 && singIn.signinData!.isDrivingVerified == 0){
          await Preference().saveBool(Const.prefIsLoggedIn, false);
          // TODO: 21-01-2022 Milestone 1 Complete
          Const().toast(singIn.message);
          Get.toNamed(AppRoutes.driverVerification);
        } else{
          await Preference().saveBool(Const.prefIsLoggedIn, true);
          Const().toast(singIn.message);
          //TODO : 21-01-2022 Milestone 1 Complete
          Get.offNamed(AppRoutes.dashboardScreen);
        }


        // var a = await Preference().read(Const.prefRememberMe);
        // var b = await Preference().read(Const.prefEmail);
        // var c = await Preference().read(Const.prefPass);
        // var d = await Preference().read(Const.prefFCMToken);
        // var e = await Preference().readInt(Const.prefUserId);
        // var f = await Preference().readInt(Const.prefUserRoleId);
        // var h = await Preference().read(Const.prefUserRoleName);
        // var i = await Preference().read(Const.prefAPIToken);
        // debugPrint('saveData => a : $a');
        // debugPrint('saveData => b : $b');
        // debugPrint('saveData => c : $c');
        // debugPrint('saveData => d : $d');
        // debugPrint('saveData => e : $e');
        // debugPrint('saveData => f : $f');
        // debugPrint('saveData => h : $h');
        // debugPrint('saveData => i : $i');
        // return Signin.fromJson(callLoginValue);
      }
    },onError: (error) {
      debugPrint('loginApi => ERROR : $error');
      change(null,status: RxStatus.error(error.toString()));
    });
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    debugPrint(' ======> LoginScreenLogic onInit 1 <====== ');
    getPrefData();
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
