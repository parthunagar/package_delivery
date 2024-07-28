import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_delivery/API/api_url.dart';

class StatusOfItemProvider extends GetConnect {


  Future<dynamic> callListOfFilteredShipment({Map<String, dynamic>? queryRequest,Map<String, String>? headers}) async {

    final response = await post(Api.shipmentDeliveredCompanyDriver,queryRequest,headers:headers);
    debugPrint('registerApi 11: '+ response.body.toString());
    if(response.status.hasError) {
      debugPrint('getSearchData => response.statusText : ${response.statusText}');
      return Future.error(response.body!);
    } else {
      // print('getSearchData => response.body : ${response.body}');
      return response.body;
    }
  }

 Future<dynamic> callChangeShipmentStatus({Map<String, dynamic>? queryRequest,Map<String, String>? headers}) async {

    final response = await post(Api.shipmentStatusChange,queryRequest,headers:headers);
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