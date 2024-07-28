import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:package_delivery/AppRoute/NavigationArgs.dart';
import 'package:package_delivery/AppRoute/app_route.dart';
import 'package:package_delivery/Constant/app_constant.dart';
import 'package:package_delivery/Constant/app_image.dart';
import 'package:package_delivery/Constant/colors.dart';
import 'package:package_delivery/Screen/home/home_provider.dart';
import 'package:package_delivery/Screen/home/shipmet_list_model.dart';
import 'package:package_delivery/Screen/payment/payment_model.dart';
import 'package:package_delivery/Screen/payment/payment_provider.dart';
import 'package:package_delivery/Utils/preference.dart';
import 'package:package_delivery/widget/progress_dialog_utils.dart';


import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class HomeLogic extends GetxController with StateMixin<dynamic> {
  
  //For Drawer page selection

  var userId,userToken,email;

  RxInt userRoleid = 0.obs;

  Rx<RxList<shipment>> shipmentItemList = RxList<shipment>.empty().obs;
  TextEditingController? cTrackId = TextEditingController();
  RxBool isShipmentItemLoad = false.obs;
  Rx<Color> textColor = cBlue.obs;
  Rx<Color> driverBackgroundColor = cWhite.obs;
  Rx<Color> companyBackgroundColor = cWhite.obs;

  final plugin = PaystackPlugin();
  @override
  void onInit() async{
    plugin.initialize(publicKey: Const.payStackPublicKey);
    // TODO: implement onInit
  userId = await Preference().readInt(Const.prefUserId);
  userToken = await Preference().read(Const.prefAPIToken);
  email = await Preference().read(Const.prefEmail);
  userRoleid.value = await Preference().readInt(Const.prefUserRoleId);
  callShipmentList();
    super.onInit();
  }

  // var latLang = const LatLng(0.0, 0.0).obs;
  LocationData? _locationData;
  Future<LocationData?> getCurrantLocation() async {
    Location location = Location();
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        // return;
      }
    }
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        // return;
      }
    }
    _locationData = await location.getLocation();
    debugPrint('latitude : ' + _locationData!.latitude!.toString());
    debugPrint('longitude : ' + _locationData!.longitude!.toString());
    return _locationData;
    // latLang.value = LatLng(_locationData!.latitude!, _locationData!.longitude!);
    // debugPrint('controller.latLang.value :' + latLang.value.latitude.toString() + ' : ' + latLang.value.latitude.toString());
  }

  callShipmentList({String? trackId}) async {
    getCurrantLocation().then((value) {
      debugPrint('latitude : ${value!.latitude.toString()}');
      debugPrint('longitude : ${value.longitude.toString()}');
      ProgressDialogUtils.showProgressDialog(Get.context);
      Map<String, dynamic> queryRequest = {
        'tracking_id': trackId,
        'user_id': userId,
        'latitude':_locationData!.latitude!.toString(),
        'longitude':_locationData!.longitude!.toString(),
      };
      Map<String, String> headers = {"authorization": "Bearer $userToken"};
      debugPrint('callShipmentList => queryRequest : $queryRequest');
      HomeProvider().callShowShipment(queryRequest: queryRequest,headers: headers).then((shipmentList) async{
        debugPrint('registerApi 112: '+ shipmentList.toString());
        if(shipmentList['status']!=0) {
          final shipmentListData = ShipmentList.fromJson(shipmentList);
          shipmentItemList.value.clear();
          for(var item in shipmentListData.data!.shipmentlist!){
            if(userRoleid.value == UserRoles.customer) {
              shipmentItemList.value.add(item);
            }
            else{
              if(item.payment_status == ShipmentPaymantStatus.paid){
                shipmentItemList.value.add(item);
              }
            }

          }
          // shipmentItemList.value.addAll(shipmentListData.data!.shipmentlist!);
          // debugPrint('shipmentItemList => receiverPhoneNumber : ${shipmentItemList.value[0].receiverPhoneNumber.toString()}');
        }
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
    });


  }


  startCharge(BuildContext context,var h, var w,int amount,String shipmentId) async {
    // hasTransactionStarted.toggle();

    Map<String, dynamic> queryRequest = {'amount': amount, 'email' : email};
    PaymentProvider().initTransaction(queryRequest, Const.payStackSecretKey).then((initValue) async {
      if(initValue != null){
        Charge _charge = Charge()
          ..email = '$email'
          ..amount = amount

        //DEFAULT PAYMENT SUCCESS CARD
        //   ..card = PaymentCard( number: '4084084084084081',cvc: '408',expiryMonth: 02,expiryYear: 23,)

        //DEFAULT PAYMENT FAIL CARD
        //   ..card = PaymentCard(number: '4084080000005408', cvc: '001', expiryMonth: 02, expiryYear: 23,)
        // ..currency = 'ZAR'//Strings.appName
        // ..currency =  'NGN'//'''USD'
          ..accessCode = initValue['data']['access_code'];

        CheckoutResponse _checkoutResponse = await plugin.checkout(
          context,
          charge: _charge,
          // method: CheckoutMethod.selectable,
          method: CheckoutMethod.card,
          // hideAmount: true,
          // hideEmail: true,
          fullscreen: true,
          logo: SvgPicture.asset(Assets.iconAppLogoSVG,height: h * 0.07,width: w * 0.2,),
          // fullscreen: true
        );

        if (_checkoutResponse.status == true) {
          ///CALL API
          getStorePaymentData(_checkoutResponse.reference.toString(), amount, 'card',shipmentId);
          debugPrint("startCharge =>  _checkoutResponse : $_checkoutResponse");
          debugPrint("startCharge => checkoutResponse.message : ${_checkoutResponse.message}");
          debugPrint("startCharge => checkoutResponse.card : ${_checkoutResponse.card}");
          debugPrint("startCharge => checkoutResponse.card.addressLine1 : ${_checkoutResponse.card!.addressLine1}");
          debugPrint("startCharge => checkoutResponse.card.addressLine2 : ${_checkoutResponse.card!.addressLine2}");
          debugPrint("startCharge => checkoutResponse.card.addressLine3 : ${_checkoutResponse.card!.addressLine3}");
          debugPrint("startCharge => checkoutResponse.card.addressLine4 : ${_checkoutResponse.card!.addressLine4}");
          debugPrint("startCharge => checkoutResponse.card.addressPostalCode : ${_checkoutResponse.card!.addressPostalCode}");
          debugPrint("startCharge => checkoutResponse.card.addressCountry : ${_checkoutResponse.card!.addressCountry}");
          debugPrint("startCharge => checkoutResponse.card.country : ${_checkoutResponse.card!.country}");
          debugPrint("startCharge => checkoutResponse.card.type : ${_checkoutResponse.card!.type}");
          debugPrint("startCharge => checkoutResponse.card.last4Digits : ${_checkoutResponse.card!.last4Digits}");
          debugPrint("startCharge => checkoutResponse.card.name : ${_checkoutResponse.card!.name}");
          debugPrint("startCharge => checkoutResponse.card.number : ${_checkoutResponse.card!.number}");
          debugPrint("startCharge => checkoutResponse.card.cvc : ${_checkoutResponse.card!.cvc}");
          debugPrint("startCharge => checkoutResponse.card.expiryMonth : ${_checkoutResponse.card!.expiryMonth}");
          debugPrint("startCharge => checkoutResponse.card.expiryYear : ${_checkoutResponse.card!.expiryYear}");
          debugPrint("startCharge => checkoutResponse.account : ${_checkoutResponse.account}");
          debugPrint("startCharge => checkoutResponse.reference : ${_checkoutResponse.reference}");
          debugPrint("startCharge => checkoutResponse.status : ${_checkoutResponse.status}");
          debugPrint("startCharge => checkoutResponse.method : ${_checkoutResponse.method}");
          debugPrint("startCharge => checkoutResponse.verify : ${_checkoutResponse.verify}");
          // AppDialogs.showSuccessDialog(context, _checkoutResponse.message);
        }
        else {
          Const().toast('Your transaction is failed!');
          debugPrint("startCharge =>  _checkoutResponse : $_checkoutResponse");
          debugPrint("startCharge => checkoutResponse.message : ${_checkoutResponse.message}");
          debugPrint("startCharge => checkoutResponse.card : ${_checkoutResponse.card}");
          debugPrint("startCharge => checkoutResponse.card.addressLine1 : ${_checkoutResponse.card!.addressLine1}");
          debugPrint("startCharge => checkoutResponse.card.addressLine2 : ${_checkoutResponse.card!.addressLine2}");
          debugPrint("startCharge => checkoutResponse.card.addressLine3 : ${_checkoutResponse.card!.addressLine3}");
          debugPrint("startCharge => checkoutResponse.card.addressLine4 : ${_checkoutResponse.card!.addressLine4}");
          debugPrint("startCharge => checkoutResponse.card.addressPostalCode : ${_checkoutResponse.card!.addressPostalCode}");
          debugPrint("startCharge => checkoutResponse.card.addressCountry : ${_checkoutResponse.card!.addressCountry}");
          debugPrint("startCharge => checkoutResponse.card.country : ${_checkoutResponse.card!.country}");
          debugPrint("startCharge => checkoutResponse.card.type : ${_checkoutResponse.card!.type}");
          debugPrint("startCharge => checkoutResponse.card.last4Digits : ${_checkoutResponse.card!.last4Digits}");
          debugPrint("startCharge => checkoutResponse.card.name : ${_checkoutResponse.card!.name}");
          debugPrint("startCharge => checkoutResponse.card.number : ${_checkoutResponse.card!.number}");
          debugPrint("startCharge => checkoutResponse.card.cvc : ${_checkoutResponse.card!.cvc}");
          debugPrint("startCharge => checkoutResponse.card.expiryMonth : ${_checkoutResponse.card!.expiryMonth}");
          debugPrint("startCharge => checkoutResponse.card.expiryYear : ${_checkoutResponse.card!.expiryYear}");
          debugPrint("startCharge => checkoutResponse.account : ${_checkoutResponse.account}");
          debugPrint("startCharge => checkoutResponse.reference : ${_checkoutResponse.reference}");
          debugPrint("startCharge => checkoutResponse.status : ${_checkoutResponse.status}");
          debugPrint("startCharge => checkoutResponse.method : ${_checkoutResponse.method}");
          debugPrint("startCharge => checkoutResponse.verify : ${_checkoutResponse.verify}");
        }
        // hasTransactionStarted.toggle();
      }
    }).onError((error, stackTrace) {
      // hasTransactionStarted.toggle();
      debugPrint("startCharge => error : $error");
      debugPrint("startCharge => stackTrace : $stackTrace");
    });
  }

  Rx<RxList<PaymentStoreData>> storePaymentList = RxList<PaymentStoreData>.empty().obs;

  Future<PaymentStoreData?> getStorePaymentData(String referenceId,var amount,String paymentType,String shipmentId) async {
    amount = double.parse((amount/100).toString());
    debugPrint('shipmentId : $shipmentId ||  referenceId : $referenceId || amount : $amount || paymentType : $paymentType');
    var apiToken = await Preference().read(Const.prefAPIToken);
    Map<String, dynamic> paymentQueryRequest = {
      'shipment_id': shipmentId,
      'transcation_id': referenceId,
      'final_amount': amount,
      'payment_type': paymentType
    };
    // Map<String, dynamic> queryRequest = {'user_id':'26'};
    Map<String, String> paymentHeaders = {"authorization": "Bearer $apiToken"};
    PaymentProvider().callStorePaymentDetail(queryRequest: paymentQueryRequest,headers: paymentHeaders).then((storePaymentValue) {
      final storePaymentData = PaymentStore.fromJson(storePaymentValue);
      storePaymentList.value.clear();
      storePaymentList.value.add(storePaymentData.paymentStoreData!);
      Const().toast(storePaymentData.message);
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        ProgressDialogUtils.hideProgressDialog();
      });
      ///NAVIGATE
      Get.offAllNamed(AppRoutes.paymentSuccessScreen,arguments: {NavigationArgs.kPaymentSuccessTrackingID : '${storePaymentList.value[0].trackingId}'});
    }, onError: (error) {
      debugPrint('PaymentProvider().callStorePaymentDetail => ERROR : '+ error.toString());
      ProgressDialogUtils.hideProgressDialog();
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        ProgressDialogUtils.hideProgressDialog();
      });
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



