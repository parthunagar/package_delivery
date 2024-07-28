import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_delivery/API/api_url.dart';

class PackageSizeListProvider extends GetConnect{

  Future<dynamic> callPackageSizeList({Map<String, dynamic>? queryRequest,Map<String, String>? headers}) async {
    final response = await post(Api.packageSizeListListUrl,queryRequest,headers: headers);
    // debugPrint('callFollowedCompanyList => response.body : ${response.body}');
    if(response.status.hasError) {
      debugPrint('callPackageSizeListList => response.statusText : ${response.statusText}');
      return Future.error(response.body!);
    } else {
      return response.body;
    }
  }



}