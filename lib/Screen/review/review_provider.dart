import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_delivery/API/api_url.dart';


class ReviewProvider extends GetConnect{

  Future<dynamic> callAddReview({Map<String, dynamic>? queryRequest,Map<String, String>? headers}) async {
    final response = await post(Api.addRatingUrl,queryRequest, headers:headers);
    // debugPrint('callCompanyList response.body : '+ response.body.toString());
    if(response.status.hasError) {
      debugPrint('callGetProfileList => response.statusText : ${response.statusText}');
      return Future.error(response.body!);
    } else {
      // print('callCompanyList => response.body : ${response.body}');
      return response.body;
    }
  }
}