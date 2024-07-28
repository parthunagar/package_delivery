import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:package_delivery/AppRoute/app_route.dart';
import 'package:package_delivery/Constant/app_image.dart';
import 'package:package_delivery/Constant/appstyle.dart';
import 'package:package_delivery/Constant/colors.dart';
import 'package:package_delivery/Screen/notification_list/notification_list_logic.dart';
import 'package:package_delivery/widget/custom_new_appbar.dart';
import 'package:package_delivery/widget/data_not_found_widget.dart';

class NotificationListWidget extends GetView<NotificationListLogic> {
  const NotificationListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final logic = Get.find<NotificationListLogic>();
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: cDarkBlue,
      appBar: CustomNewAppBar(
        title: 'Notification',
        leading: Icons.arrow_back_ios_rounded,
        // leading: Icon(Icons.arrow_back_ios_rounded),
        onTap: () {
          Get.back();
        },
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: w * 0.04, vertical: h * 0.01),
        child: Obx(() {
          return controller.isDataLoad.value == true ?
          DataNotFoundWidget() :
          ListView.separated(
              itemCount: controller.notificationList.value.length,
              separatorBuilder: (_, __) => SizedBox(height: h * 0.01),
              itemBuilder: ((context, index) {
                return
                  // Slidable(
                  //   enabled: true,
                  //   endActionPane: ActionPane(
                  //     motion: const StretchMotion(),
                  //     children: [
                  //       SlidableAction(onPressed: onClickDelete, backgroundColor: cRedOpacity, foregroundColor: cRed, icon: Icons.delete,),
                  //     ],
                  //   ),
                  //   child:
                GestureDetector(
                  onTap: () {
                    //TODO: ON NOTIFICATION CLICK
                    debugPrint(' =========> ON CLICK NOTIFICATION<========= ');
                    // Get.toNamed(AppRoutes.selectDispatcherScreen);
                  },
                  child: Container(
                    // width: double.infinity,
                    // padding: EdgeInsets.all(getHorizontalSize(15)),
                    padding: EdgeInsets.symmetric(horizontal: w * 0.04, vertical: h * 0.02),
                    decoration: BoxDecoration(
                      // border: Border.all(color: cGreyLight, width: 1.0),
                      color: cWhite,
                      borderRadius: const BorderRadius.all(Radius.circular(10.0),),
                      // boxShadow: [
                      //   BoxShadow(
                      //     color: cGreyLight,
                      //     spreadRadius: 2,
                      //     blurRadius: 2,
                      //     offset: const Offset(0, 3), // changes position of shadow
                      //   ),
                      // ],
                    ),
                    child: Row(
                      children: [

                        ///Notification_status :
                        ///0 => Package_in_Transit ,
                        ///1 => Delayed_Package,
                        ///2 => Payment_Processed,
                        ///3 =>Package_Received,
                        ///4 => Pending_Invoice
                        controller.notificationList.value[index].notificaionStatus == 0
                            ? SvgPicture.asset(Assets.iconNotificationTransit, height: h * 0.07)
                            : controller.notificationList.value[index].notificaionStatus == 1
                            ? SvgPicture.asset(Assets.iconNotificationPackage, height: h * 0.07)
                            : controller.notificationList.value[index].notificaionStatus == 2
                            ? SvgPicture.asset(Assets.iconNotificationProcess, height: h * 0.07)
                            : controller.notificationList.value[index].notificaionStatus == 3
                            ? SvgPicture.asset(Assets.iconNotificationReceived, height: h * 0.07)
                            : SvgPicture.asset(Assets.iconNotificationInvoice, height: h * 0.07),
                        SizedBox(width: w * 0.02),
                        Expanded(child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  controller.notificationList.value[index].notificaionStatus == 0
                                      ? 'Package in Transit'
                                      : controller.notificationList.value[index].notificaionStatus == 1
                                      ? 'Delayed Package'
                                      : controller.notificationList.value[index].notificaionStatus == 2
                                      ? 'Payment Processed '
                                      : controller.notificationList.value[index].notificaionStatus == 3
                                      ? 'Package Received'
                                      : 'Pending Invoice',
                                  style: AppStyle.textStyleRobotoMediumBlack15,),
                                Text( controller.notificationList.value[index].orderId,style: AppStyle.textStyleRobotoMediumBlue15),
                              ],
                            ),
                            SizedBox(height: h * 0.005),
                            // RichText(text: TextSpan(
                            //     children: [
                            //       TextSpan(text: 'Your Order, ', style: AppStyle.textStyleRobotoRegularGrey15),
                            //       TextSpan(text: 'BAN968 ', style: AppStyle.textStyleRobotoMediumBlue15),
                            //       TextSpan(text: 'is delivered Successfully', style: AppStyle.textStyleRobotoRegularGrey15),
                            //     ]
                            // )),
                            RichText(text: TextSpan(
                                children: [
                                  TextSpan(text: controller.notificationList.value[index].notificationDetails, style: AppStyle.textStyleRobotoRegularGrey15),
                                  // TextSpan(text:  controller.notificationList.value[index].orderId, style: AppStyle.textStyleRobotoMediumBlue15),
                                ]
                            )),
                          ],
                        ))
                      ],
                    ),
                  ),
                );

                // );

              })
          );
        }),

      ),
    );


  }

  void onClickDelete(BuildContext c) {
    Get.toNamed(AppRoutes.selectDispatcherScreen);
    // dialogWithDivider(c,
    //     'Are you sure to delete this product?',
    //     'Cancel', 'Delete', () {
    //       debugPrint(" =====> ON CLICK CANCEL <===== ");
    //       Get.back();
    //     }, () {
    //       debugPrint(" =====> ON CLICK DELETE <===== ");
    //     });
  }

}
