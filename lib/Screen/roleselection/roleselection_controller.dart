import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_delivery/AppRoute/app_route.dart';
import 'package:package_delivery/Constant/app_constant.dart';
import 'package:package_delivery/Screen/roleselection/roleselection_provider.dart';
import 'package:package_delivery/Screen/roleselection/user_registretion_model.dart';
import 'package:package_delivery/Utils/preference.dart';
import 'package:package_delivery/widget/progress_dialog_utils.dart';



class RoleSelectionLogic extends GetxController with StateMixin<dynamic> {

  var selectedRole = UserRoles.comapany.obs;


  String? name,phoneCode,phoneNo,email,password,address;


  getUserDataPref() async {
    debugPrint(' =========> 1 <========= ');
    try{
      name = await Preference().read(Const.prefName);
      phoneCode = await Preference().read(Const.prefPhoneCode);
      phoneNo = await Preference().read(Const.prefPhone);
      email = await Preference().read(Const.prefEmail);
      password = await Preference().read(Const.prefPass);
      address = await Preference().read(Const.prefAddress);
      debugPrint('getUserDataPref => name : $name');
      debugPrint('getUserDataPref => phoneCode : $phoneCode');
      debugPrint('getUserDataPref => phoneNo : $phoneNo');
      debugPrint('getUserDataPref => email : $email');
      debugPrint('getUserDataPref => password : $password');
      debugPrint('getUserDataPref => address : $address');
    }
    catch(e){
      debugPrint('getUserDataPref => ERROR : $e');
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    debugPrint('Before..........');
    getUserDataPref();
    debugPrint('After..........');
    super.onInit();

  }

  @override
  void onReady() {
    // TODO: implement onReady
    debugPrint('Before1..........');
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void changeval(value) => selectedRole.value = value;

   submitRole() async {
    // getUserDataPref();
    ProgressDialogUtils.showProgressDialog(Get.context);
    getUserDataPref();
    debugPrint('submitRole : email => ${email}');
    debugPrint('this.selectedRole.value : ' + selectedRole.value.toString());
    await Preference().saveInt(Const.prefUserRoleId, selectedRole.value);
    int role = await Preference().readInt(Const.prefUserRoleId);
    debugPrint('submitRole : role => $role');
    // Get.toNamed(AppRoutes.forgotPasswordScreen);
    phoneCode = await Preference().read(Const.prefPhoneCode);
    debugPrint('submitRole : phoneCode => $phoneCode');
    // if(selectedRole.value == RoleType.customer ) {
    Map<String, dynamic> queryRequest = {
      'username': name,
      'email' : email,
      'role' : role,
      'password' : password,
      'current_latitude' : 0.0,
      'current_longitude' : 0.0,
      'address' : address,
      'contact_number' :phoneNo,
      'phone_code': phoneCode
    };
    debugPrint('submitRole => queryRequest '+ queryRequest.entries.toString());
    RoleSelectionProvider().callRegister(queryRequest: queryRequest).then((registetionValue) async{
      debugPrint('submitRole => registetionValue : '+ registetionValue.toString());
      change(registetionValue, status: RxStatus.success());
      final userRegistretion = UserRegistretion.fromJson(registetionValue);
      if(userRegistretion.status == 0 ){
        debugPrint('submitRole => userRegistretion.message : '+ userRegistretion.message!);
        ProgressDialogUtils.hideProgressDialog();
        Get.back();
        Const().toast(userRegistretion.message!);
      }
      else if(userRegistretion.status == 1) {
        debugPrint('submitRole => userRegistretion.message : '+ userRegistretion.message!);
        await Preference().saveInt(Const.prefUserId, userRegistretion.data!.id);
        await Preference().save(Const.prefName, userRegistretion.data!.username);
        await Preference().save(Const.prefEmail, userRegistretion.data!.email);
        await Preference().save(Const.prefAddress, userRegistretion.data!.address);
        await Preference().save(Const.prefPhoneCode, userRegistretion.data!.phoneCode);
        await Preference().save(Const.prefPhone, userRegistretion.data!.contactNumber);
        await Preference().saveInt(Const.prefUserRoleId, userRegistretion.data!.getRole!.id);
        await Preference().save(Const.prefUserRoleName, userRegistretion.data!.getRole!.name);

        name = await Preference().read(Const.prefName);
        phoneCode = await Preference().read(Const.prefPhoneCode);
        phoneNo = await Preference().read(Const.prefPhone);
        email = await Preference().read(Const.prefEmail);
        password = await Preference().read(Const.prefPass);
        address = await Preference().read(Const.prefAddress);
        // var userid = await Preference().readInt(Const.prefUserId);
        // var userRoleid = await Preference().readInt(Const.prefUserRoleId);
        // var userRoleNameid = await Preference().read(Const.prefUserRoleName);

        debugPrint('getUserDataPref => name : $name');
        debugPrint('getUserDataPref => phoneCode : $phoneCode');
        debugPrint('getUserDataPref => phoneNo : $phoneNo');
        debugPrint('getUserDataPref => email : $email');
        debugPrint('getUserDataPref => password : $password');
        debugPrint('getUserDataPref => address : $address');
        // debugPrint('getUserDataPref => userid : $userid');
        // debugPrint('getUserDataPref => userRoleid : $userRoleid');
        // debugPrint('getUserDataPref => userRoleNameid : $userRoleNameid');
        Const().toast(userRegistretion.message!);
        ProgressDialogUtils.hideProgressDialog();
        Get.toNamed(AppRoutes.otpScreen);
      }

    }, onError: (error) {
      change(null, status: RxStatus.error(error.toString()));
    });


  }

}
