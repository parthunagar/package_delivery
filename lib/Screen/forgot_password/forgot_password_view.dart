import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:package_delivery/AppRoute/app_route.dart';
import 'package:package_delivery/Constant/app_constant.dart';
import 'package:package_delivery/Constant/app_image.dart';
import 'package:package_delivery/Constant/appstyle.dart';
import 'package:package_delivery/Constant/colors.dart';
import 'package:package_delivery/widget/custom_appbar.dart';
import 'package:package_delivery/widget/custom_button.dart';
import 'package:package_delivery/widget/text_input_filed.dart';

import 'forgot_password_logic.dart';

class Forgot_passwordWidget extends GetView<Forgot_passwordLogic> {
  @override
  Widget build(BuildContext context) {
    final logic = Get.find<Forgot_passwordLogic>();

    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: const Alignment(1, -1),
          radius: 0.5,
          stops: const [0,0.1, 0.9],
          colors: [cBlack,cBlackOpacity, cDarkBlue],
        ),
      ),

      // decoration: BoxDecoration(
      //   gradient: RadialGradient(
      //     center: Alignment(1, -1),
      //     radius: 0.6,
      //     stops: [0, 0.9],
      //     colors: [
      //       // cBlue,
      //       cBluewithOpacity,
      //       cWhite
      //     ],
      //   ),
      // ),

      child: Scaffold(
          backgroundColor: cTransparent,
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
          ),
          body: Stack(
            children: [

              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(
                      top: getVerticalSize(20),
                      left: getHorizontalSize(15),
                      right: getHorizontalSize(15)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        Assets.iconForgotEmail,
                      ),
                      SizedBox(height: getVerticalSize(50)),
                      RichText(
                        text: TextSpan(
                          text: 'Forgot ',
                          style: AppStyle.textStyleDarkRobotoLightWhite35,
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Password?',
                                style: AppStyle.textStyleDarkRobotoBoldWhite35),
                          ],
                        ),
                      ),
                      Text(
                        'Don’t worry! Just fill in your email and we’ll send a code to reset your password',
                        style: AppStyle.textStyleDarkRobotoRegularDarkGrey15,
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: getVerticalSize(50)),
                        child: TextInputFindOut(
                            controller: controller.cEmail,
                            textInputAction: TextInputAction.done,
                            label: 'Email',
                            textInputType: TextInputType.emailAddress),
                      ),
                      SizedBox(height: getVerticalSize(100)),

                      // SizedBox(height: getVerticalSize(50)),
                    ],
                  ),
                ),
              ),
              CustomButton(
                title: 'Submit',
                // onPressed: controller.submitOtpVerification,
                onPressed: () {
                  RegExp regex = RegExp(Const.emailPattern);
                  if (controller.cEmail!.text.isEmpty) {
                    debugPrint('Please enter the email');
                    Const().toast('Please enter the email');
                  } else if (!regex.hasMatch(controller.cEmail!.text)) {
                    Const().toast('Please enter valid email');
                  } else {
                    controller.submitEmail();
                    // Get.toNamed(AppRoutes.otpScreen);
                  }
                },
              ),
            ],
          )),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:package_delivery/AppRoute/app_route.dart';
// import 'package:package_delivery/Constant/app_constant.dart';
// import 'package:package_delivery/Constant/app_image.dart';
// import 'package:package_delivery/Constant/appstyle.dart';
// import 'package:package_delivery/Constant/colors.dart';
// import 'package:package_delivery/widget/custom_appbar.dart';
// import 'package:package_delivery/widget/custom_button.dart';
// import 'package:package_delivery/widget/text_input_filed.dart';
//
// import 'forgot_password_logic.dart';
//
// class Forgot_passwordWidget extends GetView<Forgot_passwordLogic> {
//   @override
//   Widget build(BuildContext context) {
//     final logic = Get.find<Forgot_passwordLogic>();
//
//     return Container(
//       decoration: BoxDecoration(
//         gradient: RadialGradient(
//           center: Alignment(1, -1),
//           radius: 0.6,
//           stops: [
//             0,
//             0.9,
//           ],
//           colors: [
//             // cBlue,
//             cBluewithOpacity,
//             cWhite
//           ],
//         ),
//       ),
//       child: Scaffold(
//           backgroundColor: cTransparent,
//           appBar: CustomAppBar(
//             leading: Container(
//               decoration: BoxDecoration(
//                 color: cWhite,
//                 borderRadius: BorderRadius.circular(5),
//                 boxShadow: [
//                   BoxShadow(
//                       blurRadius: getHorizontalSize(5),
//                       color: Colors.black12,
//                       spreadRadius: 1)
//                 ],
//               ),
//               height: getHorizontalSize(30),
//               width: getHorizontalSize(30),
//               child: IconButton(
//                 icon: Icon(Icons.arrow_back_ios_rounded),
//                 iconSize: getFontSize(15),
//                 color: Colors.black,
//                 onPressed: () {
//                   print("onBackPressed");
//                   Get.back();
//                 },
//                 tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
//               ),
//             ),
//           ),
//           body: Stack(
//             children: [
//               SingleChildScrollView(
//                 child: Padding(
//                   padding: EdgeInsets.only(
//                       top: getVerticalSize(20),
//                       left: getHorizontalSize(15),
//                       right: getHorizontalSize(15)),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       SvgPicture.asset(
//                         Assets.iconForgotEmail,
//                       ),
//                       SizedBox(height: getVerticalSize(50)),
//                       RichText(
//                         text: TextSpan(
//                           text: 'Forgot ',
//                           style: AppStyle.textStyleRobotoLight35,
//                           children: <TextSpan>[
//                             TextSpan(
//                                 text: 'Password?',
//                                 style: AppStyle.textStyleRobotoBold35),
//                           ],
//                         ),
//                       ),
//                       Text(
//                         'Don’t worry! Just fill in your email and we’ll send a code to reset your password',
//                         style: AppStyle.textStyleRobotoRegular15,
//                       ),
//
//                       Padding(
//                         padding: EdgeInsets.only(top: getVerticalSize(50)),
//                         child: TextInputFindOut(
//                             controller: controller.cEmail,
//                             textInputAction: TextInputAction.done,
//                             label: 'Email',
//                             textInputType: TextInputType.emailAddress),
//                       ),
//                       SizedBox(height: getVerticalSize(100)),
//
//                       // SizedBox(height: getVerticalSize(50)),
//                     ],
//                   ),
//                 ),
//               ),
//               CustomButton(
//                 title: 'Submit',
//                 // onPressed: controller.submitOtpVerification,
//                 onPressed: () {
//                   RegExp regex = RegExp(Const.emailPattern);
//                   if (controller.cEmail!.text.isEmpty) {
//                     debugPrint('Please enter the email');
//                     Const().toast('Please enter the email');
//                   } else if (!regex.hasMatch(controller.cEmail!.text)) {
//                     Const().toast('Please enter valid email');
//                   } else {
//                     controller.submitEmail();
//                     // Get.toNamed(AppRoutes.otpScreen);
//                   }
//                 },
//               ),
//             ],
//           )),
//     );
//   }
// }
