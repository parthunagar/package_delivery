import 'dart:async';

import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:package_delivery/Constant/appstyle.dart';
import 'package:package_delivery/Constant/colors.dart';
import 'package:package_delivery/widget/custom_appbar.dart';
import 'package:package_delivery/widget/mypackagedrivertracking.dart';

import 'drivermaptraking_logic.dart';

class DrivermaptrakingWidget extends GetView<DrivermaptrakingLogic> {
  DrivermaptrakingWidget({Key? key}) : super(key: key);
  Completer<GoogleMapController> googleMapController = Completer();

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<DrivermaptrakingLogic>();
    var h = MediaQuery
        .of(context)
        .size
        .height;
    var w = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(body: Stack(
      children: [
        //TODO : 02-02-2022
        // SizedBox()

        Obx(() {
          return GoogleMap(
            mapType: MapType.normal,
            myLocationEnabled: true,
            zoomControlsEnabled: false,
            markers: Set<Marker>.of(controller.allMarkers),
            polylines: Set<Polyline>.of(controller.allPolylines),
            initialCameraPosition: controller.kGooglePlex.value,
            onTap: (position) {
              controller.customInfoWindowController.value
                  .hideInfoWindow!();
            },
            onCameraMove: (position) {
              controller.customInfoWindowController.value.onCameraMove!();
            },


            onMapCreated: (GoogleMapController mapController) {
              googleMapController.complete(mapController);
              print('controller.latLang.value :' + controller.latLang
                  .value.latitude.toString() + ' : ' + controller.latLang
                  .value.latitude.toString());
              controller.mGoogleMapController = mapController;
              controller.customInfoWindowController.value
                  .googleMapController = mapController;
            },

          );
        }),
        CustomInfoWindow(
          controller: controller.customInfoWindowController.value,
          height: h * 0.08,
          width: w * 0.75,
          offset: 25,
        ),
        Positioned(
          top: 1,
          child: CustomAppBar(
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
            title: '',
            titleStyle: AppStyle.textStyleRobotoBoldBlue25,
            action: [],
          ),
        ),
        Positioned(
          bottom: h * 0.01,
          child: Obx(() {
            return controller.isShipmentSummaryDataLoad.value?Container(
              width: w,
              height: h*0.29,
              padding: EdgeInsets.symmetric(horizontal: w*0.05,vertical: h*0.05),
              child: MyPackageDriverTraking(
                  shipmentItem: controller.shipmentItem.value),
            ):SizedBox();
          }),
        ),
      ],
    ),);
  }
}
