import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_delivery/AppRoute/app_route.dart';
import 'package:package_delivery/Constant/app_constant.dart';
import 'package:package_delivery/Screen/otp/otp_provider.dart';
import 'package:package_delivery/Screen/otp/otp_verification_model.dart';
import 'package:package_delivery/Screen/roleselection/roleselection_provider.dart';
import 'package:package_delivery/Screen/roleselection/user_registretion_model.dart';
import 'package:package_delivery/Utils/preference.dart';
import 'package:package_delivery/widget/progress_dialog_utils.dart';

class OtpVerificationController extends GetxController with StateMixin<dynamic> {
  RxString otp = ''.obs;
  RxString email = ''.obs;


  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    email.value = await Preference().read(Const.prefEmail);
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

  submitOtpVerification() async{
    if (otp.value != '') {
      ProgressDialogUtils.showProgressDialog(Get.context);
      var userid = await Preference().readInt(Const.prefUserId);
      print('otp.value : ' + otp.value);
      Map<String, dynamic> queryRequest = {
        'id': userid,
        'verification_code' : otp.value,
      };

      OtpProvider().callOtpVerification(queryRequest: queryRequest).then((otpValue) async{
        debugPrint('registerApi 112: '+ otpValue.toString());
        change(otpValue, status: RxStatus.success());
        final userVerify = OtpVerification.fromJson(otpValue);
        if(userVerify.status==1){
          Const().toast(userVerify.message);
          ProgressDialogUtils.hideProgressDialog();
          Get.offAllNamed(AppRoutes.signInScreen);
        }else{
          Const().toast(userVerify.message);
          ProgressDialogUtils.hideProgressDialog();
        }
      }, onError: (error) {
        change(null, status: RxStatus.error(error.toString()));
      });

    } else {
      Const().toast('Please enter valid OTP');
    }
  }

  // RxString? name = ''.obs;
  // RxString? phoneCode = ''.obs;
  // RxString? phoneNo = ''.obs;
  // RxString? password = ''.obs;
  // RxString? address = ''.obs;
  String? name;
  String? phoneCode;
  String? phoneNo;
  String? password;
  String? address;
  int? role;

  Future getUserDataPref() async {
    debugPrint(' =========> 1 <========= ');
    try{
      // name!.value = await Preference().read(Const.prefName);
      // phoneCode!.value = await Preference().read(Const.prefPhoneCode);
      // phoneNo!.value = await Preference().read(Const.prefPhone);
      // email.value = await Preference().read(Const.prefEmail);
      // password!.value = await Preference().read(Const.prefPass);
      // address!.value = await Preference().read(Const.prefAddress);
      // role = await Preference().readInt(Const.prefUserRoleId);

      name = await Preference().read(Const.prefName);
      phoneCode = await Preference().read(Const.prefPhoneCode);
      phoneNo = await Preference().read(Const.prefPhone);
      email.value = await Preference().read(Const.prefEmail);
      password = await Preference().read(Const.prefPass);
      address = await Preference().read(Const.prefAddress);
      role = await Preference().readInt(Const.prefUserRoleId);
      debugPrint('getUserDataPref => name : $name');
      debugPrint('getUserDataPref => phoneCode : $phoneCode');
      debugPrint('getUserDataPref => phoneNo : $phoneNo');
      debugPrint('getUserDataPref => email : ${email.value }');
      debugPrint('getUserDataPref => password : $password');
      debugPrint('getUserDataPref => address : $address');
      debugPrint('getUserDataPref => role : $role');
    }
    catch(e){
      debugPrint('getUserDataPref => ERROR : $e');
    }
  }

  reSendOtp() {
    debugPrint('reSendOtp START');
    getUserDataPref().then((value) {
      debugPrint('name : $name');
      Map<String, dynamic> queryRequest = {
        'username': name,
        'email' : email.value,
        'role' : role,
        'password' : password,
        'current_latitude' : 0.0,
        'current_longitude' : 0.0,
        'address' : address,
        'contact_number' :phoneNo,
        'phone_code': phoneCode
      };
      debugPrint('reSendOtp => queryRequest : $queryRequest');
      RoleSelectionProvider().callRegister(queryRequest: queryRequest).then((registetionValue) async{
        debugPrint('reSendOtp => registetionValue : $registetionValue');

        final userRegistretion = UserRegistretion.fromJson(registetionValue);
        change(registetionValue, status: RxStatus.success());
        if(userRegistretion.status == 0 ) {
          debugPrint('submitRole => userRegistretion.message : '+ userRegistretion.message!);
          ProgressDialogUtils.hideProgressDialog();
          // Get.back();
          Const().toast(userRegistretion.message!);
        }
        else if(userRegistretion.status == 1) {
          debugPrint('submitRole => userRegistretion.message : '+ userRegistretion.message!);
          // await Preference().saveInt(Const.prefUserId, userRegistretion.data!.id);
          // await Preference().save(Const.prefName, userRegistretion.data!.username);
          // await Preference().save(Const.prefEmail, userRegistretion.data!.email);
          // await Preference().save(Const.prefAddress, userRegistretion.data!.address);
          // await Preference().save(Const.prefPhoneCode, userRegistretion.data!.phoneCode);
          // await Preference().save(Const.prefPhone, userRegistretion.data!.contactNumber);
          // await Preference().saveInt(Const.prefUserRoleId, userRegistretion.data!.getRole!.id);
          // await Preference().save(Const.prefUserRoleName, userRegistretion.data!.getRole!.name);

          // name = await Preference().read(Const.prefName);
          // phoneCode = await Preference().read(Const.prefPhoneCode);
          // phoneNo = await Preference().read(Const.prefPhone);
          // email.value = await Preference().read(Const.prefEmail);
          // password = await Preference().read(Const.prefPass);
          // address = await Preference().read(Const.prefAddress);
          // var userid = await Preference().readInt(Const.prefUserId);
          // var userRoleid = await Preference().readInt(Const.prefUserRoleId);
          // var userRoleNameid = await Preference().read(Const.prefUserRoleName);

          // debugPrint('getUserDataPref => name : $name');
          // debugPrint('getUserDataPref => phoneCode : $phoneCode');
          // debugPrint('getUserDataPref => phoneNo : $phoneNo');
          // debugPrint('getUserDataPref => email : $email');
          // debugPrint('getUserDataPref => password : $password');
          // debugPrint('getUserDataPref => address : $address');
          // debugPrint('getUserDataPref => userid : $userid');
          // debugPrint('getUserDataPref => userRoleid : $userRoleid');
          // debugPrint('getUserDataPref => userRoleNameid : $userRoleNameid');
          Const().toast('Resend OTP successfully.');
          ProgressDialogUtils.hideProgressDialog();
        }
      }).onError((error, stackTrace) {
        debugPrint('reSendOtp => ERROR : $error');
        change(null, status: RxStatus.error(error.toString()));
      });
    });
    // Map<String, dynamic> queryRequest = {
    //   'username': name!.value,
    //   'email' : email.value,
    //   'role' : role,
    //   'password' : password!.value,
    //   'current_latitude' : 0.0,
    //   'current_longitude' : 0.0,
    //   'address' : address!.value,
    //   'contact_number' :phoneNo!.value,
    //   'phone_code': phoneCode!.value
    // };

  }
}
