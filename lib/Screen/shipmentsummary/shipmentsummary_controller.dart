import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:package_delivery/AppRoute/NavigationArgs.dart';
import 'package:package_delivery/AppRoute/app_route.dart';
import 'package:package_delivery/Constant/app_constant.dart';
import 'package:package_delivery/Constant/app_image.dart';
import 'package:package_delivery/Screen/payment/payment_model.dart';
import 'package:package_delivery/Screen/payment/payment_provider.dart';
import 'package:package_delivery/Screen/shipmentsummary/free_delivery_model.dart';
import 'package:package_delivery/Screen/shipmentsummary/shipmentsummary_model.dart';
import 'package:package_delivery/Screen/shipmentsummary/shipmentsummary_provider.dart';
import 'package:package_delivery/Screen/shipmentsummary/update_delivery_model.dart';
import 'package:package_delivery/Utils/preference.dart';
import 'package:package_delivery/widget/progress_dialog_utils.dart';

class ShipmentSummaryLogic extends GetxController with StateMixin<dynamic> {
  
  var userId, userToken,email,apiToken;

  Rx<RxList<Datum>> shipmentSummaryList = RxList<Datum>.empty().obs;
  RxBool isShipmentSummaryDataLoad = false.obs;

  var pickuplocation = ''.obs;
  var shipmentId ;


