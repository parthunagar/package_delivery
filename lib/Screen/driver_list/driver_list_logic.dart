import 'package:get/get.dart';
import 'package:package_delivery/Constant/app_constant.dart';
import 'package:package_delivery/Screen/driver_list/driver_list_model.dart';
import 'package:flutter/material.dart';
import 'package:package_delivery/Screen/driver_list/driver_list_provider.dart';
import 'package:package_delivery/Utils/preference.dart';
import 'package:package_delivery/widget/progress_dialog_utils.dart';

class DriverListLogic extends GetxController with StateMixin<dynamic>{

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getDriverListData();
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


  Rx<RxList<DriverDatum>> driverList = RxList<DriverDatum>.empty().obs;
  RxBool isDriverDataLoad = false.obs;

  Future<DriverDatum?> getDriverListData() async {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      ProgressDialogUtils.showProgressDialog(Get.context);
    });
    var apiToken = await Preference().read(Const.prefAPIToken);
    var userId = await Preference().readInt(Const.prefUserId);
    debugPrint('getDriverListData => userId : $userId');
    debugPrint('getDriverListData => apiToken : $apiToken');
    Map<String, dynamic> queryRequest = {'user_id':'$userId'};
    // Map<String, dynamic> queryRequest = {'user_id':'26'};
    Map<String, String> headers = {"authorization": "Bearer $apiToken"};

    DriverListProvider().callDriverList(queryRequest: queryRequest,headers: headers).then((getDriverValue) async {
      final getDriverData = Driver.fromJson(getDriverValue);
      driverList.value.clear();
      if(getDriverData.status == 1) {
        driverList.value.addAll(getDriverData.driverDatum!);
      }
      if(driverList.value.isEmpty)
      {   isDriverDataLoad.value = true;  }
      change(driverList, status: RxStatus.success());
      // Const().toast(getDriverData. message);
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
}
