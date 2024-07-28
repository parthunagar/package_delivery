import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_delivery/Constant/app_constant.dart';
import 'package:package_delivery/Screen/followed_list/follow_unfollow_model.dart';
import 'package:package_delivery/Screen/followed_list/followed_list_model.dart';
import 'package:package_delivery/Screen/followed_list/followed_list_provider.dart';
import 'package:package_delivery/Utils/preference.dart';
import 'package:package_delivery/widget/progress_dialog_utils.dart';

class FollowedListLogic extends GetxController with StateMixin<dynamic> {


  Rx<RxList<FollowedCompanyDatum>> followedCompanyList = RxList<FollowedCompanyDatum>.empty().obs;
  Rx<RxList<FollowUnfollowData>> followUnfollowList = RxList<FollowUnfollowData>.empty().obs;
  RxBool isFollowersListDataLoad = false.obs;

  var userId,apiToken;
 @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    apiToken = await Preference().read(Const.prefAPIToken);
    userId = await Preference().readInt(Const.prefUserId);
    debugPrint('onInit => apiToken : $apiToken');
    debugPrint('onInit => userId : $userId');
    getFollowersListData();
  }


  Future<FollowedCompanyDatum?> getFollowersListData() async {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      ProgressDialogUtils.showProgressDialog(Get.context);
    });

    // debugPrint('getDriverListData => userId : $userId');


    Map<String, dynamic> queryRequest = {'user_id':'$userId'};

    Map<String, String> headers = {"authorization": "Bearer $apiToken"};

    FollowedListProvider().callFollowedCompanyList(queryRequest: queryRequest,headers: headers).then((getFollowedCompanyListValue) async {
      debugPrint('getFollowersListData => getFollowedCompanyListValue : $getFollowedCompanyListValue');
      final getFollowedCompanyListData = FollowedCompany.fromJson(getFollowedCompanyListValue);
      if(getFollowedCompanyListData.status == 1) {
        followedCompanyList.value.clear();
        followedCompanyList.value.addAll(getFollowedCompanyListData.followedCompanyData!);
        if(followedCompanyList.value.isEmpty)
        {   isFollowersListDataLoad.value = true;  }
        try {
          debugPrint('getFollowersListData => followedCompanyList.value.isEmpty : ${followedCompanyList.value.isEmpty}');
          debugPrint('getFollowersListData => followedCompanyList.value.length : ${followedCompanyList.value.length}');
        }
        catch(e) {
          debugPrint('getFollowersListData => ERROR : $e');
        }
        change(followedCompanyList, status: RxStatus.success());
      }
      else{
        // debugPrint('getFollowersListData => followedCompanyList.value.isEmpty : ${followedCompanyList.value.isEmpty}');
        // Const().toast(getFollowedCompanyListData.message.toString());
        isFollowersListDataLoad.value = true;
      }


      // Const().toast(getFollowedCompanyListData.message);
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        ProgressDialogUtils.hideProgressDialog();
      });
    }, onError: (error) {
      debugPrint('getFollowersListData ERROR : '+ error.toString());
      // Const().toast(error['message']);
      Const().toast(error.toString());
      ProgressDialogUtils.hideProgressDialog();
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        ProgressDialogUtils.hideProgressDialog();
      });
    });
    update();
  }

  Future<FollowUnfollowData?> getFollowUnfollowListData(int isCompanyFollow,int companyId,String driverCustomerId) async {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      ProgressDialogUtils.showProgressDialog(Get.context);
    });
    var apiToken = await Preference().read(Const.prefAPIToken);
    // debugPrint('getDriverListData => userId : $userId');
    debugPrint('getDriverListData => apiToken : $apiToken');
    Map<String, dynamic> queryRequest = {'user_id' : companyId,'is_company_follow' : '$isCompanyFollow','customer_driver_id' :driverCustomerId };
    // Map<String, dynamic> queryRequest = {'user_id' : '98','is_company_follow' : '$isCompanyFollow'};
    // Map<String, dynamic> queryRequest = {'user_id':'26'};
    Map<String, String> headers = {"authorization": "Bearer $apiToken"};

    FollowedListProvider().callFollowUnfollowList(queryRequest: queryRequest,headers: headers).then((getFollowUnfollowValue) async {
      final getFollowUnfollowData = FollowUnfollow.fromJson(getFollowUnfollowValue);
      followUnfollowList.value.clear();
      followUnfollowList.value.add(getFollowUnfollowData.followUnfollowData!);
      if(followUnfollowList.value.isEmpty)
      {   isFollowersListDataLoad.value = true;  }
      change(followUnfollowList, status: RxStatus.success());
      Const().toast(getFollowUnfollowData.message);
      getFollowersListData();
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        ProgressDialogUtils.hideProgressDialog();
      });
    }, onError: (error) {
      debugPrint('getProfileData ERROR : '+ error.toString());
      // Const().toast(error['message']);
      Const().toast(error.toString());
      ProgressDialogUtils.hideProgressDialog();
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        ProgressDialogUtils.hideProgressDialog();
      });
    });
    update();
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
