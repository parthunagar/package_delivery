import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:package_delivery/AppRoute/app_route.dart';
import 'package:package_delivery/Constant/app_constant.dart';
import 'package:package_delivery/Constant/appstyle.dart';
import 'package:package_delivery/Constant/colors.dart';
import 'package:package_delivery/Utils/preference.dart';
import 'package:package_delivery/widget/custom_button.dart';
import 'package:package_delivery/widget/text_input_filed.dart';

import 'signin_controller.dart';

class SignInWidget extends GetView<SignInLogic> {
  const SignInWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final logic = Get.find<SignInLogic>();
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Container(
      // decoration: BoxDecoration(
      //   gradient: RadialGradient(
      //     center: const Alignment(1, -1),
      //     radius: 0.5,
      //     stops: const [0,0.2, 0.9],
      //     colors: [cBlack,cBlackOpacity, cTransparent],
      //   ),
      // ),
      child: Scaffold(
        backgroundColor: cDarkBlue,
        body: Obx(() {
          return Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    center: const Alignment(1, -1),
                    radius: 0.5,
                    stops: const [0,0.2, 0.9],
                    colors: [cBlack,cBlackOpacity, cTransparent],
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: w * 0.04),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: h * 0.06),
                      Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Sign In', style: AppStyle.textStyleDarkRobotoMediumWhite20),
                              SizedBox(height: h * 0.005),
                              Container(
                                height: h * 0.004,
                                width: w * 0.1,
                                decoration: BoxDecoration(color: cBlue, borderRadius: BorderRadius.circular(20)),
                              )
                            ],
                          ),
                          SizedBox(width: w * 0.025),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    Get.offNamed(AppRoutes.signUpScreen);
                                  },
                                  child: Text('Sign Up', style: AppStyle.textStyleRobotoRegular15))
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: h * 0.05),
                      Text('Welcome Back,', style: AppStyle.textStyleDarkRobotoMediumWhite35),
                      RichText(text: TextSpan(
                          children: [
                            TextSpan(text: 'To ', style: AppStyle.textStyleDarkRobotoMediumWhite35),
                            TextSpan(text: 'Ship Pack', style: AppStyle.textStyleDarkRobotoBoldItalicDarkBlue35)
                          ]
                      )),
                      SizedBox(height: h * 0.05),
                      TextInputFindOut(
                          controller: controller.cEmail,
                          label: 'Email',
                          textInputType: TextInputType.emailAddress),
                      SizedBox(height: h * 0.03),
                      TextInputFindOut(
                          controller: controller.cPassword,
                          label: 'Password',
                          inputFormatters: [
                            FilteringTextInputFormatter.deny(RegExp(r" "))
                          ],
                          textInputType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.done),
                      SizedBox(height: h * 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Checkbox(
                                  value: controller.rememberMe!.value,
                                  activeColor: cBlue,
                                  onChanged: (newValue) {
                                    debugPrint('newValue : $newValue');
                                    controller.rememberMe!.value = newValue!;
                                    debugPrint('controller.rememberMe!.value : ${controller.rememberMe!.value}');
                                    // Text('Remember me');
                                  }),
                              Text('Remember Me', style: AppStyle.textStyleDarkRobotoRegular15,)
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(AppRoutes.forgotPasswordScreen);
                            },
                            child: Column(
                              children: [
                                Text('Forgot Password?', style: AppStyle.textStyleDarkRobotoRegular15),
                                Container(
                                    height: h * 0.002,
                                    width: w * 0.3,
                                    decoration: BoxDecoration(color: cWhite, borderRadius: BorderRadius.circular(20)))
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: h * 0.1),

                      // SizedBox(height: h * 0.02),
                    ],
                  ),
                ),
              ),

              CustomButton(
                title: 'Sign In',
                onPressed: () async {
                  RegExp regex = RegExp(Const.emailPattern);
                  if(controller.cEmail!.text.isEmpty && controller.cPassword!.text.isEmpty){
                    debugPrint('Please enter the email and password');
                    Const().toast('Please enter the email and password');
                  }
                  else if(controller.cEmail!.text.isEmpty) {
                    debugPrint('Please enter the email');
                    Const().toast('Please enter the email');
                  }
                  else if(!regex.hasMatch(controller.cEmail!.text)){
                    Const().toast('Please enter valid email');
                  }

                  else if(controller.cPassword!.text.isEmpty) {
                    debugPrint('Please enter the password');
                    Const().toast('Please enter the password');
                  }
                  else if(controller.cPassword!.text.length < 6 ) {
                    debugPrint('Password must be more then 6 character');
                    Const().toast('Password must be more then 6 character');
                  }
                  else {
                    debugPrint('SAVE LOGIN DATA');
                    controller.saveSignInData();
                  }
                },
              )
            ],
          );
        }),
      ),
    );
  }


}

