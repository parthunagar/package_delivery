import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_delivery/API/api_url.dart';
import 'package:package_delivery/Constant/app_constant.dart';
// import 'package:http/http.dart' as http;


class PaymentProvider extends GetConnect {
  Future initTransaction(Map<String, dynamic>? queryRequest,String secretKey) async {
    debugPrint(' =========> 1 <========= ');
    Map<String, String> headers = {'Content-Type': 'application/json', 'Accept': 'application/json', 'Authorization': 'Bearer $secretKey'};
    debugPrint(' =========> 2 <========= ');
    // Map<String, dynamic> body = {"amount": '9000', "email": "mobile@test.com"};
    var response = await post(Api.initTransactionUrl,queryRequest, headers: headers);
    debugPrint(' =========> 3 <========= ');
    debugPrint('response.body : ${response.body}');
    debugPrint('response.status : ${response.status}');
    if(response.body['status'] == true){
      return response.body;
    }
    else{
      Const().toast(response.body['message']);
      return null;
    }
    debugPrint('initTransaction => response.body : ${response.body}');
    //{status: true, message: Authorization URL created, data: {authorization_url: https://checkout.paystack.com/s2g19n008fb53f8, access_code: s2g19n008fb53f8, reference: inrczm1y5h}}

  }


  Future<dynamic> callStorePaymentDetail({Map<String, dynamic>? queryRequest,Map<String, String>? headers}) async {
    final response = await post(Api.storePaymentDetailUrl, queryRequest,headers: headers);
    debugPrint('callStorePaymentDetail => response.body : '+ response.body.toString());
    if(response.status.hasError) {
      debugPrint('callStorePaymentDetail => response.statusText : ${response.statusText}');
      return Future.error(response.statusText!);
    } else {
      return response.body;
    }
  }
}