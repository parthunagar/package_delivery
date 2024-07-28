
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:package_delivery/AppRoute/app_route.dart';
import 'package:package_delivery/Constant/app_constant.dart';
import 'package:package_delivery/Constant/app_image.dart';
import 'package:package_delivery/Constant/appstyle.dart';
import 'package:package_delivery/Constant/colors.dart';
import 'package:package_delivery/Utils/preference.dart';
import 'package:package_delivery/widget/custom_appbar.dart';
import 'package:package_delivery/widget/custom_button.dart';

import 'otp_controller.dart';

class OtpVerificationWidget extends GetView<OtpVerificationController> {


  @override
  Widget build(BuildContext context) {
    final logic = Get.find<OtpVerificationController>();

    return WillPopScope(
      onWillPop: () async {
        Get.offAllNamed(AppRoutes.signInScreen);
        return true;
      },
      child: Container(
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
                    Get.offAllNamed(AppRoutes.signInScreen);
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
                    child: Obx(() {
                      String otpValue = controller.otp.value;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            Assets.iconOtpVerification,
                          ),
                          SizedBox(height: getVerticalSize(50)),
                          RichText(
                            text: TextSpan(
                              text: 'Verification ',
                              style: AppStyle.textStyleDarkRobotoLightWhite35,
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'Code!',
                                    style: AppStyle.textStyleDarkRobotoBoldWhite35),
                              ],
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              text: 'We sent you a verification code to your email ',
                              style: AppStyle.textStyleDarkRobotoMediumDarkGrey15,
                              children: <TextSpan>[
                                TextSpan(
                                    text: controller.email.value,
                                    style: AppStyle.textStyleRobotoBold15),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: getVerticalSize(50)),
                            child: OtpTextField(
                              numberOfFields: 4,
                              fieldWidth: getHorizontalSize(65),
                              borderColor: cBlue,
                              focusedBorderColor: cBlack,
                              cursorColor: cWhite,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              textStyle: AppStyle.textStyleDarkRobotoMediumWhite25,
                             enabledBorderColor: cWhite,
                      // disabledBorderColor: cBlue,
                      // borderColor: cWhite,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(getHorizontalSize(10))),
                              //set to true to show as box or false to show as dash
                              showFieldAsBox: true,
                              //runs when a code is typed in
                              onCodeChanged: (String code) {
                                //handle validation or checks here
                              },
                              //runs when every textfield is filled
                              onSubmit: (String verificationCode) {
                                controller.otp.value = verificationCode;
                              }, // end onSubmit
                            ),
                          ),
                          SizedBox(height: getVerticalSize(150)),
                          // SizedBox(height: getVerticalSize(50)),
                        ],
                      );
                    }),
                  ),
                ),

                Column(
                  // crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    //TODO: RESEND OTP BUTTON
                    // GestureDetector(
                    //   onTap:() {
                    //     // controller.reSendOtp();
                    //   },
                    //   child: Text('Resend OTP?',style: AppStyle.textStyleDarkRobotoMediumWhite15,)),
                    CustomButton(
                      title: 'Submit',
                      onPressed: controller.submitOtpVerification,
                    ),
                  ],
                ),
              ],
            )),
      ), );
  }
}
// import 'package:flutter/material.dart';
// import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:package_delivery/AppRoute/app_route.dart';
// import 'package:package_delivery/Constant/app_image.dart';
// import 'package:package_delivery/Constant/appstyle.dart';
// import 'package:package_delivery/Constant/colors.dart';
// import 'package:package_delivery/widget/custom_appbar.dart';
// import 'package:package_delivery/widget/custom_button.dart';
//
// import 'otp_controller.dart';
//
// class OtpVerificationWidget extends GetView<OtpVerificationController> {
//
//
//   @override
//   Widget build(BuildContext context) {
//     final logic = Get.find<OtpVerificationController>();
//
//     return WillPopScope(
//       onWillPop: () async {
//           Get.offAllNamed(AppRoutes.signInScreen);
//           return true;
//       },
//       child: Container(
//       decoration: BoxDecoration(
//         gradient: RadialGradient(
//           center: Alignment(1, -1),
//           radius: 0.6,
//           stops: [0, 0.9,
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
//                   BoxShadow(blurRadius: getHorizontalSize(5), color: Colors.black12, spreadRadius: 1)
//                 ],
//               ),
//               height: getHorizontalSize(30),
//               width: getHorizontalSize(30),
//               child: IconButton(
//                 icon: Icon(Icons.arrow_back_ios_rounded),
//                 iconSize: getFontSize(15),
//                 color: Colors.black,
//                 onPressed:() {
//                   print("onBackPressed");
//                   Get.offAllNamed(AppRoutes.signInScreen);
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
//                   child: Obx(() {
//                     String otpValue = controller.otp.value;
//                     return Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         SvgPicture.asset(
//                           Assets.iconOtpVerification,
//                         ),
//                         SizedBox(height: getVerticalSize(50)),
//                         RichText(
//                           text: TextSpan(
//                             text: 'Verification ',
//                             style: AppStyle.textStyleRobotoLight35,
//                             children: <TextSpan>[
//                               TextSpan(
//                                   text: 'Code!',
//                                   style: AppStyle.textStyleRobotoBold35),
//                             ],
//                           ),
//                         ),
//                         RichText(
//                           text: TextSpan(
//                             text: 'We sent you a verification code to your email ',
//                             style: AppStyle.textStyleRobotoRegular15,
//                             children: <TextSpan>[
//                               TextSpan(
//                                   text: controller.email.value,
//                                   style: AppStyle.textStyleRobotoBold15),
//                             ],
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsets.only(top: getVerticalSize(50)),
//                           child: OtpTextField(
//                             numberOfFields: 4,
//                             fieldWidth: getHorizontalSize(65),
//                             borderColor: cBlue,
//                             focusedBorderColor: cBlack,
//                             cursorColor: cBlack,
//                             mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             textStyle: AppStyle.textStyleRobotoMedium25,
//                             borderRadius: BorderRadius.all(
//                                 Radius.circular(getHorizontalSize(10))),
//                             //set to true to show as box or false to show as dash
//                             showFieldAsBox: true,
//                             //runs when a code is typed in
//                             onCodeChanged: (String code) {
//                               //handle validation or checks here
//                             },
//                             //runs when every textfield is filled
//                             onSubmit: (String verificationCode) {
//                               controller.otp.value = verificationCode;
//                             }, // end onSubmit
//                           ),
//                         ),
//                         SizedBox(height: getVerticalSize(100)),
//                         // SizedBox(height: getVerticalSize(50)),
//                       ],
//                     );
//                   }),
//                 ),
//               ),
//               CustomButton(
//                 title: 'Submit',
//                 onPressed: controller.submitOtpVerification,
//               ),
//             ],
//           )),
//     ), );
//   }
// }
