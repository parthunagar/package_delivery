
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_delivery/API/api_url.dart';

class NotificationListProvider extends GetConnect{

  //TODO : PU
  Future<dynamic> callNotificationList( int userId, String deviceToken) async {
    final response = await post(Api.notificationListUrl,{'user_id' : userId},
    headers: {'Authorization': 'Bearer $deviceToken'}
    );
    if(response.status.hasError) {
      debugPrint('getSearchData => response.statusText : ${response.statusText}');
      return Future.error(response.statusText!);
    } else {
      // print('getSearchData => response.body : ${response.body}');
      return response.body;
    }
  }

}