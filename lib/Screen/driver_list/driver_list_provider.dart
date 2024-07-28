
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_delivery/API/api_url.dart';

class DriverListProvider extends GetConnect{

  Future<dynamic> callDriverList({Map<String, dynamic>? queryRequest,Map<String, String>? headers}) async {
    final response = await post(Api.driverListUrl, queryRequest,headers: headers);
    debugPrint('callDriverList => response.body : '+ response.body.toString());
    if(response.status.hasError) {
      debugPrint('callDriverList => response.statusText : ${response.statusText}');
      return Future.error(response.statusText!);
    } else {
      return response.body;
    }
  }

}