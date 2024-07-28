import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:package_delivery/Constant/app_constant.dart';
import 'package:package_delivery/Constant/app_image.dart';
import 'package:package_delivery/Constant/appstyle.dart';
import 'package:package_delivery/Constant/colors.dart';
import 'package:package_delivery/Screen/home/home_controller.dart';
import 'package:package_delivery/Screen/statusofitem/statusof_item_model.dart';
import 'package:package_delivery/Screen/statusofitem/statusofitem_controller.dart';
import 'package:package_delivery/widget/data_not_found_widget.dart';

class DeliveredStatusWidget extends StatelessWidget {
  DeliveredStatusWidget({
    Key? key,
  }) : super(key: key);
  final controller = Get.find<StatusofItemLogic>();
  final controllerHome = Get.find<HomeLogic>();
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery
        .of(context)
        .size
        .height;
    var w = MediaQuery
        .of(context)
        .size
        .width;

    return Padding(
      padding: EdgeInsets.all(w / 20),
      child: Obx(() {
        return controller.isShipmentItemLoad.value == true ?
        DataNotFoundWidget():ListView.separated(
          itemCount: controller.pendingShipmentItemList.value.length,
          separatorBuilder: (context, index) {
            return SizedBox(height: h / 50);
          },
          itemBuilder: (context, index) {
            ShipmentItem shipmetItem = controller.pendingShipmentItemList.value[index];
            var dateTime = DateFormat("yyyy-MM-dd HH:mm:ss.SSS'Z'").parse(shipmetItem.updatedAt!.toString(), true);
            var dateLocal = dateTime.toLocal();
            final DateFormat formatter = DateFormat.yMd();
            final DateFormat formatterTime = DateFormat.jm();
            final String formattedDate = formatter.format(dateLocal);
            final String formattedTime = formatterTime.format(dateLocal);
            return Container(
              width: double.infinity,
              // height: 50,
              padding: EdgeInsets.all(getHorizontalSize(15)),
              decoration: BoxDecoration(
                border: Border.all(color: cGreyLight, width: 2.0),
                color: cWhite,
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                boxShadow: [
                  BoxShadow(
                    color: cGreyLight,
                    spreadRadius: 0.5,
                    blurRadius: 0.5,
                    offset: Offset(0, 0), // changes position of shadow
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
                              text: shipmetItem.trackingId,
                              style: AppStyle.textStyleRobotoBoldBlue15,
                            ),
                          ],
                        ),
                      ),
                      Text(
                        formattedDate,
                        style: AppStyle.textStyleRobotoBoldBlue15,
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Delivery Time",
                              style: AppStyle.textStyleRobotoMediumGrey15,
                            ),
                            Text(
                              formattedTime,
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
                  Row(
                    children: [
                      Flexible(
                        flex: 7,
                        child: Container(
                          height: w / 7,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: shipmetItem.getDeliveredShipment!.isEmpty?0:1,
                            itemBuilder: (context, index) {
                              return Container(
                                width: w / 7,
                                height: w / 7,
                                child: ClipRRect
                                  (
                                  borderRadius:
                                  BorderRadius.circular(10),
                                  child: Image.network(
                                    shipmetItem.getDeliveredShipment![0]
                                        .deliveredShipmentImage,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                width: w / 20,
                              );
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        width: w / 22,
                      ),
                      Container(
                        padding: EdgeInsets.all(getHorizontalSize(5)),
                        decoration: BoxDecoration(
                            color: cParrotOpacity,
                            borderRadius: BorderRadius.circular(5)),
                        child: Text(
                          'Delivered',
                          style: AppStyle.textStyleRobotoMediumParrot15,
                        ),
                      )
                    ],
                  )
                ],
              ),
            );
          },
        );
      }),
    );
  }
}