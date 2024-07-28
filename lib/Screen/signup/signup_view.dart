import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:package_delivery/AppRoute/app_route.dart';
import 'package:package_delivery/Constant/app_constant.dart';
import 'package:package_delivery/Constant/appstyle.dart';
import 'package:package_delivery/Constant/colors.dart';
import 'package:package_delivery/Utils/preference.dart';
import 'package:package_delivery/widget/custom_button.dart';
import 'package:package_delivery/widget/text_input_filed.dart';
import 'signup_controller.dart';


class SignUpWidget extends GetView<SignupLogic> {
  const SignUpWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<SignupLogic>();
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: cDarkBlue,
      // appBar: AppBar(title: Text(''),),
      body: GetBuilder<SignupLogic>(builder: (logic) {
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
                            GestureDetector(
                              onTap: () {
                                Get.offNamed(AppRoutes.signInScreen);
                              },
                              child: Text('Sign In', style: AppStyle.textStyleRobotoRegular15),
                            ),
                          ],
                        ),
                        SizedBox(width: w * 0.025),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Sign Up', style: AppStyle.textStyleDarkRobotoMediumWhite20),
                            SizedBox(height: h * 0.005),
                            Container(
                              height: h * 0.004,
                              width: w * 0.1,
                              decoration: BoxDecoration(color: cBlue, borderRadius: BorderRadius.circular(20)),
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: h * 0.05),
                    RichText(text: TextSpan(
                        children: [
                          TextSpan(text: 'Hello, ', style: AppStyle.textStyleDarkRobotoLightWhite35),
                          TextSpan(text: 'There', style: AppStyle.textStyleDarkRobotoMediumWhite35)
                        ]
                    )),
                    SizedBox(height: h * 0.005),
                    Text('Enter your information below to get', style: AppStyle.textStyleDarkRobotoRegularDarkGrey15),
                    Text('started your services Bill', style: AppStyle.textStyleDarkRobotoRegularDarkGrey15),
                    // RichText(text:  TextSpan(
                    //     children: [
                    //       TextSpan(text: ),
                    //       TextSpan(text: 'started your services Bill',style: AppStyle.textStyleRobotoRegular15)
                    //     ]
                    // )),
                    SizedBox(height: h * 0.05),
                    TextInputFindOut(
                        controller: controller.cName,
                        label: 'Name',
                        textInputType: TextInputType.name),
                    SizedBox(height: h * 0.03),
                    // TextInputFindOut(
                    //   controller: controller.cPhone,
                    //   label: 'Phone Number',
                    //   textInputType: TextInputType.phone),
                    // SizedBox(height: h * 0.03),

