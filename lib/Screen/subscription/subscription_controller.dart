import 'dart:async';
import 'dart:io';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:package_delivery/AppRoute/app_route.dart';
import 'package:package_delivery/Constant/app_constant.dart';
import 'package:package_delivery/Screen/shipmentsummary/update_delivery_model.dart';
import 'package:package_delivery/Screen/subscription/consumable_store.dart';
import 'package:in_app_purchase_android/in_app_purchase_android.dart';
import 'package:in_app_purchase_android/billing_client_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:package_delivery/Screen/subscription/subscription_provider.dart';
import 'package:package_delivery/Utils/preference.dart';

enum SubscriptionType {plan1, plan2, plan3}

class SubscriptionLogic extends GetxController with StateMixin<dynamic> {

  var selectedSubscription = SubscriptionType.plan1.obs;
  RxString? selectedPlan = "".obs;

  final Set<String> _kIds = <String> {
    'package1', 'package2','package3'
    // 'android.test.purchased'
  };

  RxList<ProductDetails> products = <ProductDetails>[].obs;

  getSubscriptionDataFromStore() async {
    final bool available = await InAppPurchase.instance.isAvailable();
    if (available) {
      debugPrint('initState => available : $available');
      final ProductDetailsResponse response = await InAppPurchase.instance.queryProductDetails(_kIds);
      debugPrint('initState => response : ${response.productDetails}');
      products.clear();
      if(response.productDetails.isNotEmpty) {
        products.addAll(response.productDetails);
        for(int i = 0 ; i < products.length ; i++) {
          debugPrint(' ============> ${i+1} <============ ');
          debugPrint('initState => description : ${response.productDetails[i].description}');
          debugPrint('initState => id : ${response.productDetails[i].id}');
          debugPrint('initState => title : ${response.productDetails[i].title}');
          debugPrint('initState => currencyCode : ${response.productDetails[i].currencyCode}');
          debugPrint('initState => currencySymbol : ${response.productDetails[i].currencySymbol}');
          debugPrint('initState => price : ${response.productDetails[i].price}');
          debugPrint('initState => rawPrice : ${response.productDetails[i].rawPrice}');
          debugPrint('\n\n');
        }
      }
      else{
        debugPrint('ERROR : productDetails.isEmpty => ${response.productDetails.isEmpty}');
        debugPrint('response.error : ${response.error}');
      }
    }
    else{
      debugPrint('initState => available : $available');
    }
  }

  StreamSubscription<List<PurchaseDetails>?>? subscription;
  InAppPurchase? inAppPurchase = InAppPurchase.instance;


  Rx<UpdateDelivery?>? updateDeliveryList = UpdateDelivery().obs;
  RxBool isUpdateDeliveryDataLoad = false.obs;

  RxInt? freeDelivery = 0.obs;
  gePlan(String productId) {
    debugPrint('_kIds : $_kIds');
    String idPkg1 = 'package1';
    String idPkg2 = 'package2';
    String idPkg3 = 'package3';
    if(productId == idPkg1 ) {
      freeDelivery!.value = 0;
      freeDelivery!.value = 3;
    }
    if(productId == idPkg2 ) {
      freeDelivery!.value = 0;
      freeDelivery!.value = 10;
    }
    if(productId == idPkg3 ) {
      freeDelivery!.value = 0;
      freeDelivery!.value = 15;
    }
    getUpdateDeliveryData(freeDelivery!.value.toString());
    // return freeDelivery!.value;
    // Const().toast('freeDelivery.value : ${freeDelivery!.value}');
    debugPrint('freeDelivery.value : ${freeDelivery!.value}');
  }

  Future<UpdateDelivery?> getUpdateDeliveryData(String freeDeliveryValue) async {
    var apiToken = await Preference().read(Const.prefAPIToken);
    debugPrint('getProfileData => apiToken : $apiToken');
    // Map<String, dynamic> queryRequest = {'free_delivery': '${products[int.parse(selectedPlan!.value.toString())].id}'};
    Map<String, dynamic> queryRequest = {'free_delivery': freeDeliveryValue};
    Map<String, String> headers = {"authorization": "Bearer $apiToken"};
    SubscriptionProvider().callUpdateFreeDelivery(queryRequest: queryRequest, headers: headers).then((getUpdateDeliveryValue) {
      debugPrint('getUpdateDeliveryData => getUpdateDeliveryValue : $getUpdateDeliveryValue');
      updateDeliveryList!.value = UpdateDelivery.fromJson(getUpdateDeliveryValue);
      // freeDeliveryList.value.clear();
      // freeDeliveryList!.value = freeDeliveryData;
      if(updateDeliveryList!.value!.status == 1) {
        debugPrint(' getUpdateDeliveryData!.value : ${ updateDeliveryList!.value!.updateDeliveryData!.id }');
        debugPrint(' getUpdateDeliveryData!.value : ${ updateDeliveryList!.value!.updateDeliveryData!.username }');
        freeDelivery!.value = 0;
        selectedPlan!.value = "";
        Const().toast(updateDeliveryList!.value!.message.toString());
        Get.offAllNamed(AppRoutes.dashboardScreen);
        // Get.offAllNamed(AppRoutes.paymentSuccessScreen,arguments: {NavigationArgs.kPaymentSuccessTrackingID : '${storePaymentList.value[0].trackingId}'});
      }
      else{
        freeDelivery!.value = 0;
        selectedPlan!.value = "";
        Const().toast(updateDeliveryList!.value!.message.toString());
      }
    }).onError((error, stackTrace) {
      freeDelivery!.value = 0;
      selectedPlan!.value = "";
      Const().toast(updateDeliveryList!.value!.message.toString());
    });
  }


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getSubscriptionDataFromStore();

