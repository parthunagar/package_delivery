
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_delivery/API/api_url.dart';

class SelectDispatcherProvider extends GetConnect{

  ///PU
  Future<dynamic> callCompanyList({Map<String, dynamic>? queryRequest,Map<String, String>? headers}) async {
    final response = await post(Api.companyListUrl,queryRequest, headers:headers);
    // debugPrint('callCompanyList response.body : '+ response.body.toString());
    if(response.status.hasError) {
      debugPrint('callCompanyList => response.statusText : ${response.statusText}');
      return Future.error(response.body!);
    } else {
      // print('callCompanyList => response.body : ${response.body}');
      return response.body;
    }
  }

  ///PU
  Future<dynamic> callTopSuggestionDriverList({Map<String, dynamic>? queryRequest,Map<String, String>? headers}) async {
    final response = await post(Api.topSuggestionDriverListUrl, queryRequest, headers:headers);
    // debugPrint('callTopSuggestionDriverList => response.body : '+ response.body.toString());
    if(response.status.hasError) {
      debugPrint('callTopSuggestionDriverList => response.statusText : ${response.statusText}');
      return Future.error(response.statusText!);
    } else {
      debugPrint('callTopSuggestionDriverList => response.body : ${response.body}');
      return response.body;
    }
  }

  ///PU
  Future<dynamic> callFamiliarFacesDriverList({Map<String, dynamic>? queryRequest,Map<String, String>? headers}) async {
    final response = await post(Api.familiarFacesListUrl, queryRequest, headers:headers);
    // debugPrint('callTopSuggestionDriverList => response.body : '+ response.body.toString());
    if(response.status.hasError) {
      debugPrint('callTopSuggestionDriverList => response.statusText : ${response.statusText}');
      return Future.error(response.statusText!);
    } else {
      return response.body;
    }
  }


  /// PS CreateShipment Api

  Future<dynamic> callCraeteShipmentApi({Map<String, dynamic>? queryRequest,Map<String, String>? headers}) async {
    final response = await post(Api.createShipmentUrl, queryRequest,headers: headers);
    debugPrint('registerApi 11: '+ response.body.toString());
    if(response.status.hasError) {
      debugPrint('callDriverList => response.statusText : ${response.statusText}');
      return Future.error(response.statusText!);
    } else {
      return response.body;
    }
  }

  Future<dynamic> callFollowUnfollowList({Map<String, dynamic>? queryRequest,Map<String, String>? headers}) async {
    final response = await post(Api.followUnfollowCompanyUrl, queryRequest,headers: headers);
    debugPrint('callFollowUnfollowList => response.body : ${response.body.toString()}');
    if(response.status.hasError) {
      debugPrint('callFollowUnfollowList => response.statusText : ${response.statusText}');
      return Future.error(response.statusText!);
    } else {
      return response.body;
    }
  }
}