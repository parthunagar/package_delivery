import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:package_delivery/AppRoute/NavigationArgs.dart';
import 'package:package_delivery/AppRoute/app_route.dart';
import 'package:package_delivery/Constant/app_constant.dart';
import 'package:package_delivery/Constant/app_image.dart';
import 'package:package_delivery/Screen/applyCoupon/apply_coupon_model.dart';
import 'package:package_delivery/Screen/applyCoupon/apply_coupon_provider.dart';
import 'package:package_delivery/Screen/applyCoupon/couon_list_model.dart';
import 'package:package_delivery/Screen/payment/payment_model.dart';
import 'package:package_delivery/Screen/payment/payment_provider.dart';
import 'package:package_delivery/Screen/shipmentsummary/shipmentsummary_model.dart';
import 'package:package_delivery/Screen/shipmentsummary/shipmentsummary_provider.dart';
import 'package:package_delivery/Utils/preference.dart';
import 'package:package_delivery/widget/progress_dialog_utils.dart';

class ApplyCouponLogic extends GetxController with StateMixin<dynamic> {
  
  var shipmentId;
  TextEditingController? cCoupon = TextEditingController();
  RxDouble selectedIndex = (-1.0).obs;
  RxString? couponId = ''.obs;
  RxString? couponCode = ''.obs;

  Rx<RxList<CouponList>> couponList = RxList<CouponList>.empty().obs;
  RxBool isCouponDataLoad = false.obs;

  Future<CouponList?> getCouponListData() async {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      ProgressDialogUtils.showProgressDialog(Get.context);
    });
    var apiToken = await Preference().read(Const.prefAPIToken);
    var userId = await Preference().readInt(Const.prefUserId);
    debugPrint('getCouponListData => userId : $userId');
    debugPrint('getCouponListData => apiToken : $apiToken');
    // Map<String, dynamic> queryRequest = {'user_id':'$userId'};
    Map<String, dynamic> queryRequest = {'':''};
    Map<String, String> headers = {"authorization": "Bearer $apiToken"};
    ApplyCouponProvider().callCouponList(queryRequest: queryRequest,headers: headers).then((getCouponListValue) async {
      final getCouponListData = Coupon.fromJson(getCouponListValue);
      couponList.value.clear();
      if(getCouponListData.status == 1) {
        couponList.value.addAll(getCouponListData.couponList!);
      }
      if(couponList.value.isEmpty)
      {   isCouponDataLoad.value = true;  }
      change(couponList, status: RxStatus.success());
      // Const().toast(getDriverData. message);
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        ProgressDialogUtils.hideProgressDialog();
      });
      // debugPrint('getCouponListData => couponList : $couponList');
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

  Rx<ApplyCouponData> applyCouponList = ApplyCouponData().obs;
  RxBool? isApplyCouponLoad = false.obs;

  Future<ApplyCouponData?> setApplyCouponCode(String couponId) async {
    // WidgetsBinding.instance?.addPostFrameCallback((_) {
    //   ProgressDialogUtils.showProgressDialog(Get.context);
    // });
    isApplyCouponLoad!.value = true;
    var apiToken = await Preference().read(Const.prefAPIToken);
    // var userId = await Preference().readInt(Const.prefUserId);
    // debugPrint('setApplyCouponCode => userId : $userId');
    debugPrint('setApplyCouponCode => apiToken : $apiToken');
    // Map<String, dynamic> queryRequest = {'user_id':'$userId'};
    Map<String, dynamic> queryRequest = {'coupon_id': couponId,'shipment_id':'$shipmentId','coupon_code': couponCode!.value};
    Map<String, String> headers = {"authorization": "Bearer $apiToken"};
    ApplyCouponProvider().callApplyCoupon(queryRequest: queryRequest,headers: headers).then((getApplyCouponDataValue) async {
      final getApplyCouponData = ApplyCoupon.fromJson(getApplyCouponDataValue);
      isApplyCouponLoad!.value = false;

      if(getApplyCouponData.status == 0 ) {
        cCoupon!.clear();
        getCouponListData();
        debugPrint('setApplyCouponCode => message : ${getApplyCouponData.message}');
        Const().toast(getApplyCouponData.message.toString());
      }
      else{
        Const().toast(getApplyCouponData.message.toString());
        getCouponListData();
        cCoupon!.clear();
        debugPrint('setApplyCouponCode => message : ${getApplyCouponData.message}');
        applyCouponList.value = getApplyCouponData.applyCouponData!;
      }

      change(applyCouponList, status: RxStatus.success());
      debugPrint('setApplyCouponCode => applyCouponList : $applyCouponList');
    }, onError: (error) {
      debugPrint('setApplyCouponCode ERROR : '+ error.toString());
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
    try{
      debugPrint('onInit => shipmentId : ${Get.arguments[NavigationArgs.cShipmentId]}');
      shipmentId = Get.arguments[NavigationArgs.cShipmentId];

    }catch(e){
      debugPrint('onInit => ERROR : $e');
    }
    getCouponListData();
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