    Stream<List<PurchaseDetails>>? purchaseUpdated = inAppPurchase!.purchaseStream;
    subscription = purchaseUpdated.listen((List<PurchaseDetails> purchaseDetailsList) {
      debugPrint('onInit => purchaseDetailsList : $purchaseDetailsList');

     if(purchaseDetailsList[0].status == PurchaseStatus.purchased) {
       for(int i =0 ; i < purchaseDetailsList.length ; i ++) {
         debugPrint('\n index : ${purchaseDetailsList[i]}'
             '\n productID : ${purchaseDetailsList[i].productID}'
             '\n error : ${purchaseDetailsList[i].error}'
             '\n status : ${purchaseDetailsList[i].status}'
             '\n pendingCompletePurchase : ${purchaseDetailsList[i].pendingCompletePurchase}'
             '\n purchaseID : ${purchaseDetailsList[i].purchaseID}'
             '\n verificationData : ${purchaseDetailsList[i].verificationData}');
         // Const().toast(
         //     '\n index : ${purchaseDetailsList[i]}'
         //     '\n productID : ${purchaseDetailsList[i].productID}'
         //     '\n error : ${purchaseDetailsList[i].error}'
         //     '\n status : ${purchaseDetailsList[i].status}'
         //     '\n pendingCompletePurchase : ${purchaseDetailsList[i].pendingCompletePurchase}'
         //     '\n purchaseID : ${purchaseDetailsList[i].purchaseID}'
         //     '\n verificationData : ${purchaseDetailsList[i].verificationData}'
         // );
       }
       gePlan(purchaseDetailsList[0].productID);

     }
     else if(purchaseDetailsList[0].status == PurchaseStatus.error) {
       Const().toast('Purchase Error : ${purchaseDetailsList[0].error.toString()}');
     }
     else if(purchaseDetailsList[0].status == PurchaseStatus.canceled) {
       Const().toast('Purchase canceled.');
     }
     else if(purchaseDetailsList[0].status == PurchaseStatus.pending) {
       Const().toast('Purchase pending.');
     }
     else if(purchaseDetailsList[0].status == PurchaseStatus.restored) {
       Const().toast('Purchase restored.');
     }

      // Const().toast('purchaseDetailsList : \nstatus -> ${purchaseDetailsList[0].status} '
      //     '\npurchaseID -> ${purchaseDetailsList[0].purchaseID} '
      //     '\nproductID -> ${purchaseDetailsList[0].productID}'
      //     '\nverificationData -> ${purchaseDetailsList[0].verificationData}'
      //     '\ntransactionDate -> ${purchaseDetailsList[0].transactionDate}'
      // );

      }, onDone: () {
         subscription!.cancel();
         // debugPrint('onInit => onDone');

         // Const().toast('onDone EVENT',length: Toast.LENGTH_LONG,bgColor: Colors.red);
        // _subscription.cancel();
      }, onError: (Object error) {
          debugPrint('onInit => error : $error');
          Const().toast('error : $error');
        // handle error here.
      });
  }

  // listenToPurchaseUpdated() async {
  //   if (Platform.isAndroid)  {
  //     final InAppPurchaseAndroidPlatformAddition androidAddition = inAppPurchase!.getPlatformAddition<InAppPurchaseAndroidPlatformAddition>();
  //     // await androidAddition.consumePurchase(purchaseDetails);
  //   }
  //
  // }


  makingPurchase() async {
    debugPrint('makingPurchase => selectedPlan : ${selectedPlan.toString()}');
    final ProductDetails productDetails = products[int.parse(selectedPlan.toString())];
    debugPrint('makingPurchase => productDetails.id : ${productDetails.id.toString()}');
    final PurchaseParam purchaseParam = PurchaseParam(productDetails: productDetails);
    inAppPurchase!.buyConsumable(purchaseParam: purchaseParam).then((buyConsumableValue) {
      debugPrint('makingPurchase => buyConsumableValue : $buyConsumableValue');
      final InAppPurchaseAndroidPlatformAddition androidAddition = inAppPurchase!.getPlatformAddition<InAppPurchaseAndroidPlatformAddition>();
      debugPrint('makingPurchase => androidAddition : $androidAddition');
      debugPrint('makingPurchase => androidAddition : ${androidAddition}');



      // debugPrint('makingPurchase => androidAddition : ${androidAddition[0].}');
      // await androidAddition.consumePurchase(productDetails);
    }).onError((error, stackTrace) {
      debugPrint('makingPurchase => error : $error');
      debugPrint('makingPurchase => stackTrace : $stackTrace');
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
    subscription!.cancel();
  }

  void changeval(value) => this.selectedSubscription.value = value;

}
