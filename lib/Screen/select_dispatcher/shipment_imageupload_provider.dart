import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:package_delivery/API/api_url.dart';
import 'package:get/get.dart' as g;

class ShipmentImageUploadProvider {

  /// PS ImageUpload Api

  Future<dynamic> callShipmentImageApi({g.Rx<File>? shipmentImage, String? shipment_id,Map<String, String>? headers}) async {
    String fileName = shipmentImage!.value.path.split('/').last;
    debugPrint('callDriverVerification => fileName :  ${fileName.toString()}');
    FormData formData = FormData.fromMap({
      'shipment_id' : shipment_id,
      'shipment_image[]' : await MultipartFile.fromFile(shipmentImage.value.path, filename: fileName)
    });
    try{
      Response response = await Dio().post(Api.shipmentImageUrl,
          data: formData,
          options: Options(
              contentType: 'multipart/form-data',
              headers: headers)

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