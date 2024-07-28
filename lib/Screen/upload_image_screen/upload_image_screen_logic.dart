import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_delivery/AppRoute/NavigationArgs.dart';
import 'package:package_delivery/Constant/app_constant.dart';
import 'package:package_delivery/Screen/statusofitem/statusofitem_controller.dart';
import 'package:package_delivery/Screen/upload_image_screen/image_upload_provider.dart';
import 'package:package_delivery/Screen/upload_image_screen/shipment_image_model.dart';
import 'package:package_delivery/Utils/preference.dart';
import 'package:package_delivery/widget/progress_dialog_utils.dart';

class UploadImageScreenLogic extends GetxController {
  Rx<File>? image1 = File('').obs;
  RxInt packageId = 0.obs;
  var userId, userToken;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    debugPrint('NavigationArgs.imageUpload : ' +
        Get.arguments[NavigationArgs.imageUpload].toString());
    debugPrint('NavigationArgs.imageUpload : ' +
        Get.arguments[NavigationArgs.cPackageId].toString());

    debugPrint('NavigationArgs.imageUpload : ' +
        Get.arguments[NavigationArgs.cShipmentId].toString());
    image1 = Get.arguments[NavigationArgs.imageUpload];
    packageId.value = Get.arguments[NavigationArgs.cPackageId];
    userId = await Preference().readInt(Const.prefUserId);
    userToken = await Preference().read(Const.prefAPIToken);
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

  /// PS Image Upload
  callShipmentImageUpload() {
    ProgressDialogUtils.showProgressDialog(Get.context);

    Map<String, String> headers = {"authorization": "Bearer $userToken"};

    ImageUploadProvider()
        .callDeliveredShipmentImageApi(
            shipment_id: packageId.value.toString(),
            shipmentImage: image1,
            headers: headers)
        .then((createShipmentImageResponse) async {
      debugPrint('registerApi 112: ' + createShipmentImageResponse.toString());

      final shipmentImage = ShipmentImage.fromJson(createShipmentImageResponse);
      if (shipmentImage.status == 1) {
        Const().toast(shipmentImage.message);
        ProgressDialogUtils.hideProgressDialog();
        final statusofItemLogic = Get.find<StatusofItemLogic>();
        // statusofItemLogic.onTabChange(2);
        statusofItemLogic.callShipmentStatusChange(
            shipmentId: packageId.value,
            status_to_change: PackageDeliveryStatus.Delivered,
            shipment_status: PackageDeliveryStatus.Delivered);
        statusofItemLogic.tabController.index = 2;
        Get.back();

      } else {
        Const().toast(shipmentImage.message);
        ProgressDialogUtils.hideProgressDialog();
        Get.back();
      }
      // Get.toNamed(AppRoutes.shipmentSummaryScreen, arguments: {
      //   NavigationArgs.cShipmentId :   shipmentId,
      // });
    }, onError: (error) {
      debugPrint('registerApi 112: ' + error.toString());

      Const().toast(error.toString());
      ProgressDialogUtils.hideProgressDialog();

    });
  }
}
