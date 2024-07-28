import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:in_app_purchase_android/in_app_purchase_android.dart';
import 'package:in_app_purchase_android/billing_client_wrappers.dart';
import 'package:package_delivery/Screen/subscription/consumable_store.dart';

class SubTestScreen extends StatefulWidget {
  const SubTestScreen({Key? key}) : super(key: key);

  @override
  State<SubTestScreen> createState() => _SubTestScreenState();
}

class _SubTestScreenState extends State<SubTestScreen> {

  final InAppPurchase _inAppPurchase = InAppPurchase.instance;
  final Set<String> _kIds = <String> {
    'package1', 'package2','package3'
    // 'android.test.purchased'
    // 'com.shippack.delivery.package1"'
  };

  RxList<ProductDetails> products = <ProductDetails>[].obs;

  getData() async {
    final bool available = await InAppPurchase.instance.isAvailable();
    if (available) {
      debugPrint('initState => available : $available');
      final ProductDetailsResponse response = await InAppPurchase.instance.queryProductDetails(_kIds);
      debugPrint('initState => response : ${response.productDetails}');
      products.clear();
      if(response.productDetails.isNotEmpty){
        products.addAll(response.productDetails);
        for(int i = 0 ; i < products.length ; i++){
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
  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('In App Purchase'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              getData();
            },
            child: Text('call data')
          )
        ],
      ),
    );
  }
}
