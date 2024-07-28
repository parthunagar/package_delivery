import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:package_delivery/Constant/app_image.dart';
import 'package:package_delivery/Constant/appstyle.dart';
import 'package:package_delivery/Constant/colors.dart';
import 'package:package_delivery/Screen/statusofitem/delivered_status_widget.dart';
import 'package:package_delivery/Screen/statusofitem/packed_status_widget.dart';
import 'package:package_delivery/Screen/statusofitem/pending_status_widget.dart';
import 'package:package_delivery/Screen/statusofitem/statusofitem_controller.dart';
import 'package:package_delivery/widget/custom_appbar.dart';
import 'package:package_delivery/widget/custom_new_appbar.dart';

class StatusofItemWidget extends GetView<StatusofItemLogic> {
  @override
  Widget build(BuildContext context) {
    final logic = Get.find<StatusofItemLogic>();
    var h = MediaQuery
        .of(context)
        .size
        .height;
    var w = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      appBar: CustomAppBar(
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Container(
            width: w / 14,
            height: w / 14,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: cBlue, // Colors.red,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                    blurRadius: getHorizontalSize(5),
                    color: Colors.black12,
                    spreadRadius: 1)
              ],
            ),
            child: Icon(Icons.arrow_back_ios_rounded,
                size: getFontSize(15), color: cWhite),
          ),
        ),
        title: 'Status of item',
        titleStyle: AppStyle.textStyleRobotoBoldWhite25,
        action: [],
      ),
      backgroundColor: cDarkBlue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                color: cDarkBlue,
              )),
            ),
            constraints: BoxConstraints.expand(height: 50),
            child: TabBar(
                indicatorColor: cBlue,
                labelColor: cWhite,
                unselectedLabelColor: cGrey,
                onTap: controller.onTabChange,
                controller: controller.tabController,
                labelStyle: AppStyle.textStyleRobotoBoldWhite18,
                unselectedLabelStyle: AppStyle.textStyleRobotoMediumBlue15,
                tabs: [...controller.myTabs]),
          ),
          Expanded(
            child: Container(
              child: TabBarView(
                controller: controller.tabController,
                children: [
                  InProgressStatusWidget(),
                  PackedStatusWidget(),
                  DeliveredStatusWidget(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}






