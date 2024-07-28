import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:package_delivery/AppRoute/NavigationArgs.dart';
import 'package:package_delivery/AppRoute/app_route.dart';
import 'package:package_delivery/Constant/app_constant.dart';
import 'package:package_delivery/Constant/app_image.dart';
import 'package:package_delivery/Screen/home/home_controller.dart';
import 'package:package_delivery/Screen/mypackages/mypackages_controller.dart';
import 'package:package_delivery/Screen/profile/profile_controller.dart';
import 'package:package_delivery/Constant/colors.dart';
import 'package:package_delivery/Screen/traking/traking_logic.dart';
import 'package:package_delivery/Utils/preference.dart';
import 'package:package_delivery/main.dart';

// enum DrawerEnum { home, profile, company, paymentmethod }

enum DrawerEnum {home, followedCompany, paymentMethod, review, switchRole, shipPackPro, followersList, driverListing, couponHistory}

class DashboardLogic extends GetxController with StateMixin<dynamic> {
  RxInt tabIndex =  0.obs; //tabcontroller
  RxInt userRoleid = 0.obs;

  var selectedDrawerWidget = DrawerEnum.home.obs;

  var scaffoldKey = GlobalKey<ScaffoldState>();
  var backGroundColor = cDarkBlue.obs;

  void openDrawer() {
    scaffoldKey.currentState?.openDrawer();
  }

  void closeDrawer() {
    scaffoldKey.currentState?.openEndDrawer();
    FocusScope.of(Get.context!).unfocus();
  }

  void changeval(value) {
    this.selectedDrawerWidget.value = value;
    // closeDrawer();
    // changeTabIndex(value);
  }  //drawer

  List<BottomNavigationBarItem> bottomNavigationBarItemsofDriver = [
    BottomNavigationBarItem(
      activeIcon: SvgPicture.asset(
        Assets.iconBottomHomeBlue,
      ),
      icon: SvgPicture.asset(
        Assets.iconBottomHomeGray,
      ),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      activeIcon: SvgPicture.asset(
        Assets.iconBottomMyPackageBlue,
      ),
      icon: SvgPicture.asset(
        Assets.iconBottomMyPackageGray,
      ),
      label: 'Shipment Listing',
    ),
    BottomNavigationBarItem(
      activeIcon: SvgPicture.asset(
        Assets.iconBottomProfileBlue,
      ),
      icon: SvgPicture.asset(
        Assets.iconBottomProfileGray,
      ),
      label: 'Account',
    ),
  ];

  List<BottomNavigationBarItem> bottomNavigationBarItemsofCustomer = [
    BottomNavigationBarItem(
      activeIcon: SvgPicture.asset(
        Assets.iconBottomHomeBlue,
      ),
      icon: SvgPicture.asset(
        Assets.iconBottomHomeGray,
      ),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      activeIcon: SvgPicture.asset(
        Assets.iconBottomMyPackageBlue,
      ),
      icon: SvgPicture.asset(
        Assets.iconBottomMyPackageGray,
      ),
      label: 'My Package',
    ),
    BottomNavigationBarItem(
      activeIcon: SvgPicture.asset(
        Assets.iconBottomTrackingBlue,
      ),
      icon: SvgPicture.asset(
        Assets.iconBottomTrackingGray,
      ),
      label: 'Tracking',
    ),
    BottomNavigationBarItem(
      activeIcon: SvgPicture.asset(
        Assets.iconBottomProfileBlue,
      ),
      icon: SvgPicture.asset(
        Assets.iconBottomProfileGray,
      ),
      label: 'Account',
    ),
  ];


  @override
  void onInit() async {
    userRoleid.value = await Preference().readInt(Const.prefUserRoleId);
    bool prefNotificationRoutesSet;
    // debugPrint('onInit => prefNotificationRoutesSet : ${prefNotificationRoutesSet.toString()}');
    // userRoleid.value = 5;
    debugPrint('onInit => name : $userRoleid');

    try{
      prefNotificationRoutesSet =  await Preference().readBool(Const.prefNotificationRoutesSet);
      if(prefNotificationRoutesSet == true) {
        await Preference().saveBool(Const.prefNotificationRoutesSet, false);
        changeTabIndex(1);
      }
    }
    catch(e){
      debugPrint('prefNotificationRoutesSet => ERROR : $e');
    }
     // Const.notificationTab == true ? 1.obs : 0.obs;
    super.onInit();

    debugPrint('DashboardLogic => tabIndex.value : ${tabIndex.value}');
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

  void changeTabIndex(int index,{String? trakingId}) {
    FocusManager.instance.primaryFocus!.unfocus();
    tabIndex.value = index;
    debugPrint('userRoleid.value : ${userRoleid.value}');
    debugPrint('index : ${index}');
    closeDrawer();
    // TODO : 02-02-2022
    if(userRoleid.value==UserRoles.customer){
      if(index==2){
        final trakingController = Get.find<TrakingLogic>();
        trakingController.callTrackingList(trackId: trakingId);
        backGroundColor.value= cWhite;
      }else{
        backGroundColor.value= cDarkBlue;
        if(index == 0){
          bool testTracking = Get.isRegistered<HomeLogic>();

          if(testTracking == false){
             Get.put<HomeLogic>(HomeLogic());
          }
          final homeController = Get.find<HomeLogic>();
          homeController.callShipmentList();
        }
        if(index == 1){
          bool pkgTracking = Get.isRegistered<MyPackagesLogic>();
          debugPrint('index == 1');
          if(pkgTracking == false){
            Get.put<MyPackagesLogic>(MyPackagesLogic());
          }
          final myPackagesLogic = Get.find<MyPackagesLogic>();
          myPackagesLogic.callShipmentList();
        }
        if(index == 3){
          bool profileTracking = Get.isRegistered<ProfileLogic>();
          if(profileTracking == false) {
            Get.put<ProfileLogic>(ProfileLogic());
          }
          final profileLogic = Get.find<ProfileLogic>();
          profileLogic.getProfileData();
        }

      }
    }else{
      if(index==0) {
        print('index==1');
        final homeControler = Get.find<HomeLogic>();
        homeControler.callShipmentList();
      }else if(index == 1){
        bool pkgTracking = Get.isRegistered<MyPackagesLogic>();
        print('index == 1');
        if(pkgTracking == false){
          Get.put<MyPackagesLogic>(MyPackagesLogic());
        }

        final myPackagesLogic = Get.find<MyPackagesLogic>();
        myPackagesLogic.callShipmentList();
      }else if(index == 2){
        print('index==3');
        bool profileTracking = Get.isRegistered<ProfileLogic>();
        if(profileTracking == false) {
          Get.put<ProfileLogic>(ProfileLogic());
        }
        final profileLogic = Get.find<ProfileLogic>();
        profileLogic.getProfileData();
      }
    }
    update();
  }
}
