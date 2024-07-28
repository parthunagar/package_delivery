import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_delivery/API/api_url.dart';

class ForgotPasswordProvider extends GetConnect{

  Future<dynamic> callForgotPassword({Map<String, dynamic>? queryRequest}) async {
    final response = await post(Api.restPasswordUrl,queryRequest);
    debugPrint('registerApi 112: '+ response.body.toString());
    if(response.status.hasError) {
      debugPrint('getSearchData => response.statusText : ${response.statusText}');
      return Future.error(response.body!);
    } else {
      // print('getSearchData => response.body : ${response.body}');
      return response.body;
    }
  }

}