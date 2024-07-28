
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_delivery/API/api_url.dart';
import 'package:package_delivery/Screen/signin/signin_model.dart';

class SiginProvider extends GetConnect{

  Future<dynamic> callLogin(String email, String password, String deviceToken) async {
    final response = await post(Api.loginUrl,{
      'email' : email,
      'password' : password,
      'device_token' : deviceToken
    });
    if(response.status.hasError) {
      debugPrint('getSearchData => response.body : ${response.body}');
      debugPrint('getSearchData => response.statusText : ${response.statusText}');
      return Future.error(response.statusText!);
    } else {
      debugPrint('callLogin => response.body : ${response.body}');
      // return Signin.fromJson(response.body) ;
      return response.body;
    }
  }

}