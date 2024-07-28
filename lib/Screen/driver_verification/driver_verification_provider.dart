
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart' as g;
// import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:package_delivery/API/api_url.dart';
import 'package:dio/dio.dart';
class DriverVerificationProvider {


  Future<dynamic> callDriverVerification(
      String apiToken, String accountNo,
      String ifscCode, g.Rx<File> licensePhoto,
      String branchCode, String bankName, String contactNo,
      g.Rx<File> vehiclePhoto, String vehicleName,
      String licenseNumber, String vehicleColor) async {

    String fileName1 = licensePhoto.value.path.split('/').last;
    String fileName2 = vehiclePhoto.value.path.split('/').last;
    debugPrint('callDriverVerification => fileName1 :  ${fileName1.toString()}');
    debugPrint('callDriverVerification => fileName2 :  ${fileName2.toString()}');
    FormData formData = FormData.fromMap({
      'account_number' : accountNo,
      'ifsc_code' : ifscCode,
      'branch_code' : branchCode,
      'name' : bankName,
      'contact_number' : contactNo,
      'vehicle_name' : vehicleName,
      'license_number' : licenseNumber,
      'vehicle_color' : vehicleColor,
      'license_photo' : await MultipartFile.fromFile(licensePhoto.value.path, filename: fileName1),
      'vehicle_images[]' : await MultipartFile.fromFile(vehiclePhoto.value.path, filename: fileName2),
    });

    try{
      Response response = await Dio().post(Api.driverVerificationUrl,
          data: formData,
          options: Options(
              contentType: 'multipart/form-data',
              headers: {"authorization": "Bearer $apiToken"})

      ).catchError((e){
        debugPrint('e.response.data : ${e.response.data}');
        debugPrint('e.response.headers : ${e.response.headers}');
        debugPrint('e.response.request : ${e.response.request}');
      });
      debugPrint('callDriverVerification => response : ${response.data.toString()}');
      debugPrint('callDriverVerification => response : ${response.data['status'].toString()}');
      return response.data;
    }
    catch(e){
      debugPrint('callDriverVerification => ERROR : ${e.toString()}');
    }
  }

}