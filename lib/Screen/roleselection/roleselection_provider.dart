
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_delivery/API/api_url.dart';

class RoleSelectionProvider extends GetConnect{

  Future<dynamic> callRegister({Map<String, dynamic>? queryRequest}) async {
    final response = await post(Api.registerUrl,queryRequest);
    debugPrint('callRegister => response.body : '+ response.body.toString());
    if(response.status.hasError) {
      debugPrint('callRegister => response.statusText : ${response.statusText}');
      return Future.error(response.statusText!);
    } else {
      // print('getSearchData => response.body : ${response.body}');
      return response.body;
    }
  }

}