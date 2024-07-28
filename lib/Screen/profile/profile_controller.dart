import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_delivery/Constant/app_constant.dart';
import 'package:package_delivery/Screen/profile/profile_model.dart';
import 'package:package_delivery/Screen/profile/profile_provider.dart';
import 'package:package_delivery/Screen/profile/withdraw_request_model.dart';
import 'package:package_delivery/Utils/preference.dart';
import 'package:package_delivery/widget/progress_dialog_utils.dart';

class ProfileLogic extends GetxController with StateMixin<dynamic> {



  RxString? userName = ''.obs;
  RxString? userEmail = ''.obs;
  RxString? userPhoneCode = ''.obs;
  RxString? userMobileNo = ''.obs;
  RxString? userGender = ''.obs;
  RxString? userGenderID = ''.obs;
  RxString? userAddress = ''.obs;
  RxString? userRole = ''.obs;
  RxString? userProfilePhoto = ''.obs;
  RxInt? userFreeDelivery = 0.obs;
  RxInt userRoleid = 0.obs;
  var driver_total_earning = '0.00'.obs;
  // Rx<RxList<GetProfileData>> getProfileList = RxList<GetProfileData>.empty().obs;
  Rx<GetProfileData> getProfileList = GetProfileData().obs; 
  RxBool isGetProfileDataLoad = false.obs;


  // getPrefData() async {
  //   userName!.value = await Preference().read(Const.prefName);
  //   userPhoneCode!.value = await Preference().read(Const.prefPhoneCode);
  //   userMobileNo!.value = await Preference().read(Const.prefPhone);
  //   userEmail!.value = await Preference().read(Const.prefEmail);
  //   userAddress!.value = await Preference().read(Const.prefAddress);
  //   userGender!.value = await Preference().read(Const.prefGender);
  //   userRole!.value = await Preference().read(Const.prefUserRoleName);
  //   userProfilePhoto!.value = await Preference().read(Const.prefUserProfileImage);
  //   userRoleid.value = await Preference().readInt(Const.prefUserRoleId);
  //
  //   debugPrint('getUserDataPref => userName : ${userName!.value}');
  //   debugPrint('getUserDataPref => userPhoneCode : ${userPhoneCode!.value}');
  //   debugPrint('getUserDataPref => userMobileNo : ${userMobileNo!.value}');
  //   debugPrint('getUserDataPref => userEmail : ${userEmail!.value}');
  //   debugPrint('getUserDataPref => userAddress : ${userAddress!.value}');
  //   debugPrint('getUserDataPref => userGender : ${userGender!.value}');
  //   debugPrint('getUserDataPref => userGenderID : ${userGenderID!.value}');
  //   debugPrint('getUserDataPref => userRole : ${userRole!.value}');
  //   debugPrint('getUserDataPref => userProfilePhoto : ${userProfilePhoto!.value}');
  //   debugPrint('getUserDataPref =>  userRoleid.value : ${userRoleid.value}');
  // }