  Future<ShipmentSummary?> getShipmentSummaryData(var shipmentId) async {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      ProgressDialogUtils.showProgressDialog(Get.context);
    });
    Map<String, dynamic> queryRequest = {'user_id': userId, 'shipment_id': shipmentId};
    Map<String, String> headers = {"authorization": "Bearer $userToken"};
    ShipmentSummaryProvider().callShipmentSummaryList(queryRequest: queryRequest, headers: headers).then((shipmentSummaryValue) {
      debugPrint('shipmentSummaryValue : $shipmentSummaryValue');
      final shipmentSummarys = ShipmentSummary.fromJson(shipmentSummaryValue);
      debugPrint('shipmentSummarys : $shipmentSummarys');
      shipmentSummaryList.value.clear();
      shipmentSummaryList.value.addAll(shipmentSummarys.datum!);
      if (shipmentSummaryList.value.isEmpty) {
        isShipmentSummaryDataLoad.value = true;
      } else {
          // debugPrint('getShipmentSummaryData Image ======>>>>: ' + shipmentSummaryList.value[0].getShipmentImage[0].shipmentImage);
        getAdressss(double.parse(shipmentSummaryList.value[0].pickupLatitude!), double.parse(shipmentSummaryList.value[0].pickupLongitude!)).then((value) {
          this.pickuplocation.value = value;
        }).catchError((e) {
          this.pickuplocation.value = "Address Not Found";
        });
        isShipmentSummaryDataLoad.value = false;
      }
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        ProgressDialogUtils.hideProgressDialog();
      });
    }, onError: (error) {
      debugPrint('getShipmentSummaryData ERROR : ' + error.toString());
      Const().toast(error);
      ProgressDialogUtils.hideProgressDialog();
      change(null, status: RxStatus.error(error.toString()));
    });
  }

  Future<String> getAdressss(double lat, double lang) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, lang);
    var first = placemarks.first;
    print('placemarks.first : '+' ${first.name},  ${first.street},  ${first.subLocality}, ${first.locality},  ${first.administrativeArea},  ${first.country} , ${first.postalCode}');
    String address = ' ${first.name},  ${first.street},  ${first.subLocality}, ${first.locality},  ${first.administrativeArea},  ${first.country} , ${first.postalCode}';
    return address;
  }

  ///PAY STACK PAYMENT GETWAY
  final plugin = PaystackPlugin();
  RxBool hasTransactionStarted = false.obs;

  @override
  void onInit() async {
    // TODO: implement onInit
    plugin.initialize(publicKey: Const.payStackPublicKey);
    super.onInit();

    userId = await Preference().readInt(Const.prefUserId);
    userToken = await Preference().read(Const.prefAPIToken);
    email = await Preference().read(Const.prefEmail);
    apiToken = await Preference().read(Const.prefAPIToken);
    getFreeDeliveryData();
    try{
      debugPrint('onInit => userId : $userId');
      debugPrint('onInit => userToken : $userToken');
      debugPrint('onInit => email : $email');
      debugPrint('onInit => shipmentId : ${Get.arguments[NavigationArgs.cShipmentId]}');
      shipmentId = Get.arguments[NavigationArgs.cShipmentId];

      getShipmentSummaryData(shipmentId);
    }catch(e){
      print(e.toString());
    }


   // shipment_id = 1 static
  }



  Rx<FreeDelivery?>? freeDeliveryList = FreeDelivery().obs;
  RxBool isFreeDeliveryDataLoad = false.obs;

  Future<FreeDelivery?> getFreeDeliveryData() async {
    Map<String, dynamic> queryRequest = {'': ''};
    Map<String, String> headers = {"authorization": "Bearer $userToken"};
    ShipmentSummaryProvider().callGetFreeDelivery(queryRequest: queryRequest, headers: headers).then((getFreeDeliveryValue) {
      debugPrint('getFreeDeliveryData => getFreeDeliveryValue : $getFreeDeliveryValue');
      freeDeliveryList!.value = FreeDelivery.fromJson(getFreeDeliveryValue);
      // freeDeliveryList.value.clear();
      // freeDeliveryList!.value = freeDeliveryData;
      debugPrint(' freeDeliveryList!.value : ${ freeDeliveryList!.value }');
      debugPrint(' freeDeliveryList!.value.freeDelivery : ${ freeDeliveryList!.value!.freeDeliveryData!.freeDelivery }');
      // if(freeDeliveryList.value.freeDelivery! <= 0){
      //
      // }
      // if(freeDeliveryList.value.ise)
    }).onError((error, stackTrace) {
      // freeDeliveryList.value = null;

    });
  }

  Rx<UpdateDelivery?>? updateDeliveryList = UpdateDelivery().obs;
  RxBool isUpdateDeliveryDataLoad = false.obs;
  Future<UpdateDelivery?> getUpdateDeliveryData() async {
    Map<String, dynamic> queryRequest = {'': ''};
    Map<String, String> headers = {"authorization": "Bearer $userToken"};
    ShipmentSummaryProvider().callUpdateFreeDelivery(queryRequest: queryRequest, headers: headers).then((getUpdateDeliveryValue) {
      debugPrint('getUpdateDeliveryData => getUpdateDeliveryValue : $getUpdateDeliveryValue');
      updateDeliveryList!.value = UpdateDelivery.fromJson(getUpdateDeliveryValue);
      // freeDeliveryList.value.clear();
      // freeDeliveryList!.value = freeDeliveryData;
      if(updateDeliveryList!.value!.status == 1) {
        debugPrint(' getUpdateDeliveryData!.value : ${ updateDeliveryList!.value!.updateDeliveryData!.id }');
        debugPrint(' getUpdateDeliveryData!.value : ${ updateDeliveryList!.value!.updateDeliveryData!.username }');
        Const().toast(updateDeliveryList!.value!.message.toString());
        Get.offAllNamed(AppRoutes.dashboardScreen);
        // Get.offAllNamed(AppRoutes.paymentSuccessScreen,arguments: {NavigationArgs.kPaymentSuccessTrackingID : '${storePaymentList.value[0].trackingId}'});
      }
      else{
        Const().toast(updateDeliveryList!.value!.message.toString());
      }
    }).onError((error, stackTrace) {
      Const().toast(updateDeliveryList!.value!.message.toString());
    });
  }



  startCharge(BuildContext context,var h, var w,int amount) async {
    hasTransactionStarted.toggle();

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
          getStorePaymentData(_checkoutResponse.reference.toString(), amount, 'card');
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
        hasTransactionStarted.toggle();
      }
   }).onError((error, stackTrace) {
     hasTransactionStarted.toggle();
      debugPrint("startCharge => error : $error");
      debugPrint("startCharge => stackTrace : $stackTrace");
    });
  }

  Rx<RxList<PaymentStoreData>> storePaymentList = RxList<PaymentStoreData>.empty().obs;

  Future<PaymentStoreData?> getStorePaymentData(String referenceId,var amount,String paymentType) async {
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
