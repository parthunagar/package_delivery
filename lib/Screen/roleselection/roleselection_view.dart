import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:package_delivery/AppRoute/app_route.dart';
import 'package:package_delivery/Constant/app_constant.dart';
import 'package:package_delivery/Constant/app_image.dart';
import 'package:package_delivery/Constant/appstyle.dart';
import 'package:package_delivery/Constant/colors.dart';
import 'package:package_delivery/Screen/roleselection/roleselection_controller.dart';
import 'package:package_delivery/widget/custom_appbar.dart';
import 'package:package_delivery/widget/custom_button.dart';


class RoleSelectionWidget extends GetView<RoleSelectionLogic> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: const Alignment(1, -1),
          radius: 0.5,
          stops: const [0,0.1, 0.9],
          colors: [cBlack,cBlackOpacity, cDarkBlue],
        ),
      ),
      child: Scaffold(
        backgroundColor: cTransparent,
        appBar: CustomAppBar(
          leading: Container(
            decoration: BoxDecoration(
              color: cBlue,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(blurRadius: getHorizontalSize(5), color: Colors.black12, spreadRadius: 1)
              ],
            ),
            height: getHorizontalSize(30),
            width: getHorizontalSize(30),
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios_rounded),
              iconSize: getFontSize(15),
              color: cWhite,
              onPressed:() {
                print("onBackPressed");
                Get.back();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            ),
          ),
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: getHorizontalSize(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // const Spacer(),
                    SizedBox(height: getVerticalSize(30)),
                    Center(child: Text('Choose a Role', style: AppStyle.textStyleDarkRobotoMediumWhite35)),
                    SizedBox(height: getVerticalSize(15)),
                    Text('Who do you want to register as?', textAlign: TextAlign.center, style: AppStyle.textStyleDarkRobotoRegularDarkGrey15),
                    SizedBox(height: getVerticalSize(40)),
                    RoleTile(imageUrl: Assets.iconCompany, bodyText: "Company", value: UserRoles.comapany),
                    SizedBox(height: getVerticalSize(25)),
                    RoleTile(imageUrl: Assets.iconCustomoer, bodyText: "Customer", value: UserRoles.customer),
                    SizedBox(height: getVerticalSize(25)),
                    RoleTile(imageUrl: Assets.iconDriverFilloutBlack, bodyText: "Driver", value: UserRoles.driver),
                    // const Spacer(),
                    SizedBox(height: getVerticalSize(50)),
                  ],
                ),
              ),
            ),
            CustomButton(
              title: 'Continue',
              onPressed: () {
                controller.submitRole();


                //
              },
            ),
          ],
        ),
      ),
    );
  }
}

class RoleTile extends StatelessWidget {
  RoleTile({
    Key? key,
    required this.imageUrl,
    required this.bodyText,
    required this.value,
  }) : super(key: key);

  final String imageUrl, bodyText;
  final int value;

