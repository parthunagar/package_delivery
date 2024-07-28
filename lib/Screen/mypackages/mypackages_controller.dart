import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_delivery/Constant/app_constant.dart';
import 'package:package_delivery/Screen/mypackages/mypackages_provider.dart';
import 'package:package_delivery/Screen/mypackages/shipment_list_model.dart';
import 'package:package_delivery/Utils/preference.dart';
import 'package:package_delivery/widget/progress_dialog_utils.dart';

class MyPackagesLogic extends GetxController with StateMixin<dynamic> {
  Rx<RxList<ShipmentItem>> shipmentItemList = RxList<ShipmentItem>.empty().obs;
  TextEditingController? cTrackId = TextEditingController();
  RxBool isShipmentItemLoad = false.obs;
  RxBool isShipmentItemLoadIsAllpaid = false.obs;
  var userId,userToken;
  RxInt userRoleid = 0.obs;


  @override
  void onInit() async{
    // TODO: implement onInit
    userId = await Preference().readInt(Const.prefUserId);
    userToken = await Preference().read(Const.prefAPIToken);
    userRoleid.value = await Preference().readInt(Const.prefUserRoleId);
    callShipmentList();
    super.onInit();
  }

  callShipmentList({String? trackId}) async {
    ProgressDialogUtils.showProgressDialog(Get.context);
    // print('otp.value : ' + trackId!);
    debugPrint('callShipmentList => tracking_id : $trackId');
    debugPrint('callShipmentList => user_id : $userId');
    debugPrint('callShipmentList => userToken : $userToken');
    Map<String, dynamic> queryRequest = {
      'tracking_id': trackId,
      'user_id': userId,
    };
    Map<String, String> headers = {"authorization": "Bearer $userToken"};
    //   // Get.toNamed(AppRoutes.driverVerification);
    MyPackageProvider().callShowShipment(queryRequest: queryRequest,headers: headers).then((shipmentList) {
      debugPrint('callShipmentList => shipmentList : $shipmentList');

      if(shipmentList['status'] != 0){
        final shipmentListData = ShipmentList.fromJson(shipmentList);
        debugPrint('callShipmentList => shipmentListData : ${shipmentListData.shipmentItem![0].shipmentStatus}');
        shipmentItemList.value.clear();
        // for(var item in shipmentListData.shipmentItem!){
        for(int i = 0 ; i < shipmentListData.shipmentItem!.length ; i++) {
          debugPrint('item.payment_status == ShipmentPaymantStatus.paid : ${shipmentListData.shipmentItem![i].payment_status} = ${ShipmentPaymantStatus.paid}');
          if(userRoleid.value == UserRoles.customer) {
            shipmentItemList.value.add(shipmentListData.shipmentItem![i]);
          }
          else{
            if(shipmentListData.shipmentItem![i].payment_status == ShipmentPaymantStatus.paid){
              debugPrint('item.payment_status == ShipmentPaymantStatus.paid : ${shipmentListData.shipmentItem![i].payment_status} = ${ShipmentPaymantStatus.paid}');
              shipmentItemList.value.add(shipmentListData.shipmentItem![i]);
            }
            else {
              debugPrint('item.payment_status != ShipmentPaymantStatus.paid');
            }
          }

        }
        debugPrint('callShipmentList => shipmentItemList.value : ${shipmentItemList.value}');
      }
      debugPrint('callShipmentList => shipmentItemList.value.isEmpty : ${shipmentItemList.value.isEmpty}');
      if(shipmentItemList.value.isEmpty)
      {   isShipmentItemLoad.value = true;  }
      else {
        isShipmentItemLoad.value = false;
      }
      cTrackId!.clear();
      change(shipmentList, status: RxStatus.success());
      // Const().toast(shipmentListData.message);
      ProgressDialogUtils.hideProgressDialog();
      // Get.offAllNamed(AppRoutes.signInScreen);
    }, onError: (error) {
      debugPrint('callShipmentList => ERROR : '+ error.toString());
      // Const().toast(error['message']);
      Const().toast(error.toString());
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
