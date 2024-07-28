import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:package_delivery/AppRoute/NavigationArgs.dart';
import 'package:package_delivery/AppRoute/app_route.dart';
import 'package:package_delivery/Constant/app_constant.dart';
import 'package:package_delivery/Constant/app_image.dart';
import 'package:package_delivery/Constant/appstyle.dart';
import 'package:package_delivery/Constant/colors.dart';
import 'package:package_delivery/Screen/home/home_controller.dart';
import 'package:package_delivery/Screen/statusofitem/statusof_item_model.dart';
import 'package:package_delivery/Screen/statusofitem/statusofitem_controller.dart';
import 'package:package_delivery/widget/customDialog.dart';
import 'package:package_delivery/widget/data_not_found_widget.dart';

class PackedStatusWidget extends StatelessWidget {
  PackedStatusWidget({
    Key? key,
  }) : super(key: key);
  final controller = Get.find<StatusofItemLogic>();
  final controllerHome = Get.find<HomeLogic>();
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.all(w / 20),
      child: Obx(() {
        return controller.isShipmentItemLoad.value == true
            ? DataNotFoundWidget()
            : ListView.separated(
                itemCount: controller.pendingShipmentItemList.value.length,
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: h / 50,
                  );
                },
                itemBuilder: (context, index) {
                  ShipmentItem shipmetItem =
                      controller.pendingShipmentItemList.value[index];
                  return shipmetItem.payment_status==ShipmentPaymantStatus.paid? Container(
                    width: double.infinity,
                    // height: 50,
                    padding: EdgeInsets.all(getHorizontalSize(15)),
                    decoration: BoxDecoration(
                      border: Border.all(color: cGreyLight, width: 2.0),
                      color: cWhite,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10.0)),
                      boxShadow: [
                        BoxShadow(
                          color: cGreyLight,
                          spreadRadius: 0.5,
                          blurRadius: 0.5,
                          offset:
                              const Offset(0, 0), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text.rich(
                              TextSpan(
                                text: "Order Id ",
                                style: AppStyle.textStyleRobotoMediumGrey15,
                                children: [
                                  TextSpan(
                                    text: shipmetItem.trackingId!,
                                    style: AppStyle.textStyleRobotoBoldBlue15,
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                //TODO 14-02-2022 => M9
                                Get.toNamed(AppRoutes.drivermaptrakingScreen,
                                    arguments: {
                                      NavigationArgs.dShipmentItem:
                                          shipmetItem.id
                                    });
                              },
                              child: Container(
                                width: getHorizontalSize(20),
                                height: getHorizontalSize(20),
                                child: SvgPicture.asset(
                                  Assets.iconDistanceTrack,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          color: cGreyDivider,
                          thickness: 1,
                          height: h / 40,
                        ),
                        Row(
                          children: [
                            Container(
                              width: getHorizontalSize(20),
                              height: getHorizontalSize(20),
                              child: SvgPicture.asset(
                                Assets.iconPeople,
                                fit: BoxFit.contain,
                                color: cBlue,
                              ),
                            ),
                            SizedBox(
                              width: getHorizontalSize(10),
                            ),
                            Flexible(
                              child: Text(
                                shipmetItem.receiverName!,
                                style: AppStyle.textStyleRobotoMediumBlue15,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: getVerticalSize(10),
                        ),
                        controllerHome.userRoleid.value == UserRoles.driver ?Row(
                          children: [
                            Container(
                              width: getHorizontalSize(20),
                              height: getHorizontalSize(20),
                              child: SvgPicture.asset(
                                Assets.iconCall2,
                                fit: BoxFit.contain,
                                color: cBlue,
                              ),
                            ),
                            SizedBox(
                              width: getHorizontalSize(10),
                            ),
                            Text(
                              shipmetItem.receiverPhoneNumber!,
                              style: AppStyle.textStyleDarkRobotoMediumDarkGrey15,
                            ),
                          ],
                        ):const SizedBox.shrink(),
                        controllerHome.userRoleid.value == UserRoles.driver ? SizedBox(height: getVerticalSize(15)):const SizedBox.shrink(),
                        Row(
                          children: [
                            Container(
                              width: getHorizontalSize(20),
                              height: getHorizontalSize(20),
                              child: SvgPicture.asset(
                                Assets.iconLocationpin,
                                fit: BoxFit.contain,
                                color: cBlue,
                              ),
                            ),
                            SizedBox(
                              width: getHorizontalSize(10),
                            ),
                            Flexible(
                              child: Text(
                                shipmetItem.deliveryAddress!,
                                style: AppStyle.textStyleRobotoMediumGrey15,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: getVerticalSize(10),
                        ),
                        Row(
                          children: [
                            Container(
                              width: getHorizontalSize(20),
                              height: getHorizontalSize(20),
                              child: SvgPicture.asset(
                                Assets.iconTime,
                                fit: BoxFit.fill,
                              ),
                            ),
                            SizedBox(
                              width: getHorizontalSize(10),
                            ),
                            Flexible(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Distance",
                                    style: AppStyle.textStyleRobotoMediumGrey15,
                                  ),
                                  Text(
                                    "(${shipmetItem.distance} KM)",
                                    style: AppStyle.textStyleRobotoBoldBlue15,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: h / 45,
                        ),
                        Container(
                          width: double.infinity,
                          height: h / 25,
                          child: TextButton(
                              onPressed: () {
                                //TODO 14-02-2022 => M9
                                uploadPhoto(context, shipmetItem.id!,
                                    shipmetItem.trackingId!);
                              },
                              style: TextButton.styleFrom(
                                  primary: cWhite,
                                  padding: EdgeInsets.zero,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  backgroundColor: cBlue),
                              child: Text("Go To Delivery",
                                  style: AppStyle.textStyleRobotoBoldWhite20)),
                        )
                      ],
                    ),
                  ):const SizedBox.shrink();
                },
              );
      }),
    );
  }

  void uploadPhoto(BuildContext c, int packageId, String trackingId) {
    dialogWithDivider(
        c,
        'You can upload image directly through Camera or Gallery',
        'Cancel',
        'Delete', () {
      _handleURLButtonPress(c, ImageSource.camera, packageId, trackingId);
      debugPrint(" =====> ON CLICK CAMERA <===== ");
      // Get.back();
    }, () {
      _handleURLButtonPress(c, ImageSource.gallery, packageId, trackingId);
      debugPrint(" =====> ON CLICK GALLERY <===== ");
    });
  }

  _handleURLButtonPress(
      BuildContext context, var type, int packageId, String trackingId) async {
    XFile? image = await controller.picker.value.pickImage(
        source: type, imageQuality: 60, maxHeight: 250, maxWidth: 250);
    try {
      if(image != null){
        controller.image1!.value = File(image.path);
        Get.back();
        print('_handleURLButtonPress => controller.image1.value : ${controller.image1!.value}');
        Get.toNamed(AppRoutes.uploadDeliveredImageScreen, arguments: {
          NavigationArgs.imageUpload: controller.image1,
          NavigationArgs.cShipmentId: trackingId,
          NavigationArgs.cPackageId: packageId
        });
      }else{
        Get.back();
      }
    } catch (e) {
      debugPrint('_handleURLButtonPress => ERROR : $e');
    }

    if (controller.image1!.value != '' && controller.image1!.value != null) {

    }
  }
}
