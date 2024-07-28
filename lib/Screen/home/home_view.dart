import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:package_delivery/AppRoute/NavigationArgs.dart';
import 'package:package_delivery/AppRoute/app_route.dart';
import 'package:package_delivery/Constant/app_constant.dart';
import 'package:package_delivery/Constant/app_image.dart';
import 'package:package_delivery/Constant/appstyle.dart';
import 'package:package_delivery/Constant/colors.dart';
import 'package:package_delivery/Screen/dashboard/dashboard_controller.dart';
import 'package:package_delivery/Screen/home/shipmet_list_model.dart';
import 'package:package_delivery/Screen/shipmentsummary/shipmentsummary_controller.dart';
import 'package:package_delivery/widget/custom_appbar.dart';
import 'package:package_delivery/widget/custom_new_appbar.dart';
import 'package:package_delivery/widget/data_not_found_widget.dart';
import 'package:package_delivery/widget/mypackage.dart';
import 'package:package_delivery/widget/text_input_filed.dart';
import 'package:package_delivery/widget/text_input_filed_serch.dart';

import 'home_controller.dart';

class HomeWidget extends GetView<HomeLogic> {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<HomeLogic>();
    final dashboardcontroller = Get.find<DashboardLogic>();

    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            // mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: getHorizontalSize(15)),
                height: h / 2.5,
                decoration:  BoxDecoration(
                  color: cBlue,
                  image: const DecorationImage(
                      image: AssetImage(Assets.iconHomeBackgroundScreen),
                      fit: BoxFit.cover),
                ),
                child: Column(
                  children: [
                    //Appbar
                    CustomAppBar(
                      leading: GestureDetector(
                        onTap: () {
                          dashboardcontroller.openDrawer();
                          dashboardcontroller.changeval(DrawerEnum.home);
                        },
                        child: Container(
                          width: w / 14,
                          height: w / 14,
                          child: SvgPicture.asset(
                            Assets.iconSideMenuLines,
                            width: w / 14,
                            height: w / 14,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      title: 'Home',
                      titleStyle: AppStyle.textStyleRobotoBoldWhite25,
                      action: [
                        GestureDetector(
                          onTap: () {
                            //TODO: ADD COMMENT
                            Get.toNamed(AppRoutes.notificationListScreen);
                            // Get.toNamed(AppRoutes.paymentMethodScreen);
                            // Get.toNamed(AppRoutes.selectDispatcherScreen);
                          },
                          child: SizedBox(
                            width: w / 14,
                            height: w / 14,
                            child: SvgPicture.asset(
                              Assets.iconBellWhiteBlueBorder,
                              width: w / 14,
                              height: w / 14,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ],
                    ),
                    //container body
                    SizedBox(
                      height: getVerticalSize(40),
                    ),
                    Text(
                      'Track Your Packages',
                      style: AppStyle.textStyleRobotoBoldWhite25,
                    ),
                    SizedBox(
                      height: getVerticalSize(10),
                    ),
                    Text(
                      'Please enter your tracking number.',
                      style: AppStyle.textStyleRobotoMediumGreyLight15,
                    ),
                    SizedBox(
                      height: getVerticalSize(50),
                    ),
                    //TODO:: TextField
                    Container(
                      decoration: const BoxDecoration(
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Colors.black26,
                              blurRadius: 10.0,
                              offset: Offset(0.0, 0.75))
                        ],
                      ),
                      child: TextInputFindOutSerch(
                          controller: controller.cTrackId,
                          prefixWidget: Container(
                            padding: EdgeInsets.all(h * 0.015),
                            child: SvgPicture.asset(
                              Assets.iconBottomMyPackageGray,
                            ),
                          ),
                          suffixWidget: GestureDetector(
                              onTap: () {
                                controller.callShipmentList(trackId: controller.cTrackId!.text);
                                print('onSerchPressed');
                              },
                             child: Padding(
                               padding: EdgeInsets.all(h * 0.014),
                               child: SvgPicture.asset(Assets.iconSearch),
                             ),),
                          label: '#1234563',
                          textInputType: TextInputType.text),
                    ),
                  ],
                ),
              ),
              Container(
                color: cDarkBlue,
                padding:
                    EdgeInsets.symmetric(horizontal: getHorizontalSize(15)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // SizedBox(height: getVerticalSize(10)),
                    SizedBox(height: h * 0.025),
                    Text('Recent Activity', style: AppStyle.textStyleDarkRobotoMediumWhite20),
                    SizedBox(height: h * 0.015),

                    Obx(() {
                      print('controller.shipmentList.value.length : ' + controller.shipmentItemList.value.length.toString());
                      return Container(
                        // alignment: Alignment.bottomCenter,
                        height: h * 0.48,
                        child:
                        controller.isShipmentItemLoad.value == true ?
                        DataNotFoundWidget() :
                        ListView.separated(
                            scrollDirection: Axis.vertical,
                            itemCount: controller.shipmentItemList.value.length,
                            shrinkWrap: true,
                            padding: EdgeInsets.only(top: h * 0.01,bottom: h*0.05),
                            // primary: false,
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                height: getVerticalSize(10),
                              );
                            },
                            itemBuilder: (context, index) {
                              shipment shipmentItem = controller.shipmentItemList.value[index];
                              print('controller.userRoleid.value : ' + controller.userRoleid.value.toString() + '\n ' + 'shipmentItem.payment_status : '+ shipmentItem.payment_status.toString());
                              return GestureDetector(
                                onTap: () {
                                  debugPrint('shipmentItem.shipmentStatus : ${shipmentItem.shipmentStatus}');
                                  debugPrint('shipmentItem.receiverName : ${shipmentItem.receiverName}');
                                  debugPrint('shipmentItem.getDriver!.name : ${shipmentItem.getDriver!.name}');
                                  // debugPrint('shipmentItem : ${shipmentItem.}');
                                  // debugPrint('shipmentItem : ${shipmentItem.shipmentStatus}');

                                  if(controller.userRoleid.value == UserRoles.customer &&
                                      controller.shipmentItemList.value[index].shipmentStatus != PackageDeliveryStatus.Delivered &&
                                      controller.shipmentItemList.value[index].shipmentStatus != PackageDeliveryStatus.Failed &&
                                      controller.shipmentItemList.value[index].payment_status == ShipmentPaymantStatus.paid){
                                    dashboardcontroller.changeTabIndex(2, trakingId: controller.shipmentItemList.value[index].trackingId);
                                  } else if(controller.userRoleid.value == UserRoles.customer &&
                                      controller.shipmentItemList.value[index].payment_status == ShipmentPaymantStatus.notPaid) {
                                    double amount = double.parse(controller.shipmentItemList.value[index].amount!)* 100;
                                    print('amount.round()' + amount.round().toString());
                                    //TODO: APPLY COUPEN CODE : 25/03/2022
                                    // demoUI(context,h,w);
                                    // showCouponDialog(context);
                                    controller.startCharge(context,h,w, amount.round(),controller.shipmentItemList.value[index].id.toString());
                                  }

                                  // Get.toNamed(AppRoutes.reviewScreen,parameters: {
                                  //   NavigationArgs.kUserName: shipmentItem.getDriver.name.toString()
                                  // });
                                },

                                  child:controller.userRoleid.value == UserRoles.customer ?
                                  MyPackage(shipmentItem: shipmentItem,userRollId : controller.userRoleid.value,orderid: shipmentItem.trackingId,):
                                  controller.userRoleid.value == UserRoles.driver && shipmentItem.payment_status == ShipmentPaymantStatus.paid ?
                                  MyPackage(shipmentItem: shipmentItem,userRollId : controller.userRoleid.value,orderid: shipmentItem.trackingId,):
                                  controller.userRoleid.value == UserRoles.comapany && shipmentItem.payment_status == ShipmentPaymantStatus.paid ?
                                  MyPackage(shipmentItem: shipmentItem,userRollId : controller.userRoleid.value,orderid: shipmentItem.trackingId,):
                                  const SizedBox.shrink(),
                              );
                              // return RecentActivityWidget(shipmentItem);
                            }),
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: controller.userRoleid.value == UserRoles.customer
            // ||controller.userRoleid.value == UserRoles.comapany
            ? FloatingActionButton(
                onPressed: () {
                  // Get.toNamed(AppRoutes.selectDispatcherScreen);
                  Get.toNamed(AppRoutes.basicDetailsScreen);
                  // Add your onPressed code here!
                },
                backgroundColor: cBlue,
                child: SvgPicture.asset(Assets.iconSendPackageBlue, fit: BoxFit.cover))
            : SizedBox(),
      ),
    );
  }
 }

class RecentActivityWidget extends StatelessWidget {
  shipment shipmentItem;

  RecentActivityWidget(
    this.shipmentItem, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.all(5.0),
      // margin: EdgeInsets.symmetric(horizontal: getHorizontalSize(15)),
      // padding: EdgeInsets.symmetric(horizontal: getHorizontalSize(15)),
      decoration: BoxDecoration(
        border: Border.all(color: cGreyLight, width: 1.0),
        color: cWhite,
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        boxShadow: <BoxShadow>[BoxShadow(color: cGreyLight, blurRadius: 1.0, offset: const Offset(0.0, 0.0))],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Dec 16, 2021', style: AppStyle.textStyleRobotoMediumGrey15),
                Text('Order Id ' + shipmentItem.trackingId!, style: AppStyle.textStyleRobotoMediumBlue15),
              ],
            ),
          ),
          Container(height: getVerticalSize(1), color: cGreyLight),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: getHorizontalSize(20),
                      height: getHorizontalSize(20),
                      child: SvgPicture.asset(Assets.iconPeople, fit: BoxFit.contain, color: cBlue)),
                    SizedBox(width: getHorizontalSize(10)),
                    Text('Order Id £ BAN', style: AppStyle.textStyleRobotoMediumBlue15),
                  ],
                ),
                SizedBox(height: getVerticalSize(10)),
                Row(
                  children: [
                    SizedBox(
                      width: getHorizontalSize(20),
                      height: getHorizontalSize(20),
                      child: SvgPicture.asset(Assets.iconLocationpin, fit: BoxFit.contain, color: cBlue)),
                    SizedBox(width: getHorizontalSize(10)),
                    Flexible(child: Text('35 Keavy Court Fredericksburg, va, 22401 United States', style: AppStyle.textStyleRobotoMediumBlack15)),
                  ],
                ),
                SizedBox(height: getVerticalSize(10)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: getHorizontalSize(20),
                          height: getHorizontalSize(20),
                          child: SvgPicture.asset(
                            Assets.iconDriverfilloutblue,
                            fit: BoxFit.contain,
                            color: cBlue,
                          ),
                        ),
                        SizedBox(width: getHorizontalSize(10)),
                        Text('Asiwaji Samuel', style: AppStyle.textStyleRobotoMediumBlack15),
                      ],
                    ),
                    IntrinsicWidth(
                      child: Container(
                        padding: EdgeInsets.all(getHorizontalSize(5)),
                        decoration: BoxDecoration(color: cParrotOpacity, borderRadius: BorderRadius.circular(5)),
                        child: Text('Delivered', style: AppStyle.textStyleRobotoMediumParrot15),
                      ),
                    )
                  ],
                ),
                SizedBox(height: getVerticalSize(10)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