  Future<GetProfileData?> getProfileData() async {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      ProgressDialogUtils.showProgressDialog(Get.context);
    });
    var apiToken = await Preference().read(Const.prefAPIToken);
    debugPrint('getProfileData => apiToken : $apiToken');
    Map<String, dynamic> queryRequest = {'':''};
    Map<String, String> headers = {"authorization": "Bearer $apiToken"};
    userPhoneCode!.value = await Preference().read(Const.prefPhoneCode);
    debugPrint('getUserDataPref => userPhoneCode : $userPhoneCode');
    ProfileProvider().callGetProfileList(queryRequest: queryRequest,headers: headers).then((getProfileValue) async {
      debugPrint('getProfileData => getProfileValue : $getProfileValue');
      final getProfileData = GetProfile.fromJson(getProfileValue);
      // getProfileList.value.clear();
      // getProfileList.value.add(getProfileData.getProfileData!);
      getProfileList.value = getProfileData.getProfileData!;
      if(getProfileList.value == null)
      {   isGetProfileDataLoad.value = true;  }
     try{
       debugPrint('getProfileData => id : ${getProfileList.value.id}');
       debugPrint('getProfileData => username : ${getProfileList.value.username}');
       debugPrint('getProfileData => email : ${getProfileList.value.email}');
       debugPrint('getProfileData => contactNumber : ${getProfileList.value.contactNumber}');
       debugPrint('getProfileData => address : ${getProfileList.value.address}');
       debugPrint('getProfileData => gender : ${getProfileList.value.gender}');
       debugPrint('getProfileData => driverPhoto : ${getProfileList.value.driverPhoto}');
       debugPrint('getProfileData => role : ${getProfileList.value.role}');
       debugPrint('getProfileData => getRole.id : ${getProfileList.value.getRole!.id}');
       debugPrint('getProfileData => getRole.name : ${getProfileList.value.getRole!.name}');
       debugPrint('getProfileData => driver_total_earning : ${getProfileList.value.driver_total_earning!}');

       await Preference().save(Const.prefUserProfileImage,getProfileList.value.driverPhoto);
       await Preference().save(Const.prefPhone,getProfileList.value.contactNumber);
       userName!.value = getProfileList.value.username!;
       userMobileNo!.value = getProfileList.value.contactNumber!;
       userEmail!.value = getProfileList.value.email!;
       userAddress!.value = getProfileList.value.address!;
       userRole!.value = getProfileList.value.getRole!.name!;
       userProfilePhoto!.value = getProfileList.value.driverPhoto!;
       driver_total_earning.value = getProfileList.value.driver_total_earning!;
       userRoleid.value=getProfileList.value.getRole!.id!;
       userFreeDelivery!.value = getProfileList.value.freeDelivery!;

       if(getProfileList.value.gender == Gender.male) {
         userGender!.value = Const.lblGenderMale;
         debugPrint('1 getProfileData => userGender!.value : ${userGender!.value}');
       }
       else if(getProfileList.value.gender == Gender.feMale) {
         userGender!.value = Const.lblGenderFemale;
         debugPrint('2 getProfileData => userGender!.value : ${userGender!.value}');
       }
       else {
         userGender!.value = '';//Const.lblGenderOther;
         debugPrint('3 getProfileData => userGender!.value : ${userGender!.value}');
       }
     }
      catch(e){
        debugPrint('getProfileData => ERROR : $e');
      }

      change(getProfileList, status: RxStatus.success());
      // Const().toast(getProfileData.message);
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        ProgressDialogUtils.hideProgressDialog();
      });
    }, onError: (error) {
      debugPrint('getProfileData ERROR : '+ error.toString());
      // Const().toast(error['message']);
      Const().toast(error.toString());
      // try{
      //   Const().toast(error['message']);
      // }catch(e){
      //   debugPrint('getProfileData => ERROR : '+ e.toString());
      // }
      ProgressDialogUtils.hideProgressDialog();
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        ProgressDialogUtils.hideProgressDialog();
      });
    });
    update();
  }

  submitWithdrawRequest() async{

      ProgressDialogUtils.showProgressDialog(Get.context);
      var apiToken = await Preference().read(Const.prefAPIToken);
      debugPrint('getProfileData => apiToken : $apiToken');

      Map<String, String> headers = {"authorization": "Bearer $apiToken"};
      Map<String, dynamic> queryRequest = {
        'amount' : driver_total_earning.value,
      };
      debugPrint('submitWithdrawRequest => queryRequest : $queryRequest');
      ProfileProvider().callWithdrawlRequest(queryRequest: queryRequest,headers: headers).then((withdrawResponse) {
        debugPrint('submitWithdrawRequest => withdrawResponse : $withdrawResponse');
        change(withdrawResponse, status: RxStatus.success());
        final withdrawApiResponse = Withdraw.fromJson(withdrawResponse);
        if(withdrawApiResponse.status==1){

          Const().toast(withdrawApiResponse.message);
          ProgressDialogUtils.hideProgressDialog();
          getProfileData();
        }else{
          Const().toast(withdrawApiResponse.message);
          ProgressDialogUtils.hideProgressDialog();
        }
      }, onError: (error) {
        change(null, status: RxStatus.error(error.toString()));
      });


  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // getPrefData();
    getProfileData();
    debugPrint(' =======> onInit <======= ');


  }


  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    getProfileData();
    debugPrint(' =======> onReady <======= ');


  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
