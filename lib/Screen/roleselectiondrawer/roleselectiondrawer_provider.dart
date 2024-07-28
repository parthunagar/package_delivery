
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_delivery/API/api_url.dart';

class RoleSelectionDrawerProvider extends GetConnect{

  Future<dynamic> callDrawerUpdateRole({Map<String, dynamic>? queryRequest,Map<String, String>? headers}) async {
    final response = await post(Api.editProfileUrl,queryRequest, headers:headers);
    debugPrint('callDrawerUpdateRole => response.body : '+ response.body.toString());
    if(response.status.hasError) {
      debugPrint('callDrawerUpdateRole => response.statusText : ${response.statusText}');
      return Future.error(response.statusText!);
    } else {
      // print('getSearchData => response.body : ${response.body}');
      return response.body;
    }
  }

}