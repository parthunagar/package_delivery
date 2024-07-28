import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:package_delivery/AppRoute/app_route.dart';
import 'package:package_delivery/Constant/app_constant.dart';
import 'package:package_delivery/Screen/select_dispatcher/familiar_faces_list_model.dart';
import 'package:package_delivery/Screen/select_dispatcher/follow_unfollow_company_model.dart';
import 'package:package_delivery/Screen/select_dispatcher/select_dispatcher_provider.dart';
import 'package:package_delivery/Screen/select_dispatcher/shipping_company_model.dart';
import 'package:package_delivery/Screen/select_dispatcher/top_suggestion_list_model.dart';
import 'package:package_delivery/Utils/preference.dart';
import 'package:package_delivery/widget/progress_dialog_utils.dart';
import 'package:package_delivery/AppRoute/NavigationArgs.dart';
import 'package:package_delivery/Constant/app_constant.dart';
import 'package:package_delivery/Screen/select_dispatcher/add_shipment_model.dart';
import 'package:package_delivery/Screen/select_dispatcher/select_dispatcher_provider.dart';
import 'package:package_delivery/Screen/select_dispatcher/shipment_image_model.dart';
import 'package:package_delivery/Screen/select_dispatcher/shipment_imageupload_provider.dart';
import 'package:package_delivery/Utils/preference.dart';
import 'package:package_delivery/widget/progress_dialog_utils.dart';

class SelectDispatcherLogic extends GetxController with StateMixin<dynamic> {

  ///PU
  var userId,userToken;
  ///Search Company
  ///SIGNUP
  TextEditingController? cSearch = TextEditingController();

  Rx<File>? image1 = File('').obs;
  String? cPackageName, cReceiverName, cReceiverPhone, cPackageWeight, cPackageDetail;
  LatLng? picupLatLang, destinationLatLang;
  String? deliveryType, modeOfTransport ,cPickupLocationAddress,cDestinationLocationAddress;
  int? packageSize;

  Rx<RxList<ShippingCompanyDatum>> companyList = RxList<ShippingCompanyDatum>.empty().obs;
  RxBool isCompanyDataLoad = false.obs;

  Rx<RxList<TopSuggestionDatum>> topSuggestionList = RxList<TopSuggestionDatum>.empty().obs;
  RxBool isTopSuggestionDataLoad = false.obs;

  Rx<RxList<FamiliarFacesDatum>> familyFacesList = RxList<FamiliarFacesDatum>.empty().obs;
  RxBool isFamiliarFacesDataLoad = false.obs;

  Rx<RxList<FollowUnfollowData>> followUnfollowList = RxList<FollowUnfollowData>.empty().obs;
  RxBool isFollowUnFollowDataLoad = false.obs;

  ///PU
  Future<TopSuggestionDatum?> getTopSuggestionListData(var currentLatitude, var currentLongitude ) async {
    ProgressDialogUtils.showProgressDialog(Get.context);
    Map<String, dynamic> queryRequest = {
      'current_latitude': currentLatitude,
      'current_longitude': currentLongitude
    };
    Map<String, String> headers = {"authorization": "Bearer $userToken"};
    debugPrint('getTopSuggestionListData => queryRequest : $queryRequest');
    SelectDispatcherProvider().callTopSuggestionDriverList(queryRequest: queryRequest,headers: headers).then((topSuggestionListVal) async{
      // debugPrint('getTopSuggestionListData => topSuggestionListVal : '+ topSuggestionListVal.toString());
      final topSuggestionData = TopSuggestion.fromJson(topSuggestionListVal);
      topSuggestionList.value.clear();
      if(topSuggestionData.topSuggestionData != null) {
        topSuggestionList.value.addAll(topSuggestionData.topSuggestionData!);
      }
        if(topSuggestionList.value.isEmpty)
        {   isTopSuggestionDataLoad.value = true;  }
        else{
          isTopSuggestionDataLoad.value = false;
        }
        change(topSuggestionList, status: RxStatus.success());
        // Const().toast(topSuggestionData.message);
        ProgressDialogUtils.hideProgressDialog();
      // Get.offAllNamed(AppRoutes.signInScreen);
    }, onError: (error) {
      debugPrint('getTopSuggestionListData ERROR : '+ error.toString());
      // Const().toast(error.toString());
      ProgressDialogUtils.hideProgressDialog();
      change(null, status: RxStatus.error(error.toString()));
    });
    // debugPrint('getTopSuggestionListData => topSuggestionList : ${topSuggestionList.toString()}');
    // debugPrint('getTopSuggestionListData => topSuggestionList.length : ${topSuggestionList.value.length.toString()}');
    // debugPrint('getTopSuggestionListData => topSuggestionList.length : ${topSuggestionList.value.isEmpty.toString()}');

  }

