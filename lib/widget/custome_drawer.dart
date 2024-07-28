import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:package_delivery/AppRoute/app_route.dart';
import 'package:package_delivery/Constant/app_constant.dart';
import 'package:package_delivery/Constant/app_image.dart';
import 'package:package_delivery/Constant/appstyle.dart';
import 'package:package_delivery/Constant/colors.dart';
import 'package:package_delivery/Screen/dashboard/dashboard_controller.dart';
import 'package:package_delivery/Screen/home/home_controller.dart';
import 'package:package_delivery/Utils/preference.dart';


class CustomDrawer extends StatefulWidget {
  CustomDrawer({
    required this.userRoleid,
    Key? key,
  }) : super(key: key);
  final int userRoleid;

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {

  String? profileImage,username;

  getPref() async {
    profileImage = await Preference().read(Const.prefUserProfileImage);
    username = await Preference().read(Const.prefName);
    setState(() {});
  }

  @override
  void initState()  {
    // TODO: implement initState
    super.initState();
    getPref();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    debugPrint("Userrole ---->>>>>> ${widget.userRoleid}");
    final logic = Get.find<DashboardLogic>();
    // logic.changeval(DrawerEnum.home);
    return Drawer(
      child: Column(
        children: [
          SizedBox(height: getVerticalSize(75)),
          profileImage == "" || profileImage == "null"
            ? Container(
                width: w * 0.3,
                height: h * 0.15,
                decoration: BoxDecoration(color: cWhite, shape: BoxShape.circle),
                child: SvgPicture.asset(Assets.iconProfilePerson))
            : CircleAvatar(backgroundImage: NetworkImage(profileImage.toString()), radius: 50,onBackgroundImageError: (_,__){
                Container(
                  width: w * 0.3,
                  height: h * 0.15,
                  decoration: BoxDecoration(color: cWhite, shape: BoxShape.circle),
                  child: SvgPicture.asset(Assets.iconProfilePerson),
                );
          },),
          SizedBox(height: getVerticalSize(10)),
          Text(username.toString(), style: AppStyle.textStyleRobotoMediumBlue15),
          SizedBox(height: getVerticalSize(50)),
          widget.userRoleid == UserRoles.driver || widget.userRoleid == UserRoles.comapany
              ? Column(
                  children: [
                    DrawerTag(
                      icon: Assets.iconHome,
                      bodyText: "Home",
                      value: DrawerEnum.home,
                      onTap: (){
                        debugPrint(' =========> ON CLICK HOME <========= ');
                        logic.changeval(DrawerEnum.home);
                        logic.changeTabIndex(0);
                        Get.back();
                      },
                    ),
                    widget.userRoleid == UserRoles.driver || widget.userRoleid == UserRoles.customer ? SizedBox() :SizedBox(height: getVerticalSize(20)),
                    widget.userRoleid == UserRoles.driver || widget.userRoleid == UserRoles.customer ? SizedBox() : DrawerTag(
                      icon: Assets.iconSidemenuFollowerList,
                      bodyText: "Followers List",
                      value: DrawerEnum.followersList,
                      onTap: (){
                        debugPrint(' =========> ON CLICK FOLLOWERS LIST <========= ');
                        logic.changeval(DrawerEnum.followersList);
                        Get.back();
                        //TODO 10_02_2022 => M10
                        Get.toNamed(AppRoutes.followerListScreen);
                      },
                    ),
                    widget.userRoleid == UserRoles.driver ? SizedBox() : SizedBox(height: getVerticalSize(20)),
                    widget.userRoleid == UserRoles.driver ? SizedBox() : DrawerTag(
                      icon: Assets.iconSidemenuDriverList,
                      bodyText: "Driver Listing",
                      value: DrawerEnum.driverListing,
                      onTap: () {
                        debugPrint(' =========> ON CLICK DRIVER LISTING <========= ');
                        logic.changeval(DrawerEnum.driverListing);
                        Get.back();
                        //TODO 10_02_2022 => M10
                        Get.toNamed(AppRoutes.driverListScreen);
                      },
                    ),
                    SizedBox(height: getVerticalSize(20)),
                    DrawerTag(
                      icon: Assets.iconSidemenuReview,
                      bodyText: "Review",
                      value: DrawerEnum.review,
                      onTap: (){
                        debugPrint(' =========> ON CLICK REVIEW <========= ');
                        logic.changeval(DrawerEnum.review);
                        Get.back();
                        //TODO 10_02_2022 =>M9
                        Get.toNamed(AppRoutes.rateReviewListScreen);
                      },
                    ),
                    SizedBox(height: getVerticalSize(20)),
                    DrawerTag(
                      icon: Assets.iconSidemenuSwitchRole,
                      bodyText: "Switch Role",
                      value: DrawerEnum.switchRole,
                      onTap: (){
                        debugPrint(' =========> ON CLICK SWITCH ROLE <========= ');
                        logic.changeval(DrawerEnum.switchRole);
                        Get.back();
                        Get.toNamed(AppRoutes.roleScreenDrawer);
                      },
                    ),
                  ],
                )
              : Column(
                  children: [
                    DrawerTag(
                      icon: Assets.iconHome,
                      bodyText: "Home",
                      value: DrawerEnum.home,
                      onTap: (){
                        debugPrint(' =========> ON CLICK HOME <========= ');
                        logic.changeval(DrawerEnum.home);
                        logic.changeTabIndex(0);
                        Get.back();
                      },
                    ),
                    SizedBox(height: getVerticalSize(20)),
                    DrawerTag(
                      icon: Assets.iconMenuCompany,
                      bodyText: "Followed Company",
                      value: DrawerEnum.followedCompany,
                      onTap: () {
                        debugPrint(' =========> ON CLICK FOLLOWED COMPANY <========= ');
                        logic.changeval(DrawerEnum.followedCompany);
                        Get.back();
                        Get.toNamed(AppRoutes.followedListScreen);
                      },
                    ),
                    // SizedBox(height: getVerticalSize(20)),
                    // DrawerTag(
                    //   icon: Assets.iconMenuPayment,
                    //   bodyText: "Payment Method",
                    //   value: DrawerEnum.paymentMethod,
                    //   onTap: (){
                    //     debugPrint(' =========> ON CLICK PAYMENT METHOD <========= ');
                    //     logic.changeval(DrawerEnum.paymentMethod);
                    //     Get.back();
                    //   },
                    // ),
                    SizedBox(height: getVerticalSize(20)),
                    DrawerTag(
                      icon: Assets.iconCouponHistory,
                      bodyText: "Coupon History",
                      value: DrawerEnum.couponHistory,
                      onTap: (){
                        debugPrint(' =========> ON CLICK COUPON HISTORY <========= ');
                        logic.changeval(DrawerEnum.couponHistory);
                        Get.back();
                        Get.toNamed(AppRoutes.couponHistoryListScreen);
                      },
                    ),
                    // DrawerTag(
                    //   icon: Assets.iconSidemenuFollowerList,
                    //   bodyText: "Followers List",
                    //   value: DrawerEnum.followersList,
                    //   onTap: (){
                    //     debugPrint(' =========> ON CLICK FOLLOWERS LIST <========= ');
                    //     Get.back();
                    //     Get.toNamed(AppRoutes.followerListScreen);
                    //   },
                    // ),
                    // SizedBox(
                    //   height: getVerticalSize(20),
                    // ),
                    // DrawerTag(
                    //   icon: Assets.iconSidemenuReview,
                    //   bodyText: "Review",
                    //   value: DrawerEnum.review,
                    //   onTap: () {
                    //     debugPrint(' =========> ON CLICK REVIEW <========= ');
                    //     Get.back();
                    //     // Get.toNamed(AppRoutes.reviewScreen);
                    //   },
                    // ),
                    SizedBox(height: getVerticalSize(20)),
                    DrawerTag(
                      icon: Assets.iconSidemenuSwitchRole,
                      bodyText: "Switch Role",
                      value: DrawerEnum.switchRole,
                      onTap: (){
                        debugPrint(' =========> ON CLICK SWITCH ROLE <========= ');
                        logic.changeval(DrawerEnum.switchRole);
                        Get.back();
                        Get.toNamed(AppRoutes.roleScreenDrawer);
                      },
                    ),
                    //TODO In App parchase
                    // SizedBox(height: getVerticalSize(20)),
                    // DrawerTag(
                    //   icon: Assets.iconSidemenuShippackpro,
                    //   bodyText: "SHIP PACK PRO",
                    //   value: DrawerEnum.shipPackPro,
                    //   onTap: (){
                    //     debugPrint(' =========> ON CLICK SHIP PACK PRO <========= ');
                    //     logic.changeval(DrawerEnum.shipPackPro);
                    //     Get.back();
                    //     //TODO 17_02_2022 => M11
                    //     Get.toNamed(AppRoutes.subscriptionScreen);
                    //   },
                    // ),
                  ],
          ),
          const Spacer(),
          GestureDetector(
            onTap: () async {
              // await Preference().saveBool(Const.prefIsLoggedIn, false);
              await Preference().clear();
              Const().toast('You are logged out Successfully!');
              Get.offAllNamed(AppRoutes.signInScreen);
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: getHorizontalSize(5),
                  height: getVerticalSize(25),
                ),
                SizedBox(
                  width: getHorizontalSize(20),
                ),
                Container(
                  width: getHorizontalSize(20),
                  height: getHorizontalSize(20),
                  child: SvgPicture.asset(
                    Assets.iconLogut,
                    fit: BoxFit.contain,
                    color: cRed,
                  ),
                ),
                SizedBox(
                  width: getHorizontalSize(20),
                ),
                Text(
                  "Logout",
                  style: AppStyle.textStyleRobotoRegularRed15,
                ),
              ],
            ),
          ),
          SizedBox(height: getVerticalSize(30))
        ],
      ),
    );
  }
}


