import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_delivery/AppRoute/app_route.dart';
import 'package:package_delivery/Constant/app_constant.dart';
import 'package:package_delivery/Screen/edit_profile/edit_profile_model.dart';
import 'package:package_delivery/Screen/roleselection/roleselection_provider.dart';
import 'package:package_delivery/Screen/roleselection/user_registretion_model.dart';
import 'package:package_delivery/Screen/roleselectiondrawer/roleselectiondrawer_provider.dart';
import 'package:package_delivery/Utils/preference.dart';
import 'package:package_delivery/widget/progress_dialog_utils.dart';



class RoleSelectionDrawerLogic extends GetxController with StateMixin<dynamic> {

  var selectedRole = UserRoles.comapany.obs;


  String? name,phoneCode,phoneNo,email,password,address;
  Rx<RxList<EditProfileData>> editProfileDataList = RxList<EditProfileData>.empty().obs;

  getUserDataPref() async {
    debugPrint(' =========> 1 <========= ');
    try{
      name = await Preference().read(Const.prefName);
      phoneCode = await Preference().read(Const.prefPhoneCode);
      phoneNo = await Preference().read(Const.prefPhone);
      email = await Preference().read(Const.prefEmail);
      password = await Preference().read(Const.prefPass);
      address = await Preference().read(Const.prefAddress);
      selectedRole.value = await Preference().readInt(Const.prefUserRoleId);
      debugPrint('getUserDataPref1 => name : $name');
      debugPrint('getUserDataPref1 => phoneCode : $phoneCode');
      debugPrint('getUserDataPref1 => phoneNo : $phoneNo');
      debugPrint('getUserDataPref1 => email : $email');
      debugPrint('getUserDataPref1 => password : $password');
      debugPrint('getUserDataPref1 => address : $address');
      debugPrint('getUserDataPref1 => userRole : ${selectedRole.value}');
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
    // getUserDataPref();
    debugPrint('submitRole : email => ${email}');
    debugPrint('this.selectedRole.value : ' + selectedRole.value.toString());
    // await Preference().saveInt(Const.prefUserRoleId, selectedRole.value);
    // int role = await Preference().readInt(Const.prefUserRoleId);
    // debugPrint('submitRole : role => $role');
    // Get.toNamed(AppRoutes.forgotPasswordScreen);
    phoneCode = await Preference().read(Const.prefPhoneCode);
    debugPrint('submitRole : phoneCode => $phoneCode');
    String apiToken = await Preference().read(Const.prefAPIToken);
    // if(selectedRole.value == RoleType.customer ) {
    Map<String, dynamic> queryRequest = {
      'role' : selectedRole.value,
    };
    debugPrint('submitRole => queryRequest '+ queryRequest.entries.toString());
    Map<String, String> headers = {"authorization": "Bearer $apiToken"};
    RoleSelectionDrawerProvider().callDrawerUpdateRole(queryRequest: queryRequest,headers: headers).then((editProfileValue) async{
      debugPrint('saveEditProfileData => editProfileValue : $editProfileValue');
      final editProfile = EditProfile.fromJson(editProfileValue);
      editProfileDataList.value.clear();
      editProfileDataList.value.add(editProfile.editProfileData!);
      if(editProfile.status == 0) {
        ProgressDialogUtils.hideProgressDialog();
        Const().toast(editProfile.message);
        // return Signin.fromJson(callLoginValue);
      }
      else if(editProfile.status == 2) {
        ProgressDialogUtils.hideProgressDialog();
        Const().toast(editProfile.message);
        await Preference().clear();
        Get.offAllNamed(AppRoutes.signInScreen);
        // return Signin.fromJson(callLoginValue);
      }
      else {
        try{
          debugPrint('id : ${editProfileDataList.value[0].id.toString()}');
          debugPrint('username : ${editProfileDataList.value[0].username.toString()}');
          debugPrint('email : ${editProfileDataList.value[0].email.toString()}');
          debugPrint('contact_number : ${editProfileDataList.value[0].contactNumber.toString()}');
          debugPrint('verificationCode : ${editProfileDataList.value[0].verificationCode.toString()}');
          debugPrint('role : ${editProfileDataList.value[0].role.toString()}');
          debugPrint('gender : ${editProfileDataList.value[0].gender.toString()}');
          debugPrint('address : ${editProfileDataList.value[0].address.toString()}');
          debugPrint('isVerified : ${editProfileDataList.value[0].isVerified.toString()}');
          debugPrint('isDrivingVerified : ${editProfileDataList.value[0].isDrivingVerified.toString()}');
          debugPrint('driverPhoto : ${editProfileDataList.value[0].driverPhoto.toString()}');
        }
        catch(e) {
          debugPrint('editProfileDataList => ERROR : $e');
        }
        await Preference().save(Const.prefUserProfileImage, editProfileDataList.value[0].driverPhoto??'');
        await Preference().save(Const.prefName, editProfileDataList.value[0].username);
        await Preference().save(Const.prefEmail, editProfileDataList.value[0].email);
        await Preference().save(Const.prefPhone, editProfileDataList.value[0].contactNumber);
        await Preference().save(Const.prefPhoneCode, phoneCode);
        await Preference().save(Const.prefGender, editProfileDataList.value[0].gender);
        await Preference().save(Const.prefAddress,  editProfileDataList.value[0].address);
        await Preference().save(Const.prefUserRoleName, editProfileDataList.value[0].getRole!.name);
        await Preference().saveInt(Const.prefUserRoleId, editProfileDataList.value[0].getRole!.id);
        await Preference().saveInt(Const.prefUserId, editProfileDataList.value[0].id);
        ProgressDialogUtils.hideProgressDialog();
        Const().toast(editProfile.message);
      }
    });

  }

}