  final logic = Get.find<RoleSelectionLogic>();

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        logic.changeval(value);

      },
      child: Obx(
            () => Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: logic.selectedRole.value == value ? cWhite : cDarkBlue,
            border: Border.all(
                color: logic.selectedRole.value == value ? cBlue : cWhite,
                width: logic.selectedRole.value == value ? 2 : 1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: getHorizontalSize(10), vertical: getVerticalSize(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: getHorizontalSize(60),
                  height: getHorizontalSize(60),
                  child: SvgPicture.asset(
                    imageUrl,
                    width: getHorizontalSize(60),
                    height: getHorizontalSize(60),
                    color: logic.selectedRole.value == value ? cBlue : cWhite,
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(
                  width: getHorizontalSize(40),
                ),
                Text(
                  bodyText,
                  style: logic.selectedRole.value == value
                      ? AppStyle.textStyleDarkRobotoBoldBlue25
                      : AppStyle.textStyleDarkRobotoRegularWhite25,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import 'package:package_delivery/AppRoute/app_route.dart';
// import 'package:package_delivery/Constant/app_constant.dart';
// import 'package:package_delivery/Constant/app_image.dart';
// import 'package:package_delivery/Constant/appstyle.dart';
// import 'package:package_delivery/Constant/colors.dart';
// import 'package:package_delivery/widget/custom_appbar.dart';
// import 'package:package_delivery/widget/custom_button.dart';
//
// import 'roleselectiondrawer_controller.dart';
//
// class RoleSelectionWidget extends GetView<RoleSelectionLogic> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         gradient: RadialGradient(
//           center: const Alignment(1, -1),
//           radius: 0.6,
//           stops: const [0, 0.9],
//           colors: [
//             // cBlue,
//             cBluewithOpacity,
//             cWhite
//           ],
//         ),
//       ),
//       child: Scaffold(
//         backgroundColor: cTransparent,
//         appBar: CustomAppBar(
//           leading: Container(
//             decoration: BoxDecoration(
//               color: cWhite,
//               borderRadius: BorderRadius.circular(5),
//               boxShadow: [
//                 BoxShadow(blurRadius: getHorizontalSize(5), color: Colors.black12, spreadRadius: 1)
//               ],
//             ),
//             height: getHorizontalSize(30),
//             width: getHorizontalSize(30),
//             child: IconButton(
//               icon: Icon(Icons.arrow_back_ios_rounded),
//               iconSize: getFontSize(15),
//               color: Colors.black,
//               onPressed:() {
//                 print("onBackPressed");
//                 Get.back();
//               },
//               tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
//             ),
//           ),
//         ),
//         body: Stack(
//           children: [
//             SingleChildScrollView(
//               child: Padding(
//                 padding: EdgeInsets.symmetric(horizontal: getHorizontalSize(20)),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     // const Spacer(),
//                     SizedBox(height: getVerticalSize(30)),
//                     Center(child: Text('Choose a Role', style: AppStyle.textStyleRobotoMediumBlack35)),
//                     SizedBox(height: getVerticalSize(15)),
//                     Text('Who do you want to register as?', textAlign: TextAlign.center, style: AppStyle.textStyleRobotoRegularGrey15),
//                     SizedBox(height: getVerticalSize(40)),
//                     RoleTile(imageUrl: Assets.iconCompany, bodyText: "Company", value: UserRoles.comapany),
//                     SizedBox(height: getVerticalSize(25)),
//                     RoleTile(imageUrl: Assets.iconCustomoer, bodyText: "Customer", value: UserRoles.customer),
//                     SizedBox(height: getVerticalSize(25)),
//                     RoleTile(imageUrl: Assets.iconDriverFilloutBlack, bodyText: "Driver", value: UserRoles.driver),
//                     // const Spacer(),
//                     SizedBox(height: getVerticalSize(50)),
//                   ],
//                 ),
//               ),
//             ),
//             CustomButton(
//               title: 'Continue',
//               onPressed: () {
//                 controller.submitRole();
//
//
//                 //
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class RoleTile extends StatelessWidget {
//   RoleTile({
//     Key? key,
//     required this.imageUrl,
//     required this.bodyText,
//     required this.value,
//   }) : super(key: key);
//
//   final String imageUrl, bodyText;
//   final int value;
//
//   final logic = Get.find<RoleSelectionLogic>();
//
//   @override
//   Widget build(BuildContext context) {
//
//     return GestureDetector(
//       onTap: () {
//         logic.changeval(value);
//
//       },
//       child: Obx(
//         () => Container(
//           width: double.infinity,
//           decoration: BoxDecoration(
//             border: Border.all(
//                 color: logic.selectedRole.value == value ? cBlue : cGrey,
//                 width: logic.selectedRole.value == value ? 2 : 1),
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: getHorizontalSize(10), vertical: getVerticalSize(20)),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Container(
//                   width: getHorizontalSize(60),
//                   height: getHorizontalSize(60),
//                   child: SvgPicture.asset(
//                     imageUrl,
//                     width: getHorizontalSize(60),
//                     height: getHorizontalSize(60),
//                     fit: BoxFit.contain,
//                   ),
//                 ),
//                 SizedBox(
//                   width: getHorizontalSize(40),
//                 ),
//                 Text(
//                   bodyText,
//                   style: logic.selectedRole.value == value
//                       ? AppStyle.textStyleRobotoBoldBlue25
//                       : AppStyle.textStyleRobotoRegularGrey25,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
