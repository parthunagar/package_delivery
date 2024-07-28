import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:package_delivery/Constant/app_constant.dart';
import 'package:package_delivery/Screen/statusofitem/shipment_status_model.dart';
import 'package:package_delivery/Screen/statusofitem/statusof_item_model.dart';
import 'package:package_delivery/Screen/statusofitem/statusofitem_provider.dart';
import 'package:package_delivery/Utils/preference.dart';
import 'package:package_delivery/widget/progress_dialog_utils.dart';

class StatusofItemLogic extends GetxController  with GetSingleTickerProviderStateMixin  {
  
  final List<Tab> myTabs = <Tab>[
    const Tab(text: 'InProgress'),
    const Tab(text: 'Packed'),
    const Tab(text: 'Delivered'),
  ];

  late TabController tabController;
  var userId,userToken;
  Rx<RxList<ShipmentItem>> pendingShipmentItemList = RxList<ShipmentItem>.empty().obs;
  RxBool isShipmentItemLoad = false.obs;

  final Rx<ImagePicker> picker = ImagePicker().obs as Rx<ImagePicker>;

  Rx<File>? image1 = File('').obs;

   @override
  void onInit() async {
    tabController = TabController(vsync: this, length: myTabs.length);
    tabController.addListener(() {
      if(tabController.index == 0 ){
        print('tabController 0 : ${tabController.index}');

        callShipmentList(shipment_status : PackageDeliveryStatus.InProgress);
      }else if(tabController.index == 1){
        print('tabController 1 : ${tabController.index}');

        callShipmentList(shipment_status : PackageDeliveryStatus.Packed);
      }else{
        print('tabController 2 : ${tabController.index}');

        callShipmentList(shipment_status : PackageDeliveryStatus.Delivered);
      }
    });
    userId = await Preference().readInt(Const.prefUserId);
    userToken = await Preference().read(Const.prefAPIToken);
    callShipmentList(shipment_status : PackageDeliveryStatus.InProgress);
    super.onInit();
  }

   void onTabChange(int index){
     print('int index : ' + index.toString());
     if(index == 0 ){
       callShipmentList(shipment_status : PackageDeliveryStatus.InProgress);
     }else if(index == 1){
       callShipmentList(shipment_status : PackageDeliveryStatus.Packed);
     }else{
       callShipmentList(shipment_status : PackageDeliveryStatus.Delivered);
     }

   }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  callShipmentList({int? shipment_status}) async {
    ProgressDialogUtils.showProgressDialog(Get.context);
    // print('otp.value : ' + trackId!);
    print('otp.value : ' + shipment_status.toString());
    Map<String, dynamic> queryRequest = {
      'shipment_status': shipment_status
    };
    Map<String, String> headers = {"authorization": "Bearer $userToken"};
    //   // Get.toNamed(AppRoutes.driverVerification);
    StatusOfItemProvider().callListOfFilteredShipment(queryRequest: queryRequest,headers: headers).then((shipmentList) async{
      debugPrint('callListOfFilteredShipment : '+ shipmentList.toString());
      final shipmentListData = StatusOfItem.fromJson(shipmentList);
      pendingShipmentItemList.value.clear();
      if(shipmentListData.status !=0){
        pendingShipmentItemList.value.addAll(shipmentListData.shipmentItem!);
      }
      if(pendingShipmentItemList.value.isEmpty)
      {   isShipmentItemLoad.value = true;  }
      else {
        isShipmentItemLoad.value = false;
      }
      // change(shipmentList, status: RxStatus.success());
      // Const().toast(shipmentListData.message);
      ProgressDialogUtils.hideProgressDialog();
      // Get.offAllNamed(AppRoutes.signInScreen);
    }, onError: (error) {
      debugPrint('callShipmentList => ERROR : '+ error.toString());
      // Const().toast(error['message']);
      // Const().toast(error.toString());
      ProgressDialogUtils.hideProgressDialog();
      // change(null, status: RxStatus.error(error.toString()));
    });

  }

  callShipmentStatusChange({int? shipmentId ,int? status_to_change,int? shipment_status}){
    ProgressDialogUtils.showProgressDialog(Get.context);
    // print('otp.value : ' + trackId!);
    Map<String, dynamic> queryRequest = {
      'shipment_id': shipmentId,
      'shipment_status': status_to_change
    };
    Map<String, String> headers = {"authorization": "Bearer $userToken"};
    StatusOfItemProvider().callChangeShipmentStatus(queryRequest: queryRequest,headers: headers).then((shipmentStatusResponse) {
      debugPrint('callListOfFilteredShipment : '+ shipmentStatusResponse.toString());
      final statusOfShipment = ShipmentStatus.fromJson(shipmentStatusResponse);
      if (statusOfShipment.status == 1) {
        // Const().toast(statusOfShipment.message);
        ProgressDialogUtils.hideProgressDialog();
        callShipmentList(shipment_status : shipment_status);
      } else {
        // Const().toast(statusOfShipment.message);
        ProgressDialogUtils.hideProgressDialog();
      }
    });
  }


  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }
}
