import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_delivery/API/api_url.dart';

class ShipmentSummaryProvider extends GetConnect{

  ///PV
  Future<dynamic> callShipmentSummaryList({Map<String, dynamic>? queryRequest, Map<String, String>? headers}) async {
    final response = await post(Api.shipmentSummaryUrl,queryRequest, headers:headers);
    // debugPrint('callCompanyList response.body : '+ response.body.toString());
    if(response.status.hasError) {
      debugPrint('callCompanyList =================> response.statusText : ${response.statusText}');
      return Future.error(response.body!);
    } else {
      debugPrint('callCompanyList =====>>>>>> response.statusText : ${response.statusText}');
      // print('callCompanyList => response.body : ${response.body}');
      return response.body;
    }
  }

  Future<dynamic> callGetFreeDelivery({Map<String, dynamic>? queryRequest, Map<String, String>? headers}) async {
    final response = await post(Api.getFreeDeliveryUrl,queryRequest, headers:headers);
    // debugPrint('callCompanyList response.body : '+ response.body.toString());
    if(response.status.hasError) {
      debugPrint('callGetFreeDelivery =================> response.statusText : ${response.statusText}');
      debugPrint('callGetFreeDelivery =================> response.body : ${response.body}');
      return Future.error(response.body!);
    } else {
      debugPrint('callGetFreeDelivery =====>>>>>> response.statusText : ${response.statusText}');
      // print('callCompanyList => response.body : ${response.body}');
      return response.body;
    }
  }

  Future<dynamic> callUpdateFreeDelivery({Map<String, dynamic>? queryRequest, Map<String, String>? headers}) async {
    final response = await post(Api.updateFreeDeliveryUrl,queryRequest, headers:headers);
    // debugPrint('callCompanyList response.body : '+ response.body.toString());
    if(response.status.hasError) {
      debugPrint('callGetFreeDelivery =================> response.statusText : ${response.statusText}');
      debugPrint('callGetFreeDelivery =================> response.body : ${response.body}');
      return Future.error(response.body!);
    } else {
      debugPrint('callGetFreeDelivery =====>>>>>> response.statusText : ${response.statusText}');
      // print('callCompanyList => response.body : ${response.body}');
      return response.body;
    }
  }




}

