import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_delivery/Constant/app_constant.dart';
import 'package:package_delivery/Screen/coupon_history_list/coupon_history_list_model.dart';
import 'package:package_delivery/Screen/coupon_history_list/coupon_history_list_provider.dart';
import 'package:package_delivery/Screen/notification_list/notification_list_model.dart';
import 'package:package_delivery/Screen/notification_list/notification_list_provider.dart';
import 'package:package_delivery/Utils/preference.dart';
import 'package:package_delivery/widget/progress_dialog_utils.dart';

class CouponHistoryListLogic extends GetxController with StateMixin<dynamic> {


  Rx<RxList<CouponHistoryDatum>> couponHistoryList = RxList<CouponHistoryDatum>.empty().obs;
  RxBool isCouponHistoryDataLoad = false.obs;

  Future<CouponHistoryDatum?> getHistoryData() async {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      ProgressDialogUtils.showProgressDialog(Get.context);
    });
    var apiToken = await Preference().read(Const.prefAPIToken);
    // var userId = await Preference().readInt(Const.prefUserId);
    // debugPrint('getCouponListData => userId : $userId');
    debugPrint('getHistoryData => apiToken : $apiToken');
    // Map<String, dynamic> queryRequest = {'user_id':'$userId'};
    Map<String, dynamic> queryRequest = {'':''};
    Map<String, String> headers = {"authorization": "Bearer $apiToken"};
    CouponHistoryListProvider().callCouponHistoryList(queryRequest: queryRequest,headers: headers).then((getCouponHistoryListValue) async {
      final getCouponHistoryListData = CouponHistory.fromJson(getCouponHistoryListValue);
      couponHistoryList.value.clear();
      if(getCouponHistoryListData.status == 1) {
        couponHistoryList.value.addAll(getCouponHistoryListData.couponHistoryData!);
        debugPrint('getHistoryData => couponHistoryList : ${couponHistoryList.value.length}');
      }
      if(couponHistoryList.value.isEmpty)
      {   isCouponHistoryDataLoad.value = true;  }
      change(couponHistoryList, status: RxStatus.success());
      // Const().toast(getDriverData. message);
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        ProgressDialogUtils.hideProgressDialog();
      });
      // debugPrint('getCouponListData => couponList : $couponList');
    }, onError: (error) {
      debugPrint('getHistoryData ERROR : '+ error.toString());
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
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    getHistoryData();
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
