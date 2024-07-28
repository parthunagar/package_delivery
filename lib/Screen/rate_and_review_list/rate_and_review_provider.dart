
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_delivery/API/api_url.dart';

class RateReviewListProvider extends GetConnect{

  Future<dynamic> callRateReviewList({Map<String, dynamic>? queryRequest,Map<String, String>? headers}) async {
    final response = await post(Api.seeCustomerRatingReviewUrl, queryRequest,headers: headers);
    debugPrint('callRateReviewList => response.body : ${response.body.toString()}');
    if(response.status.hasError) {
      debugPrint('callRateReviewList => response.statusText : ${response.statusText}');
      return Future.error(response.statusText!);
    } else {
      return response.body;
    }
  }


}