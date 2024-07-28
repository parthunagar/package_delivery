import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_delivery/API/api_url.dart';

class MyPackageProvider extends GetConnect {


  Future<dynamic> callShowShipment({Map<String, dynamic>? queryRequest,Map<String, String>? headers}) async {

    final response = await post(Api.showShipmentListUrl,queryRequest,headers:headers);
    debugPrint('registerApi 11: '+ response.body.toString());
    if(response.status.hasError) {
      debugPrint('getSearchData => response.statusText : ${response.statusText}');
      return Future.error(response.body!);
    } else {
      // print('getSearchData => response.body : ${response.body}');
      return response.body;
    }
  }

}