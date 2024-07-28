
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_delivery/API/api_url.dart';

class SignUpProvider extends GetConnect{

  Future<dynamic> callRegister() async {
    final response = await get(Api.registerUrl);
    if(response.status.hasError) {
      debugPrint('getSearchData => response.statusText : ${response.statusText}');
      return Future.error(response.statusText!);
    } else {
      // print('getSearchData => response.body : ${response.body}');
      return response.body;
    }
  }

}