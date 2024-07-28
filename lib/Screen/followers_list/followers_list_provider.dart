
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_delivery/API/api_url.dart';

class FollowersListProvider extends GetConnect{

 Future<dynamic> callFollowerList({Map<String, dynamic>? queryRequest,Map<String, String>? headers}) async {
    final response = await post(Api.followersListCompanyUrl, queryRequest,headers: headers);
    debugPrint('callFollowerList => response.body : ${response.body.toString()}');
    if(response.status.hasError) {
      debugPrint('callDriverList => response.statusText : ${response.statusText}');
      return Future.error(response.statusText!);
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