                    IntlPhoneField(
                      autovalidateMode: AutovalidateMode.disabled,
                      countries: Const.countries,
                      // controller: controller.cPhone,
                      // initialValue: '12',
                      // initialValue: '9090909090',
                      // dropdownIconPosition: IconPosition.trailing,
                      // showDropdownIcon: false,
                      flagsButtonPadding: EdgeInsets.only(left: w * 0.03),
                      dropdownIcon: Icon(Icons.arrow_drop_down_outlined, color: cDarkGrey),
                      showCountryFlag: false,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                        dropdownTextStyle:  AppStyle.textStyleDarkRobotoMediumDarkGrey15,

                      // initialCountryCode: '+91',
                      // controller: controller.cPhone,
                      style: AppStyle.textStyleDarkRobotoMediumDarkGrey15,
                      decoration: InputDecoration(
                        // prefixStyle:  AppStyle.textStyleDarkRobotoMediumDarkGrey15,
                        // hintStyle:  AppStyle.textStyleDarkRobotoMediumDarkGrey15,
                        // helperStyle:  AppStyle.textStyleDarkRobotoMediumDarkGrey15,

                        filled: true,
                        isDense: true,
                        labelText: 'Phone Number',
                        errorBorder: InputBorder.none,
                        fillColor: cDarkBlue,
                        counterText: '',
                        contentPadding: EdgeInsets.only(left: w * 0.04, right: w * 0.04),
                        focusedErrorBorder: InputBorder.none,

                        labelStyle: AppStyle.textStyleDarkRobotoMediumWhite15,

                        // floatingLabelBehavior:FloatingLabelBehavior.always,
                        // alignLabelWithHint: true,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: cDarkGreyBorder, width: 2)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide(color: cWhite)),
                      ),
                      onChanged: (phone) {
                        debugPrint('onChanged => phone : $phone');
                        debugPrint('onChanged => phone.completeNumber : ${phone.completeNumber}');
                        debugPrint('onChanged => phone.countryISOCode : ${phone.countryISOCode}');
                        debugPrint('onChanged => phone.countryCode : ${phone.countryCode}');
                        debugPrint('onChanged => phone.number : ${phone.number}');
                        controller.countryCode!.value = phone.countryCode;
                        controller.cPhone!.text = phone.number;
                      },
                      onCountryChanged: (country) {
                        debugPrint('onCountryChanged => country : $country');
                        debugPrint('onCountryChanged => country.name : ${country.name}');
                        debugPrint('onCountryChanged => country.flag : ${country.flag}');
                        debugPrint('onCountryChanged => country.code : ${country.code}');
                        debugPrint('onCountryChanged => country.dialCode : ${country.dialCode}');
                        debugPrint('onCountryChanged => country.minLength : ${country.minLength}');
                        debugPrint('onCountryChanged => country.maxLength : ${country.maxLength}');
                        controller.countryCode!.value = '+${country.dialCode}';
                      },
                    ),
                    SizedBox(height: h * 0.03),
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
                        textInputType: TextInputType.visiblePassword),
                    SizedBox(height: h * 0.03),
                    TextInputFindOut(
                        controller: controller.cConPassword,
                        label: 'Confirm Password',
                        textInputType: TextInputType.visiblePassword),
                    SizedBox(height: h * 0.03),
                    TextInputFindOut(
                        controller: controller.cAddress,
                        label: 'Address',
                        textInputType: TextInputType.streetAddress,
                        textInputAction: TextInputAction.done),
                    SizedBox(height: h * 0.15),
                  ],
                ),
              ),
            ),
            CustomButton(
              title: 'Sign Up',
              onPressed: () async {


                debugPrint('phone number : ${controller.cPhone!.text}');
                RegExp numericValueNotAllow = RegExp(Const.nameWithNumericPattern);
                RegExp specialCharacterNotAllow = RegExp(Const.nameWithSpecialCharacterPattern);

                RegExp emailAllow = RegExp(Const.emailPattern);

                RegExp oneUpperCase = RegExp(r'(?=.*[A-Z])');
                RegExp oneLowerCase = RegExp(r'(?=.*[a-z])');
                RegExp allowOneDigit = RegExp(r'(?=.*?[0-9])');

                if (controller.cName!.text.isEmpty &&
                    controller.cPhone!.text.isEmpty &&
                    controller.cEmail!.text.isEmpty &&
                    controller.cPassword!.text.isEmpty &&
                    controller.cConPassword!.text.isEmpty &&
                    controller.cAddress!.text.isEmpty) {
                  debugPrint('Please enter the email and password');
                  Const().toast('Please enter all the details.');
                }
                else if (controller.cName!.text.isEmpty) {
                  Const().toast('Please enter the name');
                }
                else if (numericValueNotAllow.hasMatch(controller.cName!.text)) {
                  Const().toast('Please enter only characters in name field');
                }
                else if (!specialCharacterNotAllow.hasMatch(controller.cName!.text)) {
                  Const().toast("Name field Must not contain special character in last position");
                }
                else if (controller.cPhone!.text.isEmpty) {
                  Const().toast('Please enter the phone number');
                  return;
                } else if (numericValueNotAllow.hasMatch(controller.cName!.text)) {
                  Const().toast('Numeric value not allowed');
                  return;
                } else if (!specialCharacterNotAllow.hasMatch(controller.cName!.text)) {
                  Const().toast("Name field Must not contain special character in the last position");
                  return;
                } else if (controller.cPhone!.text.isEmpty) {
                  Const().toast('Please enter the phone number');
                  return;
                } else if (controller.cEmail!.text.isEmpty) {
                  Const().toast('Please enter the email');
                  return;
                } else if (!emailAllow.hasMatch(controller.cEmail!.text)) {
                  Const().toast('Please enter valid email');
                  return;
                } else if (controller.cPassword!.text.isEmpty) {
                  Const().toast('Please enter the password');
                  return;
                } else if (!oneUpperCase.hasMatch(controller.cPassword!.text)) {
                  Const().toast('The password must contain one or more uppercase characters.');
                  return;
                } else if (!oneLowerCase.hasMatch(controller.cPassword!.text)) {
                  Const().toast('The password must contain one or more lowercase characters.');
                  return;
                } else if (!allowOneDigit.hasMatch(controller.cPassword!.text)) {
                  Const().toast('The Password must contain one or more digits.');
                  return;
                } else if (controller.cPassword!.text.length < 6) {
                  debugPrint('Password must be more then 6 character');
                  Const().toast('Password must be more then 6 character');

                  return;
                } else if (controller.cConPassword!.text.isEmpty) {
                  Const().toast('Please enter the confirm password');
                  return;
                }
                // else if (controller.cConPassword!.text.length < 6) {
                //   debugPrint('Confirm password must be more then 6 character');
                //   Const().toast('Password must be more then 6 character');
                //   return;
                // }
                else if (controller.cPassword!.text.toString() != controller.cConPassword!.text.toString()) {
                  Const().toast('Password and Confirm Password must be same');
                  return;
                } else if (controller.cAddress!.text.isEmpty) {
                  Const().toast('Please enter the address');
                  return;
                } else {
                  saveSignUpData();
                }
              },
            ),
          ],
        );
      }),
    );
  }

  saveSignUpData() async {
    debugPrint('name : ${controller.cName!.text.trim()}');
    debugPrint('country code : ${ controller.countryCode!.value }');
    debugPrint('phone : ${controller.cPhone!.text.trim()}');
    debugPrint('email : ${controller.cEmail!.text.trim()}');
    debugPrint('password : ${controller.cPassword!.text.trim()}');
    debugPrint('confirm password : ${controller.cConPassword!.text.trim()}');
    debugPrint('address : ${controller.cAddress!.text.trim()}');

    await Preference().save(Const.prefName, controller.cName!.text.trim());
    await Preference().save(Const.prefPhoneCode, controller.countryCode!.value);
    await Preference().save(Const.prefPhone, controller.cPhone!.text.trim());
    await Preference().save(Const.prefEmail, controller.cEmail!.text.trim());
    await Preference().save(Const.prefPass, controller.cPassword!.text.trim());
    await Preference().save(Const.prefAddress, controller.cAddress!.text.toString());
    var a = await Preference().read(Const.prefName);

    debugPrint('saveData => a : $a');
    Get.toNamed(AppRoutes.roleScreen);
  }
}


// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:intl_phone_field/intl_phone_field.dart';
// import 'package:package_delivery/AppRoute/app_route.dart';
// import 'package:package_delivery/Constant/app_constant.dart';
// import 'package:package_delivery/Constant/appstyle.dart';
// import 'package:package_delivery/Constant/colors.dart';
// import 'package:package_delivery/Utils/preference.dart';
// import 'package:package_delivery/widget/custom_button.dart';
// import 'package:package_delivery/widget/text_input_filed.dart';
// import 'signup_controller.dart';
//
// class SignUpWidget extends GetView<SignupLogic> {
//   const SignUpWidget({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final logic = Get.find<SignupLogic>();
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
//         // appBar: AppBar(title: Text(''),),
//         body: GetBuilder<SignupLogic>(builder: (logic) {
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
//                               GestureDetector(
//                                 onTap: () {
//                                   Get.offNamed(AppRoutes.signInScreen);
//                                 },
//                                 child: Text('Sign In', style: AppStyle.textStyleRobotoRegular15),
//                               ),
//                             ],
//                           ),
//                           SizedBox(width: w * 0.025),
//                           Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text('Sign Up', style: AppStyle.textStyleRobotoMediumBlack20),
//                               SizedBox(height: h * 0.005),
//                               Container(
//                                 height: h * 0.004,
//                                 width: w * 0.1,
//                                 decoration: BoxDecoration(color: cBlue, borderRadius: BorderRadius.circular(20)),
//                               )
//                             ],
//                           )
//                         ],
//                       ),
//                       SizedBox(height: h * 0.05),
//                       RichText(text: TextSpan(
//                           children: [
//                             TextSpan(text: 'Hello, ', style: AppStyle.textStyleRobotoLightBlack35),
//                             TextSpan(text: 'There', style: AppStyle.textStyleRobotoMediumBlack35)
//                           ]
//                       )),
//                       SizedBox(height: h * 0.005),
//                       Text('Enter your information below to get', style: AppStyle.textStyleRobotoRegular15),
//                       Text('started your services Bill', style: AppStyle.textStyleRobotoRegular15),
//                       // RichText(text:  TextSpan(
//                       //     children: [
//                       //       TextSpan(text: ),
//                       //       TextSpan(text: 'started your services Bill',style: AppStyle.textStyleRobotoRegular15)
//                       //     ]
//                       // )),
//                       SizedBox(height: h * 0.05),
//                       TextInputFindOut(
//                           controller: controller.cName,
//                           label: 'Name',
//                           textInputType: TextInputType.name),
//                       SizedBox(height: h * 0.03),
//                       // TextInputFindOut(
//                       //   controller: controller.cPhone,
//                       //   label: 'Phone Number',
//                       //   textInputType: TextInputType.phone),
//                       // SizedBox(height: h * 0.03),
//
//                       IntlPhoneField(
//                         autovalidateMode: AutovalidateMode.disabled,
//                         // controller: controller.cPhone,
//                         // initialValue: '12',
//                         // initialValue: '9090909090',
//                         // dropdownIconPosition: IconPosition.trailing,
//                         // showDropdownIcon: false,
//                         flagsButtonPadding: EdgeInsets.only(left: w * 0.03),
//                         dropdownIcon: Icon(Icons.arrow_drop_down_outlined, color: cBlack),
//                         showCountryFlag: false,
//                         inputFormatters: [
//                           FilteringTextInputFormatter.digitsOnly
//                         ],
//                         // initialCountryCode: '+91',
//                         // controller: controller.cPhone,
//                         decoration: InputDecoration(
//                           filled: true,
//                           isDense: true,
//                           labelText: 'Phone Number',
//                           errorBorder: InputBorder.none,
//                           fillColor: cWhite,
//                           counterText: '',
//                           contentPadding: EdgeInsets.only(left: w * 0.04, right: w * 0.04),
//                           focusedErrorBorder: InputBorder.none,
//                           labelStyle: AppStyle.textStyleRobotoMediumGrey15,
//
//                           // floatingLabelBehavior:FloatingLabelBehavior.always,
//                           // alignLabelWithHint: true,
//                           enabledBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(12),
//                               borderSide: BorderSide(color: cGrey, width: 2)),
//                           focusedBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(12.0),
//                               borderSide: BorderSide(color: cBlack)),
//                         ),
//                         onChanged: (phone) {
//                           debugPrint('onChanged => phone : $phone');
//                           debugPrint('onChanged => phone.completeNumber : ${phone.completeNumber}');
//                           debugPrint('onChanged => phone.countryISOCode : ${phone.countryISOCode}');
//                           debugPrint('onChanged => phone.countryCode : ${phone.countryCode}');
//                           debugPrint('onChanged => phone.number : ${phone.number}');
//                           controller.countryCode!.value = phone.countryCode;
//                           controller.cPhone!.text = phone.number;
//                         },
//                         onCountryChanged: (country) {
//                           debugPrint('onCountryChanged => country : $country');
//                           debugPrint('onCountryChanged => country.name : ${country.name}');
//                           debugPrint('onCountryChanged => country.flag : ${country.flag}');
//                           debugPrint('onCountryChanged => country.code : ${country.code}');
//                           debugPrint('onCountryChanged => country.dialCode : ${country.dialCode}');
//                           debugPrint('onCountryChanged => country.minLength : ${country.minLength}');
//                           debugPrint('onCountryChanged => country.maxLength : ${country.maxLength}');
//                           controller.countryCode!.value = '+${country.dialCode}';
//                         },
//                       ),
//                       SizedBox(height: h * 0.03),
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
//                           textInputType: TextInputType.visiblePassword),
//                       SizedBox(height: h * 0.03),
//                       TextInputFindOut(
//                           controller: controller.cConPassword,
//                           label: 'Confirm Password',
//                           textInputType: TextInputType.visiblePassword),
//                       SizedBox(height: h * 0.03),
//                       TextInputFindOut(
//                           controller: controller.cAddress,
//                           label: 'Address',
//                           textInputType: TextInputType.streetAddress,
//                           textInputAction: TextInputAction.done),
//                       SizedBox(height: h * 0.15),
//                     ],
//                   ),
//                 ),
//               ),
//               CustomButton(
//                 title: 'Sign Up',
//                 onPressed: () async {
//
//
//                   debugPrint('phone number : ${controller.cPhone!.text}');
//                   RegExp numericValueNotAllow = RegExp(Const.nameWithNumericPattern);
//                   RegExp specialCharacterNotAllow = RegExp(Const.nameWithSpecialCharacterPattern);
//                   RegExp emailAllow = RegExp(Const.emailPattern);
//                   if (controller.cName!.text.isEmpty &&
//                       controller.cPhone!.text.isEmpty &&
//                       controller.cEmail!.text.isEmpty &&
//                       controller.cPassword!.text.isEmpty &&
//                       controller.cConPassword!.text.isEmpty &&
//                       controller.cAddress!.text.isEmpty) {
//                     debugPrint('Please enter the email and password');
//                     Const().toast('Please enter all the details.');
//                   }
//                    else if (controller.cName!.text.isEmpty) {
//                     Const().toast('Please enter the name');
//                   }
//                   else if (numericValueNotAllow.hasMatch(controller.cName!.text)) {
//                     Const().toast('Please enter only characters in name field');
//                   }
//                   else if (!specialCharacterNotAllow.hasMatch(controller.cName!.text)) {
//                     Const().toast("Name field Must not contain special character in last position");
//                   }
//                   else if (controller.cPhone!.text.isEmpty) {
//                     return;
//                   } else if (numericValueNotAllow.hasMatch(controller.cName!.text)) {
//                     Const().toast('Numeric value not allowed');
//                     return;
//                   } else if (!specialCharacterNotAllow.hasMatch(controller.cName!.text)) {
//                     Const().toast("Name field Must not contain special character in the last position");
//                     return;
//                   } else if (controller.cPhone!.text.isEmpty) {
//                     Const().toast('Please enter the phone number');
//                     return;
//                   } else if (controller.cEmail!.text.isEmpty) {
//                     Const().toast('Please enter the email');
//                     return;
//                   } else if (!emailAllow.hasMatch(controller.cEmail!.text)) {
//                     Const().toast('Please enter valid email');
//                     return;
//                   } else if (controller.cPassword!.text.isEmpty) {
//                     Const().toast('Please enter the password');
//                     return;
//                   } else if (controller.cPassword!.text.length < 6) {
//                     debugPrint('Password must be more then 6 character');
//                     Const().toast('Password must be more then 6 character');
//                     return;
//                   } else if (controller.cConPassword!.text.isEmpty) {
//                     Const().toast('Please enter the confirm password');
//                     return;
//                   } else if (controller.cConPassword!.text.length < 6) {
//                     debugPrint('Confirm password must be more then 6 character');
//                     Const().toast('Password must be more then 6 character');
//                     return;
//                   }else if (controller.cPassword!.text.toString() != controller.cConPassword!.text.toString()) {
//                     Const().toast('Password and Confirm Password must be same');
//                     return;
//                   } else if (controller.cAddress!.text.isEmpty) {
//                     Const().toast('Please enter the address');
//                     return;
//                   } else {
//                     saveSignUpData();
//                   }
//                 },
//               ),
//             ],
//           );
//         }),
//       ),
//     );
//   }
//
//   saveSignUpData() async {
//     debugPrint('name : ${controller.cName!.text.trim()}');
//     debugPrint('country code : ${ controller.countryCode!.value }');
//     debugPrint('phone : ${controller.cPhone!.text.trim()}');
//     debugPrint('email : ${controller.cEmail!.text.trim()}');
//     debugPrint('password : ${controller.cPassword!.text.trim()}');
//     debugPrint('confirm password : ${controller.cConPassword!.text.trim()}');
//     debugPrint('address : ${controller.cAddress!.text.trim()}');
//
//     await Preference().save(Const.prefName, controller.cName!.text.trim());
//     await Preference().save(Const.prefPhoneCode, controller.countryCode!.value);
//     await Preference().save(Const.prefPhone, controller.cPhone!.text.trim());
//     await Preference().save(Const.prefEmail, controller.cEmail!.text.trim());
//     await Preference().save(Const.prefPass, controller.cPassword!.text.trim());
//     await Preference().save(Const.prefAddress, controller.cAddress!.text.toString());
//     var a = await Preference().read(Const.prefName);
//
//     debugPrint('saveData => a : $a');
//     Get.toNamed(AppRoutes.roleScreen);
//   }
// }
