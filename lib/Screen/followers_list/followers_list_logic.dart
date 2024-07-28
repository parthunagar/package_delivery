import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:package_delivery/Constant/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:package_delivery/Screen/followers_list/follow_unfollow_company_model.dart';
import 'package:package_delivery/Screen/followers_list/followers_list_model.dart';
import 'package:package_delivery/Screen/followers_list/followers_list_provider.dart';
import 'package:package_delivery/Utils/preference.dart';
import 'package:package_delivery/widget/progress_dialog_utils.dart';

class FollowersListLogic extends GetxController with StateMixin<dynamic> {

  Rx<RxList<FollowsDatum>> followersList = RxList<FollowsDatum>.empty().obs;
  Rx<RxList<FollowUnfollowData>> followUnfollowList = RxList<FollowUnfollowData>.empty().obs;
  RxBool isFollowersListDataLoad = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getFollowersListData();
  }

  Future<FollowsDatum?> getFollowersListData() async {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      ProgressDialogUtils.showProgressDialog(Get.context);
    });
    var apiToken = await Preference().read(Const.prefAPIToken);
    debugPrint('getDriverListData => apiToken : $apiToken');
    Map<String, dynamic> queryRequest = {'':''};
    Map<String, String> headers = {"authorization": "Bearer $apiToken"};

    FollowersListProvider().callFollowerList(queryRequest: queryRequest,headers: headers).then((getFollowersListValue) async {
      final getFollowersListData = Follows.fromJson(getFollowersListValue);
      followersList.value.clear();
      followersList.value.addAll(getFollowersListData.followsDatum!);
      if(followersList.value.isEmpty)
      {   isFollowersListDataLoad.value = true;  }
      change(followersList, status: RxStatus.success());
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


  Future<FollowUnfollowData?> getFollowUnfollowListData(int isCompanyFollow, String id) async {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      ProgressDialogUtils.showProgressDialog(Get.context);
    });
    var apiToken = await Preference().read(Const.prefAPIToken);
    var userId = await Preference().readInt(Const.prefUserId);
    debugPrint('getDriverListData => userId : $userId');
    debugPrint('getDriverListData => apiToken : $apiToken');
    Map<String, dynamic> queryRequest = {'user_id' : '$userId','is_company_follow' : '$isCompanyFollow','customer_driver_id' : '$id'};
    // Map<String, dynamic> queryRequest = {'user_id' : '98','is_company_follow' : '$isCompanyFollow'};
    // Map<String, dynamic> queryRequest = {'user_id':'26'};
    Map<String, String> headers = {"authorization": "Bearer $apiToken"};

    FollowersListProvider().callFollowUnfollowList(queryRequest: queryRequest,headers: headers).then((getFollowUnfollowValue) async {
      final getFollowUnfollowData = FollowUnfollow.fromJson(getFollowUnfollowValue);
      followUnfollowList.value.clear();
      followUnfollowList.value.add(getFollowUnfollowData.data!);
      if(followUnfollowList.value.isEmpty)
      {   isFollowersListDataLoad.value = true;  }
      change(followersList, status: RxStatus.success());
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
