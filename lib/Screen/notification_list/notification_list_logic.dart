import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_delivery/Constant/app_constant.dart';
import 'package:package_delivery/Screen/notification_list/notification_list_model.dart';
import 'package:package_delivery/Screen/notification_list/notification_list_provider.dart';
import 'package:package_delivery/Utils/preference.dart';
import 'package:package_delivery/widget/progress_dialog_utils.dart';

class NotificationListLogic extends GetxController with StateMixin<dynamic> {

  Rx<RxList<NotificationDatum>> notificationList = RxList<NotificationDatum>.empty().obs;
  RxBool isDataLoad = false.obs;


  Future<NotificationDatum?> getNotificationListData() async {
    // ProgressDialogUtils.showProgressDialog(Get.context);
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      ProgressDialogUtils.showProgressDialog(Get.context);
    });
    int userId = await Preference().readInt(Const.prefUserId);
    String apiToken = await Preference().read(Const.prefAPIToken);
    debugPrint('getNotificationListData => userId : $userId');
    debugPrint('getNotificationListData => apiToken : $apiToken');
    NotificationListProvider().callNotificationList(userId, apiToken).then((notificationValue) {
      final notifications = MainNotification.fromJson(notificationValue);
      debugPrint('getNotificationListData => notificationValue : $notificationValue');
      notificationList.value.clear();
      notificationList.value.addAll(notifications.notificationData!);
      // ProgressDialogUtils.hideProgressDialog();
      if(notificationList.value.isEmpty)
      {   isDataLoad.value = true;  }
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        ProgressDialogUtils.hideProgressDialog();
      });
      debugPrint('getNotificationListData => notificationList : $notificationList');
      debugPrint('getNotificationListData => notificationList.length : ${notificationList.value.length}');
      debugPrint('getNotificationListData => notificationList.length : ${notificationList.value.isEmpty}');
      // debugPrint('getNotificationListData => notificationList : ${notificationList.value[0].id}');
      // if(notificationList.value.length == 0 ){
      //   notificationList.value.clear();
      //   return;
      // }
    });
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getNotificationListData();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
