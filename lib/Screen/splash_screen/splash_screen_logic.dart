import 'dart:async';


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_delivery/AppRoute/app_route.dart';
import 'package:package_delivery/Constant/app_constant.dart';
import 'package:package_delivery/Utils/preference.dart';
import 'package:package_delivery/widget/backloc_view.dart';
import 'package:permission_handler/permission_handler.dart';

enum PermissionGroup {


  /// Android: Fine and Coarse Location
  /// iOS: CoreLocation - Always
  locationAlways,

  /// Android: Fine and Coarse Location
  /// iOS: CoreLocation - WhenInUse
  locationWhenInUse
}

class SplashScreenLogic extends GetxController {


  RxBool? isLogin = false.obs;
  // Future getLogin() async {
  //   isLogin = await Preference().readBool(Const.prefIsLoggedIn) ?? false;
  //   debugPrint('getLogin => isLogin : $isLogin');
  // }

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    // await getLogin();
    isLogin!.value = await Preference().readBool(Const.prefIsLoggedIn) ?? false;
    debugPrint('getLogin => isLogin : $isLogin');
    if (await Permission.location.isDenied &&
        await Permission.locationAlways.isDenied &&
        await Permission.locationWhenInUse.isDenied ){
      Get.defaultDialog(
        title: "",
        titlePadding: EdgeInsets.zero,
        content:  TrackDialog(
          onTapAllow: (){
            print('onTapAllow : ');
            Get.back();
            CheckPremission();
          },
          onTapDeny: (){
            Get.back();
            print('onTapDeny : ');
          },
        ),
      );

    }else{
      Timer(const Duration(seconds: 3), () {
        //TODO M1
        isLogin!.value == true ? Get.offNamed(AppRoutes.dashboardScreen) : Get.offNamed(AppRoutes.signInScreen);
        // Get.offNamed(AppRoutes.signInScreen);
      });
    }
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

  void CheckPremission() async{
    if (await Permission.location.request().isGranted&&await Permission.locationWhenInUse.request().isGranted) {
     if(await Permission.locationAlways.request().isGranted){
       Timer(const Duration(seconds: 3), () {
         //TODO M1
         isLogin!.value == true ? Get.offNamed(AppRoutes.dashboardScreen) : Get.offNamed(AppRoutes.signInScreen);
         // Get.offNamed(AppRoutes.signInScreen);
       });
     } else{
       Timer(const Duration(seconds: 3), () {
         //TODO M1
         isLogin!.value == true ? Get.offNamed(AppRoutes.dashboardScreen) : Get.offNamed(AppRoutes.signInScreen);
         // Get.offNamed(AppRoutes.signInScreen);
       });
     }
      // Either the permission was already granted before or the user just granted it.
    }else{
      Timer(const Duration(seconds: 3), () {
        //TODO M1
        isLogin!.value == true ? Get.offNamed(AppRoutes.dashboardScreen) : Get.offNamed(AppRoutes.signInScreen);
        // Get.offNamed(AppRoutes.signInScreen);
      });
    }

    // The OS restricts access, for example because of parental controls.
    //   Map<Permission, PermissionStatus> statuses = await [
    //     Permission.location,
    //     Permission.locationAlways,
    //     Permission.locationWhenInUse,
    //   ].request();

      // print('statuses[Permission.location]'+ statuses[Permission.location].toString());
      // print('statuses[Permission.location]'+ statuses[Permission.locationAlways].toString());
      // print('statuses[Permission.location]'+ statuses[Permission.locationWhenInUse].toString());
  }
}