// class SignInWidget extends GetView<SignInLogic> {
//   const SignInWidget({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final logic = Get.find<SignInLogic>();
//     var h = MediaQuery.of(context).size.height;
//     var w = MediaQuery.of(context).size.width;
//     return Container(
//       decoration: BoxDecoration(
//         gradient: RadialGradient(
//           center: const Alignment(1, -1),
//           radius: 0.5,
//           stops: const [0, 0.9],
//           colors: [cBluewithOpacity, cWhite],
//         ),
//       ),
//       child: Scaffold(
//         backgroundColor: cTransparent,
//         body: Obx(() {
//           return Stack(
//             children: [
//               SingleChildScrollView(
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(horizontal: w * 0.04),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       SizedBox(height: h * 0.06),
//                       Row(
//                         children: [
//                           Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text('Sign In', style: AppStyle.textStyleRobotoMediumBlack20),
//                               SizedBox(height: h * 0.005),
//                               Container(
//                                 height: h * 0.004,
//                                 width: w * 0.1,
//                                 decoration: BoxDecoration(color: cBlue, borderRadius: BorderRadius.circular(20)),
//                               )
//                             ],
//                           ),
//                           SizedBox(width: w * 0.025),
//                           Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               GestureDetector(
//                                 onTap: () {
//                                   Get.offNamed(AppRoutes.signUpScreen);
//                                 },
//                                 child: Text('Sign Up', style: AppStyle.textStyleRobotoRegular15))
//                             ],
//                           )
//                         ],
//                       ),
//                       SizedBox(height: h * 0.05),
//                       Text('Welcome Back,', style: AppStyle.textStyleRobotoMediumBlack35),
//                       RichText(text: TextSpan(
//                           children: [
//                             TextSpan(text: 'To ', style: AppStyle.textStyleRobotoMediumBlack35),
//                             TextSpan(text: 'Ship Pack', style: AppStyle.textStyleRobotoBoldItalicBlue35)
//                           ]
//                       )),
//                       SizedBox(height: h * 0.05),
//                       TextInputFindOut(
//                           controller: controller.cEmail,
//                           label: 'Email',
//                           textInputType: TextInputType.emailAddress),
//                       SizedBox(height: h * 0.03),
//                       TextInputFindOut(
//                           controller: controller.cPassword,
//                           label: 'Password',
//                           inputFormatters: [
//                             FilteringTextInputFormatter.deny(RegExp(r" "))
//                           ],
//                           textInputType: TextInputType.visiblePassword,
//                           textInputAction: TextInputAction.done),
//                       SizedBox(height: h * 0.02),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Row(
//                             // crossAxisAlignment: CrossAxisAlignment.center,
//                             // mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Checkbox(
//                                   value: controller.rememberMe!.value,
//                                   activeColor: cBlue,
//                                   onChanged: (newValue) {
//                                     debugPrint('newValue : $newValue');
//                                     controller.rememberMe!.value = newValue!;
//                                     debugPrint('controller.rememberMe!.value : ${controller.rememberMe!.value}');
//                                     // Text('Remember me');
//                                   }),
//                               Text('Remember Me', style: AppStyle.textStyleRobotoRegular15,)
//                             ],
//                           ),
//                           GestureDetector(
//                             onTap: (){
//                               Get.toNamed(AppRoutes.forgotPasswordScreen);
//                             },
//                             child: Column(
//                               children: [
//                                 Text('Forgot Password?', style: AppStyle.textStyleRobotoRegular15),
//                                 Container(
//                                     height: h * 0.002,
//                                     width: w * 0.3,
//                                     decoration: BoxDecoration(color: cGrey, borderRadius: BorderRadius.circular(20)))
//                               ],
//                             ),
//                           )
//                         ],
//                       ),
//                       SizedBox(height: h * 0.04),
//
//                       // SizedBox(height: h * 0.02),
//                     ],
//                   ),
//                 ),
//               ),
//               CustomButton(
//                 title: 'Sign In',
//                 onPressed: () async {
//                   RegExp regex = RegExp(Const.emailPattern);
//                   if(controller.cEmail!.text.isEmpty && controller.cPassword!.text.isEmpty){
//                     debugPrint('Please enter the email and password');
//                     Const().toast('Please enter the email and password');
//                   }
//                   else if(controller.cEmail!.text.isEmpty) {
//                     debugPrint('Please enter the email');
//                     Const().toast('Please enter the email');
//                   }
//                   else if(!regex.hasMatch(controller.cEmail!.text)){
//                     Const().toast('Please enter valid email');
//                   }
//
//                   else if(controller.cPassword!.text.isEmpty) {
//                     debugPrint('Please enter the password');
//                     Const().toast('Please enter the password');
//                   }
//                   else if(controller.cPassword!.text.length < 6 ) {
//                     debugPrint('Password must be more then 6 character');
//                     Const().toast('Password must be more then 6 character');
//                   }
//                   else {
//                     debugPrint('SAVE LOGIN DATA');
//                     controller.saveSignInData();
//                   }
//                 },
//               )
//             ],
//           );
//         }),
//       ),
//     );
//   }
//
//
// }
