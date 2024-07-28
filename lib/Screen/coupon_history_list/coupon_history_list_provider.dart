
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_delivery/API/api_url.dart';

class CouponHistoryListProvider extends GetConnect{

  //TODO : PU
  Future<dynamic> callCouponHistoryList({Map<String, dynamic>? queryRequest, Map<String, String>? headers}) async {
    final response = await post(Api.applyCouponHistoryUrl,queryRequest, headers:headers);
    // debugPrint('callCompanyList response.body : '+ response.body.toString());
    if(response.status.hasError) {
      debugPrint('callCouponHistoryList =================> response.statusText : ${response.statusText}');
      return Future.error(response.body!);
    } else {
      debugPrint('callCouponHistoryList =====>>>>>> response.statusText : ${response.statusText}');
      // print('callCompanyList => response.body : ${response.body}');
      return response.body;
    }
  }

}