  ///PU
  Future<FamiliarFacesDatum?> getFamiliarFacesListData(var currentLatitude, var currentLongitude) async {
    ProgressDialogUtils.showProgressDialog(Get.context);
    Map<String, dynamic> queryRequest = {
      'current_latitude': currentLatitude,
      'current_longitude': currentLongitude
    };
    Map<String, String> headers = {"authorization": "Bearer $userToken"};
    SelectDispatcherProvider().callFamiliarFacesDriverList(queryRequest: queryRequest,headers: headers).then((familiarFacesList) async{
      // debugPrint('getFamiliarFacesListData => familiarFacesList : '+ familiarFacesList.toString());
      final familiarFacesListData = FamiliarFaces.fromJson(familiarFacesList);
      familyFacesList.value.clear();
      if(familiarFacesListData.familiarFacesData != null){
        familyFacesList.value.addAll(familiarFacesListData.familiarFacesData!);
      }
      if(familyFacesList.value.isEmpty)
      {   isFamiliarFacesDataLoad.value = true;  }
      else{
        isFamiliarFacesDataLoad.value = false;
      }
      change(familyFacesList, status: RxStatus.success());
      // Const().toast(familiarFacesListData.message);
      ProgressDialogUtils.hideProgressDialog();

      // Get.offAllNamed(AppRoutes.signInScreen);
    }, onError: (error) {
      debugPrint('getCompanyListData ERROR : '+ error.toString());
      // Const().toast(error['message']);
      ProgressDialogUtils.hideProgressDialog();
      change(null, status: RxStatus.error(error.toString()));
    });
    // debugPrint('getFamiliarFacesListData => familyFacesList : $familyFacesList');
    // debugPrint('getFamiliarFacesListData => familyFacesList.length : ${familyFacesList.value.length}');
    // debugPrint('getFamiliarFacesListData => familyFacesList.length : ${familyFacesList.value.isEmpty}');
    // if(companyList.value.isNotEmpty) {
    //   debugPrint('getFamiliarFacesListData => familyFacesList.length : ${familyFacesList.value[0].username}');
    // }
  }


