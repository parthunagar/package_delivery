import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_delivery/API/api_url.dart';

class FollowedListProvider extends GetConnect{

  Future<dynamic> callFollowedCompanyList({Map<String, dynamic>? queryRequest,Map<String, String>? headers}) async {
    final response = await post(Api.followedCompanyListUrl,queryRequest,headers: headers);
    // debugPrint('callFollowedCompanyList => response.body : ${response.body}');
    if(response.status.hasError) {
      debugPrint('callFollowedCompanyList => response.statusText : ${response.statusText}');
      return Future.error(response.body!);
    } else {
      return response.body;
    }
  }

  Future<dynamic> callFollowUnfollowList({Map<String, dynamic>? queryRequest,Map<String, String>? headers}) async {
    final response = await post(Api.followUnfollowCompanyUrl, queryRequest,headers: headers);
    debugPrint('callFollowUnfollowList => response.body : ${response.body.toString()}');
    if(response.status.hasError) {
      debugPrint('callFollowUnfollowList => response.statusText : ${response.statusText}');
      return Future.error(response.statusText!);
    } else {
      return response.body;
    }
  }

}