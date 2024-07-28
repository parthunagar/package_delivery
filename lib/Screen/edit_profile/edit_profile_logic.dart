import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:package_delivery/AppRoute/app_route.dart';
import 'package:package_delivery/Constant/app_constant.dart';
import 'package:package_delivery/Screen/driver_verification/driver_verification_model.dart';
import 'package:package_delivery/Screen/driver_verification/driver_verification_provider.dart';
import 'package:package_delivery/Screen/edit_profile/edit_profile_model.dart';
import 'package:package_delivery/Screen/edit_profile/edit_profile_provider.dart';
import 'package:package_delivery/Screen/profile/profile_controller.dart';
import 'package:package_delivery/Utils/preference.dart';
import 'package:package_delivery/widget/progress_dialog_utils.dart';

class EditProfileLogic extends GetxController {


  Rx<RxList<EditProfileData>> editProfileDataList = RxList<EditProfileData>.empty().obs;

  ///EDIT PROFILE
  TextEditingController? cName = TextEditingController();
  TextEditingController? cEmail = TextEditingController();
  TextEditingController? cPhone = TextEditingController();
  TextEditingController? cAddress = TextEditingController();

  RxString? countryCode = ''.obs;

  RxString? userProfile = ''.obs;
  RxString? apiToken = ''.obs;

  Rx<File>? image = File('').obs;
  final Rx<ImagePicker> picker = ImagePicker().obs as Rx<ImagePicker>;

  RxString dropdownGenderValue = Const.lblSelect.obs;
  RxList<String> genderItems = [Const.lblSelect,Const.lblGenderMale, Const.lblGenderFemale].obs;
  RxBool showGenderBorder = false.obs;
  String? prefGender;

  void onGenderDropDownChanged(RxString val) {
    dropdownGenderValue.value = val.value;
    debugPrint('onGenderDropDownChanged => dropdownGenderValue.value : ${dropdownGenderValue.value}');



  }

  void onGenderTypeTap(RxBool val) {
    showGenderBorder.value = val.value;
  }

  RxString dropdownRoleValue = Const.lblSelect.obs;
  RxList<String> roleItems = [Const.lblSelect,Const.lblRoleCompany, Const.lblRoleDriver,Const.lblRoleCustomer].obs;
  RxBool showRoleBorder = false.obs;
  RxInt? userRole = 6.obs;

  void onRoleDropDownChanged(RxString val) {
    dropdownRoleValue.value = val.value;
    debugPrint('onRoleDropDownChanged => dropdownRoleValue.value : ${dropdownRoleValue.value}');

    if(dropdownRoleValue.value == Const.lblRoleCompany){
      debugPrint('Role Company : ${UserRoles.comapany}');
      userRole!.value = UserRoles.comapany;
    }
    else if(dropdownRoleValue.value == Const.lblRoleDriver){
      debugPrint('Role Driver : ${UserRoles.driver}');
      userRole!.value = UserRoles.driver;
    }
    else if(dropdownRoleValue.value == Const.lblRoleCustomer){
      debugPrint('Role Customer : ${UserRoles.customer}');
      userRole!.value = UserRoles.customer;
    }
  }

  void onRoleTypeTap(RxBool val) {
    showRoleBorder.value = val.value;
  }


  Future getPrefData() async {
    apiToken!.value = await Preference().read(Const.prefAPIToken);
    cName!.text = await Preference().read(Const.prefName);
    cEmail!.text = await Preference().read(Const.prefEmail);
    countryCode!.value = await Preference().read(Const.prefPhoneCode);
    cPhone!.text = await Preference().read(Const.prefPhone) == 'null' ? '' : await Preference().read(Const.prefPhone);
    debugPrint('getPrefData => cPhone!.text : ${cPhone!.text}');
    cAddress!.text =  await Preference().read(Const.prefAddress) == 'null' ? '' : await Preference().read(Const.prefAddress);
    debugPrint('getPrefData => countryCode.value : ${countryCode!.value}');
    var roleId = await Preference().readInt(Const.prefUserRoleId);
    debugPrint('getPrefData => roleId : ${roleId}');
    userRole!.value = roleId;
    debugPrint('getPrefData => userRole!.value : ${userRole!.value}');
    prefGender = await Preference().read(Const.prefGender);
    debugPrint('getPrefData => prefGender : $prefGender');
    // dropdownGenderValue.value = prefGender!.toString();
    dropdownGenderValue.value = prefGender == null ||  prefGender == "null" ? Const.lblSelect  : prefGender.toString();
    userProfile!.value = await Preference().read(Const.prefUserProfileImage);
    debugPrint('onInit => apiToken : $apiToken');
    debugPrint('getPrefData => userProfile!.value : ${userProfile!.value}');
    if(roleId == UserRoles.comapany) {
      dropdownRoleValue.value = Const.lblRoleCompany;
    }
    else if(roleId == UserRoles.driver) {
      dropdownRoleValue.value = Const.lblRoleDriver;
    }
    else if(roleId == UserRoles.customer){
      dropdownRoleValue.value = Const.lblRoleCustomer;
    }
  }

  Future<EditProfileData?> saveEditProfileData() async {
    debugPrint('saveEditProfileData => add photo : ${image}');
    debugPrint('saveEditProfileData => name : ${cName!.text.trim()}');
    debugPrint('saveEditProfileData => Email : ${ cEmail!.text.trim() }');
    debugPrint('saveEditProfileData => phone code : ${countryCode!.value}');
    debugPrint('saveEditProfileData => phone number : ${cPhone!.text.trim()}');
    debugPrint('saveEditProfileData => Address : ${cAddress!.text.trim()}');
    debugPrint('saveEditProfileData => Gender : ${dropdownGenderValue.value}');
    debugPrint('saveEditProfileData => Role : ${dropdownRoleValue.value}');
    debugPrint('saveEditProfileData => userRole!.value : ${userRole!.value}');
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      ProgressDialogUtils.showProgressDialog(Get.context);
    });

    EditProfileProvider().callEditProfile(
      // cName!.text, cEmail!.text, userRole!.value, gender!.value, cAddress!.text, cPhone!.text, apiToken!.value, image!).then((editProfileValue) async {
        cName!.text, cEmail!.text, userRole!.value, dropdownGenderValue.value, cAddress!.text, cPhone!.text, apiToken!.value,countryCode!.value, image!).then((editProfileValue) async {

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
        await Preference().save(Const.prefPhoneCode, countryCode!.value);
        await Preference().save(Const.prefGender, dropdownGenderValue.value);
        await Preference().save(Const.prefAddress,  editProfileDataList.value[0].address);
        await Preference().save(Const.prefUserRoleName, editProfileDataList.value[0].getRole!.name);
        await Preference().saveInt(Const.prefUserRoleId, editProfileDataList.value[0].getRole!.id);
        await Preference().saveInt(Const.prefUserId, editProfileDataList.value[0].id);
        ProgressDialogUtils.hideProgressDialog();
        Const().toast(editProfile.message);
      }
    });
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    countryCode!.value = await Preference().read(Const.prefPhoneCode);
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
