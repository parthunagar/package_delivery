import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_delivery/API/api_url.dart';

class ApplyCouponProvider extends GetConnect{

  ///PV
  Future<dynamic> callCouponList({Map<String, dynamic>? queryRequest, Map<String, String>? headers}) async {
    final response = await post(Api.couponListUrl,queryRequest, headers:headers);
    // debugPrint('callCompanyList response.body : '+ response.body.toString());
    if(response.status.hasError) {
      debugPrint('callCouponList =================> response.statusText : ${response.statusText}');
      return Future.error(response.body!);
    } else {
      debugPrint('callCouponList =====>>>>>> response.statusText : ${response.statusText}');
      // print('callCompanyList => response.body : ${response.body}');
      return response.body;
    }
  }


  Future<dynamic> callApplyCoupon({Map<String, dynamic>? queryRequest, Map<String, String>? headers}) async {
    final response = await post(Api.applyCouponUrl,queryRequest, headers:headers);
    // debugPrint('callCompanyList response.body : '+ response.body.toString());
    if(response.status.hasError) {
      debugPrint('callApplyCoupon =================> response.statusText : ${response.statusText}');
      return Future.error(response.body!);
    } else {
      debugPrint('callApplyCoupon =====>>>>>> response.statusText : ${response.statusText}');
      debugPrint('callApplyCoupon => response.body : ${response.body}');
      return response.body;
    }
  }

}

