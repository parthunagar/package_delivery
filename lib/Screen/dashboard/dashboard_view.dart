import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_delivery/Constant/app_constant.dart';
import 'package:package_delivery/Constant/appstyle.dart';
import 'package:package_delivery/Constant/colors.dart';
import 'package:package_delivery/Screen/dashboard/dashboard_controller.dart';
import 'package:package_delivery/Screen/home/home_view.dart';
import 'package:package_delivery/Screen/mypackages/mypackages_view.dart';
import 'package:package_delivery/Screen/otp/otp_view.dart';
import 'package:package_delivery/Screen/profile/profile_view.dart';
import 'package:package_delivery/Screen/roleselection/roleselection_view.dart';
import 'package:package_delivery/Screen/select_dispatcher/select_dispatcher_view.dart';
import 'package:package_delivery/Screen/traking/traking_view.dart';
import 'package:package_delivery/widget/custome_drawer.dart';

class DashboardWidget extends GetView<DashboardLogic> {
  @override
  Widget build(BuildContext context) {
    final logic = Get.find<DashboardLogic>();

    return Obx(
      () => Scaffold(
        backgroundColor: controller.backGroundColor.value,
        key: controller.scaffoldKey,
        //default controller
        drawer: CustomDrawer(userRoleid: controller.userRoleid.value,),
        body: controller.userRoleid.value == UserRoles.driver ||
                controller.userRoleid.value == UserRoles.comapany
            ? IndexedStack(
                index: controller.tabIndex.value,
                children: [
                  HomeWidget(),
                  MyPackagesWidget(),
                  ProfileWidget()
                ],
              )
            : IndexedStack(
                index: controller.tabIndex.value,
                children: [
                  HomeWidget(),
                  MyPackagesWidget(),
                  TrakingWidget(),
                  ProfileWidget()
                ],
              ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: cWhite,
            boxShadow: <BoxShadow>[
               BoxShadow(
                color: cGrey,
                blurRadius: 10.0,
                offset: new Offset(0.0, 0.0),
              ),
            ],
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          ),
          child: ClipRRect(

            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            child: controller.userRoleid.value == UserRoles.driver ||
                    controller.userRoleid.value == UserRoles.comapany
                ? BottomNavigationBar(
                    onTap: controller.changeTabIndex,
                    currentIndex: controller.tabIndex.value,
                    type: BottomNavigationBarType.fixed,
                    selectedItemColor: cBlue,
                    unselectedItemColor: cGrey,
                    showUnselectedLabels: true,
                    unselectedLabelStyle: AppStyle.textStyleRobotoRegular11,
                    selectedLabelStyle: AppStyle.textStyleRobotoBold15,
                    items: [...controller.bottomNavigationBarItemsofDriver],
                  )
                : BottomNavigationBar(
                    onTap: controller.changeTabIndex,
                    currentIndex: controller.tabIndex.value,
                    type: BottomNavigationBarType.fixed,
                    selectedItemColor: cBlue,
                    unselectedItemColor: cGrey,
                    showUnselectedLabels: true,
                    unselectedLabelStyle: AppStyle.textStyleRobotoRegular11,
                    selectedLabelStyle: AppStyle.textStyleRobotoBold15,
                    items: [...controller.bottomNavigationBarItemsofCustomer],
                  ),
          ),
        ),
      ),
    );
  }
}
