import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_delivery/Constant/app_constant.dart';
import 'package:package_delivery/Screen/rate_and_review_list/rate_and_review_model.dart';
import 'package:package_delivery/Screen/rate_and_review_list/rate_and_review_provider.dart';
import 'package:package_delivery/Screen/select_dispatcher/familiar_faces_list_model.dart';
import 'package:package_delivery/Utils/preference.dart';
import 'package:package_delivery/widget/progress_dialog_utils.dart';

class RateReviewListLogic extends GetxController with StateMixin<dynamic>  {

  var userId,userToken;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getRateReviewListData();
  }

  Rx<RateReviewData> rateReviewList = RateReviewData().obs;
  RxBool isRateReviewDataLoad = false.obs;

  Future<RateReviewData?> getRateReviewListData() async {
    ProgressDialogUtils.showProgressDialog(Get.context);
    userId = await Preference().readInt(Const.prefUserId);
    userToken = await Preference().read(Const.prefAPIToken);
    debugPrint('getRateReviewListData => userId : ${userId.toString()}');
    debugPrint('getRateReviewListData => userToken : ${userToken.toString()}');
    Map<String, dynamic> queryRequest = {'user_id': userId};
    Map<String, String> headers = {"authorization": "Bearer $userToken"};
    RateReviewListProvider().callRateReviewList(queryRequest: queryRequest,headers: headers).then((rateReviewListVal) {
      // debugPrint('getFamiliarFacesListData => rateReviewListVal : '+ rateReviewListVal.toString());
      final rateReviewListData = RateReview.fromJson(rateReviewListVal);
      // rateReviewList.value.clear();
      if(rateReviewListData.data != null) {
        rateReviewList.value = rateReviewListData.data!;
        isRateReviewDataLoad.value = false;
      }else if(rateReviewListData.status==0){
        isRateReviewDataLoad.value = true;
      }else{
        isRateReviewDataLoad.value = false;
      }

      change(rateReviewList, status: RxStatus.success());
      ProgressDialogUtils.hideProgressDialog();
    }, onError: (error) {
      debugPrint('getCompanyListData ERROR : '+ error.toString());
      ProgressDialogUtils.hideProgressDialog();
      change(null, status: RxStatus.error(error.toString()));
    });
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
