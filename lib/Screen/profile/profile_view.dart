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
import 'package:package_delivery/Screen/profile/profile_controller.dart';
import 'package:package_delivery/widget/custom_appbar.dart';
import 'package:package_delivery/widget/custom_new_appbar.dart';
class ProfileWidget extends GetView<ProfileLogic> {
  const ProfileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    final logic = Get.find<ProfileLogic>();
    final dashboardcontroller = Get.find<DashboardLogic>();
    return Scaffold(
      backgroundColor: cDarkBlue,
      appBar: CustomAppBar(
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
              color: cWhite,
              width: w / 14,
              height: w / 14,
              fit: BoxFit.contain,
            ),
          ),
        ),
        title: "Profile",
        titleStyle: AppStyle.textStyleRobotoBoldWhite25,
        action: [
          GestureDetector(
              onTap: () {
                //TODO Edit Profile
                // Get.toNamed(AppRoutes.editProfileScreen);
                Get.toNamed(AppRoutes.editProfileScreen, arguments: {NavigationArgs.kCountryCode : controller.userPhoneCode!.value});
              },
              child: Container(
                  margin: EdgeInsets.only(right: w * 0.04),
                  child: SvgPicture.asset(Assets.iconEdit,color: cWhite,))
          ),
        ],
      ),
      // CustomNewAppBar(
      //   title: "Profile",
      //   leading: Icons.arrow_back_ios_rounded,
      //   onTap: () {
      //     Get.back();
      //   },
      //   action: [
      //     IconButton(
      //       onPressed: () {
      //         Get.toNamed(AppRoutes.editProfileScreen);
      //       },
      //       icon: SvgPicture.asset(Assets.iconEdit),
      //     ),
      //   ],
      // ),
      body: //SizedBox(),
      Obx(() {
        print('controller.userRoleid.value profile : ' + controller.userRoleid.value.toString());
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(w / 20),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [

                controller.userProfilePhoto == '' ?  Center(
                  child: Container(
                    width: w * 0.3,
                    height: h * 0.16,
                    decoration: BoxDecoration(color: cWhite, shape: BoxShape.circle),
                    child: SvgPicture.asset(Assets.iconProfilePerson),
                  ),
                ) :
                Center(
                  child: Container(
                    width: w * 0.3,
                    height: h * 0.16,
                    decoration:  BoxDecoration(
                      // color: cRed,
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(controller.userProfilePhoto!.value),
                            fit: BoxFit.cover)
                    ),
                  ),
                ),
                SizedBox(
                  height: h / 30,
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(getHorizontalSize(15)),
                  decoration: BoxDecoration(
                    border: Border.all(color: cGreyLight, width: 1.0),
                    color: cWhite,
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: cGreyLight,
                        blurRadius: 1.0,
                        offset: const Offset(0.0, 0.0),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: h / 100,),
                       ProfileTag(
                        icon: Assets.iconProfilePerson,
                        bodyText: controller.getProfileList.value.username.toString(),// controller.userName!.value,// "Carson",
                      ),
                      Divider(
                        color: cGreyDivider,
                        thickness: 1,
                        height: h / 25,
                      ),
                      ProfileTag(
                        icon: Assets.iconProfileEmail,
                        bodyText: controller.getProfileList.value.email.toString(),//controller.userEmail!.value,//"carson1234@gmail.com",
                      ),
                      Divider(
                        color: cGreyDivider,
                        thickness: 1,
                        height: h / 25,
                      ),
                      ProfileTag(
                        icon: Assets.iconProfileCall,
                        bodyText: controller.userPhoneCode!.value == 'null'
                            ? controller.getProfileList.value.contactNumber.toString()
                            : '${controller.userPhoneCode!.value} ${controller.getProfileList.value.contactNumber.toString()}',
                      ),
                      Divider(color: cGreyDivider, thickness: 1, height: h / 25),
                       // controller.userGender!.value != ''
                       //    ? Column(
                       //   children: [
                       //     ProfileTag(
                       //       icon: Assets.iconProfileGender,
                       //       bodyText: controller.userGender!.value,//"Male",
                       //     ),
                       //     Divider(color: cGreyDivider, thickness: 1, height: h / 25),
                       //   ],
                       // ) : SizedBox(),
                      ProfileTag(
                        icon: Assets.iconProfileGender,
                        bodyText: controller.getProfileList.value.gender == null ? '' : controller.getProfileList.value.gender.toString(),//  controller.userGender!.value,//"Male",
                      ),
                      Divider(color: cGreyDivider, thickness: 1, height: h / 25),
                      ProfileTag(
                        icon: Assets.iconProfileLocation,
                        bodyText:controller.getProfileList.value.address.toString(),// controller.userAddress!.value,// "35 Keavy Court Fredericksburg, 22401 USA",
                      ),
                      Divider(color: cGreyDivider, thickness: 1, height: h / 25),
                      ProfileTag(
                        icon: Assets.iconProfileCustomer,
                        bodyText: controller.userRole!.value,//"Customer",
                      ),
                      Divider(color: cGreyDivider, thickness: 1, height: h / 25),
                      ProfileTag(
                        icon: Assets.iconProfileCustomer,
                        bodyText: 'Free Shipment : ${controller.userFreeDelivery.toString()}',//"Customer",
                      ),
                      controller.userRoleid.value != UserRoles.customer?Divider(color: cGreyDivider, thickness: 1, height: h / 25):const SizedBox.shrink(),
                      controller.userRoleid.value != UserRoles.customer?Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ProfileTag(
                            icon: Assets.iconMyEarnings,
                            bodyText: 'My earning : ${controller.driver_total_earning.value}',//"Customer",
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                                elevation: MaterialStateProperty.all(0),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      side: BorderSide(color: cBlue),
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                                overlayColor: MaterialStateProperty.all(cBlue),
                                backgroundColor: MaterialStateProperty.all(cWhite),
                                textStyle:MaterialStateProperty.all( AppStyle.textStyleRobotoMediumWhite15)
                            ),
                            onPressed: () {
                              debugPrint('Withdraw call');
                              controller.submitWithdrawRequest();
                            },
                            child: Container(
                              width: w / 5,
                              height: h / 25,
                              alignment: Alignment.center,
                              child: Text("Withdraw",
                                  style: AppStyle.textStyleRobotoMediumBlue15),
                            ),
                          ),
                        ],
                      ):const SizedBox.shrink(),
                      SizedBox(height: h / 100,)
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}

class ProfileTag extends StatelessWidget {
  const ProfileTag({
    Key? key,
    required this.bodyText,
    required this.icon,
  }) : super(key: key);

  final String bodyText, icon;

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery
        .of(context)
        .size
        .width;

    return Row(
      children: [
        SvgPicture.asset(icon),
        SizedBox(
          width: w / 30,
        ),
        Text(
          bodyText,
          style: AppStyle.textStyleRobotoMediumGrey15,
        ),
      ],
    );
  }
}
