import 'dart:async';

import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:package_delivery/AppRoute/app_route.dart';
import 'package:package_delivery/Constant/app_image.dart';
import 'package:package_delivery/Constant/appstyle.dart';
import 'package:package_delivery/Constant/colors.dart';
import 'package:package_delivery/Screen/dashboard/dashboard_controller.dart';
import 'package:package_delivery/widget/clip.dart';
import 'package:package_delivery/widget/custom_appbar.dart';
import 'package:package_delivery/widget/custom_new_appbar.dart';
import 'package:package_delivery/widget/text_input_filed_serch.dart';

import 'traking_logic.dart';

class TrakingWidget extends GetView<TrakingLogic> {
  TrakingWidget({Key? key}) : super(key: key);

  Completer<GoogleMapController> googleMapController = Completer();

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<TrakingLogic>();

    final dashboardcontroller = Get.find<DashboardLogic>();
    var h = MediaQuery
        .of(context)
        .size
        .height;
    var w = MediaQuery
        .of(context)
        .size
        .width;


    return Scaffold(
      // physics:const NeverScrollableScrollPhysics(),
      backgroundColor: cWhite,
      resizeToAvoidBottomInset: true,
      body:
      Stack(
        children: [
          Stack(
            children: [
              //TODO : 05-02-2022 => M6
              // SizedBox()
              Obx(() {
                return GoogleMap(
                  mapType: MapType.normal,
                  myLocationEnabled: false,
                  zoomControlsEnabled: false,
                  markers: Set<Marker>.of(controller.allMarkers),
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
            ],
          ),

          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomAppBar(
                leading: GestureDetector(
                  onTap: () {
                    dashboardcontroller.openDrawer();
                  },
                  child: Container(
                    width: w / 14,
                    height: w / 14,
                    margin: EdgeInsets.only(left: w * 0.04),
                    child: SvgPicture.asset(
                      Assets.iconSideMenuLines,
                      width: w / 14,
                      height: w / 14,
                      color: cBlue,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                title: 'Track Your Package',
                titleStyle: AppStyle.textStyleRobotoBoldBlue25,
                action: [
                  GestureDetector(
                    onTap: () {
                      //TODO: ADD COMMENT
                      Get.toNamed(AppRoutes.notificationListScreen);
                      // Get.toNamed(AppRoutes.selectDispatcherScreen);
                    },
                    child: Container(
                      width: w / 14,
                      height: w / 14,
                      margin: EdgeInsets.only(right: w * 0.04),
                      child: SvgPicture.asset(
                        Assets.iconBellWhiteBlueBorderBlue,
                        width: w / 14,
                        height: w / 14,
                        // color: cBlack,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),


              // TODO : 08-02-2022 => M7
              Container(
                alignment: Alignment.center,
                color: cWhite,
                height: h * 0.15,
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Container(
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
                      prefixWidget: GestureDetector(
                        onTap: () {
                          if(controller.cTrackId!.text.trim().isEmpty != true ){
                            controller.callTrackingList(trackId: controller.cTrackId!.text);
                            print('onSerchPressed');
                          }
                          else{
                            print('onSerchPressed');
                          }



                        },
                        child: Padding(
                          padding: EdgeInsets.all(h * 0.014),
                          child: SvgPicture.asset(Assets.iconSearch),
                        ),),
                      label: '#1234563',
                      textInputType: TextInputType.text),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
