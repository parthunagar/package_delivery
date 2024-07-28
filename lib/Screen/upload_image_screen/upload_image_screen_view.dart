import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_delivery/Constant/app_constant.dart';
import 'package:package_delivery/Constant/appstyle.dart';
import 'package:package_delivery/Constant/colors.dart';
import 'package:package_delivery/widget/custom_appbar.dart';
import 'package:package_delivery/widget/custom_button.dart';

import 'upload_image_screen_logic.dart';

class UploadImageScreenWidget extends GetView<UploadImageScreenLogic> {
  const UploadImageScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<UploadImageScreenLogic>();
    var h = MediaQuery
        .of(context)
        .size
        .height;
    var w = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      backgroundColor: cDarkBlue,
      appBar: CustomAppBar(
      leading: Container(
        decoration: BoxDecoration(
          color: cBlue,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
                blurRadius: getHorizontalSize(5),
                color: Colors.black12,
                spreadRadius: 1)
          ],
        ),
        height: getHorizontalSize(30),
        width: getHorizontalSize(30),
        child: IconButton(
          icon: Icon(Icons.arrow_back_ios_rounded),
          iconSize: getFontSize(15),
          color: cWhite,
          onPressed: () {
            print("onBackPressed");
            Get.back();
          },
          tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        ),
      ),
        title: 'Shipment Delivered',
    ),
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: h * 0.28,
            width: w - 30,
            margin: EdgeInsets.symmetric(vertical: h*0.05),
            decoration: BoxDecoration(
              border: Border.all(color: cDarkBlue, width: 2.0),
              image: DecorationImage(image: FileImage(controller.image1!.value), fit: BoxFit.fill),
              color: cWhite,
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            ),
          ),
          CustomButton(
            title: 'Submit',
            padding: EdgeInsets.symmetric(horizontal: w * 0.1,vertical: h * 0.02),
            // onPressed: controller.submitOtpVerification,
            onPressed: () {
controller.callShipmentImageUpload();
            },
          ),
        ],
      ),
    );
  }
}