class DrawerTag extends StatelessWidget {
  DrawerTag({
    Key? key,
    required this.icon,
    required this.bodyText,
    required this.value,
    this.onTap
  }) : super(key: key);

  final String icon, bodyText;
  final DrawerEnum value;
  var onTap;


  final logic = Get.find<DashboardLogic>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {
        logic.changeval(value);
      },
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: getHorizontalSize(5),
              height: getVerticalSize(25),
              decoration: BoxDecoration(
                  color: logic.selectedDrawerWidget == value ? cBlue : cWhite,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  )),
            ),
            SizedBox(
              width: getHorizontalSize(20),
            ),
            Container(
              width: getHorizontalSize(20),
              height: getHorizontalSize(20),
              child: SvgPicture.asset(
                icon,
                fit: BoxFit.contain,
                color: logic.selectedDrawerWidget == value ? cBlue : cGrey,
              ),
            ),
            SizedBox(
              width: getHorizontalSize(20),
            ),
            Text(
              bodyText,
              style: logic.selectedDrawerWidget == value
                  ? AppStyle.textStyleRobotoBoldBlue15//AppStyle.textStyleRobotoRegularBlue15
                  : AppStyle.textStyleRobotoRegularGrey15,
            ),
          ],
        ),
      ),
    );
  }
}
