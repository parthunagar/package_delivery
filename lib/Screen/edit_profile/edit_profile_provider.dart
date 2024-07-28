import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart' as g;
// import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:package_delivery/API/api_url.dart';
import 'package:dio/dio.dart';

class EditProfileProvider {



  Future<dynamic> callEditProfile(
      String userName, String email, int userRole, String gender,
      String address, String contactNo, String apiToken,String countryCode,
      g.Rx<File> profilePhoto) async {
    FormData? formData;

    debugPrint('callEditProfile => userName : $userName');
    debugPrint('callEditProfile => email : $email');
    debugPrint('callEditProfile => userRole : $userRole');
    debugPrint('callEditProfile => gender : $gender');
    debugPrint('callEditProfile => address : $address');
    debugPrint('callEditProfile => contactNo : $contactNo');
    debugPrint('callEditProfile => profilePhoto : $profilePhoto');
    debugPrint('callEditProfile => profilePhoto.value.path : ${profilePhoto.value.path}');
    debugPrint('callEditProfile => profilePhoto.value.path.isEmpty : ${profilePhoto.value.path.isEmpty}');

    if(profilePhoto.value.path.isNotEmpty){
      debugPrint(' ===========> profilePhoto is Not Empty<=========== ');
      String fileName = profilePhoto.value.path.split('/').last;
      debugPrint('callDriverVerification => fileName :  ${fileName.toString()}');
      formData = FormData.fromMap({
        'username' : userName,
        'email' : email,
        'role' : userRole,
        'gender' : gender,
        'address' : address,
        'contact_number': contactNo,
        'phone_code': countryCode,
        'driver_photo' : await MultipartFile.fromFile(profilePhoto.value.path, filename: fileName)
      });
    }
    else {
      debugPrint(' ===========> profilePhoto is empty <=========== ');
      debugPrint('profilePhoto : ${profilePhoto.value.path}');
      formData = FormData.fromMap({
        'username' : userName,
        'email' : email,
        'role' : userRole,
        'gender' : gender,
        'address' : address,
        'phone_code': countryCode,
        'contact_number': contactNo,
        // 'driver_photo' : await MultipartFile.fromFile(profilePhoto.value.path, filename: fileName)
      });
    }

    try{
      Response response = await Dio().post(Api.editProfileUrl,
        data: formData,
        options: Options(
          contentType: 'multipart/form-data',
          headers: {"authorization": "Bearer $apiToken"})
      ).catchError((e){
        debugPrint('e.response.data : ${e.response.data}');
        debugPrint('e.response.headers : ${e.response.headers}');
        debugPrint('e.response.request : ${e.response.request}');
      });
      debugPrint('callEditProfile => response : ${response.data.toString()}');
      return response.data;
    }
    catch(e){
      debugPrint('callEditProfile => ERROR : ${e.toString()}');
    }
  }

}