  ///PU
  Future<ShippingCompanyDatum?> getCompanyListData(String companyName) async {
    ProgressDialogUtils.showProgressDialog(Get.context);
    Map<String, dynamic> queryRequest = {'company_name': companyName};
    Map<String, String> headers = {"authorization": "Bearer $userToken"};
    SelectDispatcherProvider().callCompanyList(queryRequest: queryRequest,headers: headers).then((shipmentList) async{
      // debugPrint('getCompanyListData => shipmentList: '+ shipmentList.toString());
      final companyListData = ShippingCompany.fromJson(shipmentList);
      companyList.value.clear();
      companyList.value.addAll(companyListData.shippingCompanyData!);
      if(companyList.value.isEmpty)
      {   isCompanyDataLoad.value = true;  }
      else{
        isCompanyDataLoad.value = false;
      }
      change(shipmentList, status: RxStatus.success());
      // Const().toast(companyListData.message);
      ProgressDialogUtils.hideProgressDialog();
      // Get.offAllNamed(AppRoutes.signInScreen);
    }, onError: (error) {
      debugPrint('getCompanyListData ERROR : '+ error.toString());
      // Const().toast(error['message']);
      ProgressDialogUtils.hideProgressDialog();
      change(null, status: RxStatus.error(error.toString()));
    });
  }


  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    ///PU
    userId = await Preference().readInt(Const.prefUserId);
    userToken = await Preference().read(Const.prefAPIToken);
    debugPrint('onInit => userId : ${userId.toString()}');
    debugPrint('onInit => userToken : ${userToken.toString()}');
    getCompanyListData('');
    getTopSuggestionListData(50.15,87.33);
    getFamiliarFacesListData(50.15,87.33);
  }

  @override
  void onReady() async {
    // TODO: implement onReady
    image1 = await Get.arguments[NavigationArgs.imageUpload];
    debugPrint('NavigationArgs.imageUpload : '   +    image1!.value.path);
    debugPrint('NavigationArgs.cPackageName : '  +   Get.arguments[NavigationArgs.cPackageName]);
    debugPrint('NavigationArgs.cReceiverName : ' +  Get.arguments[NavigationArgs.cReceiverName]);
    print('NavigationArgs.cReceiverPhone : '+ Get.arguments[NavigationArgs.cReceiverPhone]);
    print('NavigationArgs.cPackageWeight : '+ Get.arguments[NavigationArgs.cPackageWeight].toString());
    print('NavigationArgs.cPackageDetail : '+ Get.arguments[NavigationArgs.cPackageDetail]);
    print('NavigationArgs.cPickupLocation      : '  +   Get.arguments[NavigationArgs.cPickupLocation].toString());
    print('NavigationArgs.cDestinationLocation : ' +    Get.arguments[NavigationArgs.cDestinationLocation].toString());
    print('NavigationArgs.cDeliveryType        : '+     Get.arguments[NavigationArgs.cDeliveryType].toString());
    print('NavigationArgs.cPackageSize        : '+     Get.arguments[NavigationArgs.cPackageSize].toString());
    print('NavigationArgs.cModeOfTransport     : '+     Get.arguments[NavigationArgs.cModeOfTransport].toString());
    picupLatLang       = Get.arguments[NavigationArgs.cPickupLocation];
    destinationLatLang = Get.arguments[NavigationArgs.cDestinationLocation];
    cPickupLocationAddress = Get.arguments[NavigationArgs.cPickupLocationAddress];
    cDestinationLocationAddress = Get.arguments[NavigationArgs.cDestinationLocationAddress];
    deliveryType       = Get.arguments[NavigationArgs.cDeliveryType];
    packageSize       = Get.arguments[NavigationArgs.cPackageSize];
    modeOfTransport    = Get.arguments[NavigationArgs.cModeOfTransport];
    cPackageName   =    Get.arguments[NavigationArgs.cPackageName];
    cReceiverName  =   Get.arguments[NavigationArgs.cReceiverName];
    cReceiverPhone =  Get.arguments[NavigationArgs.cReceiverPhone];
    cPackageWeight =  Get.arguments[NavigationArgs.cPackageWeight].toString();
    cPackageDetail =  Get.arguments[NavigationArgs.cPackageDetail];
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  /// PS createShipment
  callCreateShipment(int driverId) async {
    ProgressDialogUtils.showProgressDialog(Get.context);

    debugPrint('picupLatLang!.latitude : ${picupLatLang!.latitude.toString()}');
    debugPrint('picupLatLang!.longitude : ${picupLatLang!.longitude.toString()}');
    debugPrint('destinationLatLang!.latitude : ${destinationLatLang!.latitude.toString()}');
    debugPrint('destinationLatLang!.longitude : ${destinationLatLang!.longitude.toString()}');
    debugPrint('cPickupLocationAddress : ${cPickupLocationAddress.toString()}');
    debugPrint('cDestinationLocationAddress : ${cDestinationLocationAddress.toString()}');
    debugPrint('deliveryType : ${deliveryType.toString()}');
    debugPrint('modeOfTransport : ${modeOfTransport.toString()}');
    debugPrint('cPackageName : ${cPackageName.toString()}');
    debugPrint('cReceiverName : ${cReceiverName.toString()}');
    debugPrint('cReceiverPhone : ${cReceiverPhone.toString()}');
    debugPrint('packageSize : ${packageSize.toString()}');
    debugPrint('cPackageDetail : ${cPackageDetail.toString()}');
    debugPrint('driverId : ${driverId.toString()}');




    // print('otp.value : ' + trackId!);
    Map<String, dynamic> queryRequest = {
      'pickup_lat': '${picupLatLang!.latitude}',
      'pickup_long': '${picupLatLang!.longitude}',
      'destination_lat': '${destinationLatLang!.latitude}',
      'destination_log': '${destinationLatLang!.longitude}',
      'pickup_address' : cPickupLocationAddress,
      'delivery_address' : cDestinationLocationAddress,
      'delivery_type': deliveryType,
      'transport_type': modeOfTransport,
      'sending_details': cPackageName,
      'receiver_name': cReceiverName,
      'receiver_phone_number': cReceiverPhone,
      // 'package_weight': cPackageWeight,
      'package_id': packageSize,
      'additional_details': cPackageDetail,
      'driver_id': driverId.toString(),
    };
    Map<String, String> headers = {"authorization": "Bearer $userToken"};
    //   // Get.toNamed(AppRoutes.driverVerification);
    SelectDispatcherProvider()
        .callCraeteShipmentApi(queryRequest: queryRequest, headers: headers)
        .then((createShipmentResponse) async {
      debugPrint('callCreateShipment => createShipmentResponse : ' + createShipmentResponse.toString());
      final shipmentData =  AddShipment.fromJson(createShipmentResponse);
      debugPrint('callCreateShipment => shipmentData : ' + shipmentData.data!.shipmentId.toString());
      change(createShipmentResponse, status: RxStatus.success());
      // Const().toast(shipmentData.message);
      ProgressDialogUtils.hideProgressDialog();
      callShipmentImageUpload(shipmentData.data!.shipmentId!);
      // Get.offAllNamed(AppRoutes.signInScreen);
    }, onError: (error) {
      debugPrint('callCreateShipment =>  error : ' + error.toString());
      Const().toast(error.toString());
      ProgressDialogUtils.hideProgressDialog();
      change(null, status: RxStatus.error(error.toString()));
    });
  }

  /// PS Image Upload
  callShipmentImageUpload(int shipmentId) {
    ProgressDialogUtils.showProgressDialog(Get.context);

    Map<String, String> headers = {"authorization": "Bearer $userToken"};

    ShipmentImageUploadProvider().callShipmentImageApi(
            shipment_id: shipmentId.toString(), shipmentImage: image1, headers: headers).then((createShipmentImageResponse) async {
      debugPrint('registerApi 112: ' + createShipmentImageResponse.toString());

    final shipmentImage = ShipmentImage.fromJson(createShipmentImageResponse);

      change(createShipmentImageResponse, status: RxStatus.success());
      // Const().toast(shipmentImage.message);
      ProgressDialogUtils.hideProgressDialog();
      // callShipmentImageUpload();
      Get.toNamed(AppRoutes.applyCouponScreen, arguments: {
        NavigationArgs.cShipmentId :   shipmentId,
      });
    }, onError: (error) {
      debugPrint('registerApi 112: ' + error.toString());
      // Const().toast(error['message']);
      Const().toast(error.toString());
      ProgressDialogUtils.hideProgressDialog();
      change(null, status: RxStatus.error(error.toString()));
    });
  }



  Future<FollowUnfollowData?> getFollowUnfollowListData(int isCompanyFollow,int companyId,String id) async {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      ProgressDialogUtils.showProgressDialog(Get.context);
    });
    var apiToken = await Preference().read(Const.prefAPIToken);
    // debugPrint('getDriverListData => userId : $userId');
    debugPrint('getDriverListData => apiToken : $apiToken');
    Map<String, dynamic> queryRequest = {'user_id' : companyId,'is_company_follow' : '$isCompanyFollow','customer_driver_id' : id };
    // Map<String, dynamic> queryRequest = {'user_id' : '98','is_company_follow' : '$isCompanyFollow'};
    // Map<String, dynamic> queryRequest = {'user_id':'26'};
    Map<String, String> headers = {"authorization": "Bearer $apiToken"};

    SelectDispatcherProvider().callFollowUnfollowList(queryRequest: queryRequest,headers: headers).then((getFollowUnfollowValue) async {
      final getFollowUnfollowData = FollowUnfollow.fromJson(getFollowUnfollowValue);
      followUnfollowList.value.clear();
      followUnfollowList.value.add(getFollowUnfollowData.followUnfollowData!);
      if(followUnfollowList.value.isEmpty)
      {   isFollowUnFollowDataLoad.value = true;  }
      change(followUnfollowList, status: RxStatus.success());
      Const().toast(getFollowUnfollowData.message);
      getCompanyListData('');
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
