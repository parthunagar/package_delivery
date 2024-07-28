
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_delivery/Constant/colors.dart';

double getHorizontalSize(double px) {
  return px * ((MediaQuery.of(Get.context!).size.width) / 375);
}

double getFontSize(double px) {
  return px * ((MediaQuery.of(Get.context!).size.width) / 375);
}

double getVerticalSize(double px) {
  return px * ((MediaQuery.of(Get.context!).size.height) / 890);
}


const familyRobotoBlack = 'Roboto-Black';
const familyRobotoBlackItalic = 'Roboto-BlackItalic';
const familyRobotoBold= 'Roboto-Bold';
const familyRobotoBoldItalic = 'Roboto-BoldItalic';
const familyRobotoItalic = 'Roboto-Italic';
const familyRobotoLight = 'Roboto-Light';
const familyRobotoLightItalic = 'Roboto-LightItalic';
const familyRobotoMedium= 'Roboto-Medium';
const familyRobotoMediumItalic = 'Roboto-MediumItalic';
const familyRobotoRegular = 'Roboto-Regular';
const familyRobotoThin = 'Roboto-Thin';
const familyRobotoThinItalic = 'Roboto-ThinItalic';

class AppStyle {
  // static TextStyle textStyleMontserratBold30 = TextStyle(color: vpnGrey, fontSize: getFontSize(40),fontFamily: familyMontserratBold);

  static TextStyle textStyleRobotoRegular11 = TextStyle(color: cGrey, fontSize: getFontSize(11),fontFamily: familyRobotoRegular);

  /// DEFINE FONT FAMILY
  static TextStyle textStyleFamilyRobotoBlack = const TextStyle(fontFamily: familyRobotoBlack);
  static TextStyle textStyleFamilyRobotoBlackItalic = const TextStyle(fontFamily: familyRobotoBlackItalic);
  static TextStyle textStyleFamilyRobotoBold = const TextStyle(fontFamily: familyRobotoBold);
  static TextStyle textStyleFamilyRobotoBoldItalic = const TextStyle(fontFamily: familyRobotoBoldItalic);
  static TextStyle textStyleFamilyRobotoItalic = const TextStyle(fontFamily: familyRobotoItalic);
  static TextStyle textStyleFamilyRobotoLight = const TextStyle(fontFamily: familyRobotoLight);
  static TextStyle textStyleFamilyRobotoLightItalic = const TextStyle(fontFamily: familyRobotoLightItalic);
  static TextStyle textStyleFamilyRobotoMedium = const TextStyle(fontFamily: familyRobotoMedium);
  static TextStyle textStyleFamilyRobotoMediumItalic = const TextStyle(fontFamily: familyRobotoMediumItalic);
  static TextStyle textStyleFamilyRobotoRegular = const TextStyle(fontFamily: familyRobotoRegular);
  static TextStyle textStyleFamilyRobotoThin = const TextStyle(fontFamily: familyRobotoThin);
  static TextStyle textStyleFamilyRobotoThinItalic = const TextStyle(fontFamily: familyRobotoThinItalic);


  /// DEFINE FONT COLOR AND FONT SIZE
  static TextStyle textStyleRobotoRegular10 = textStyleFamilyRobotoBlack.copyWith(fontSize: getFontSize(10),color: cGrey);
  static TextStyle textStyleRobotoRegular15 = textStyleFamilyRobotoRegular.copyWith(fontSize: getFontSize(15),color: cGrey);
  static TextStyle textStyleRobotoMediumBlack15 = textStyleFamilyRobotoMedium.copyWith(fontSize: getFontSize(15),color: cBlack);
  static TextStyle textStyleRobotoMediumGrey15 = textStyleFamilyRobotoMedium.copyWith(fontSize: getFontSize(15),color: cGrey);
  static TextStyle textStyleRobotoMedium25 = textStyleFamilyRobotoMedium.copyWith(fontSize: getFontSize(25),color: cBlack);
  static TextStyle textStyleRobotoBold15 = textStyleFamilyRobotoBold.copyWith(fontSize: getFontSize(15),color: cBlack);
  static TextStyle textStyleRobotoRegularBlue15 = textStyleFamilyRobotoRegular.copyWith(fontSize: getFontSize(15),color: cBlue);
  static TextStyle textStyleRobotoLight35 = textStyleFamilyRobotoLight.copyWith(fontSize: getFontSize(35),color: cBlack);
  static TextStyle textStyleRobotoBold35 = textStyleFamilyRobotoBold.copyWith(fontSize: getFontSize(35),color: cBlack);
  static TextStyle textStyleRobotoBoldWhite20 = textStyleFamilyRobotoBold.copyWith(fontSize: getFontSize(20),color: cWhite);
  static TextStyle textStyleRobotoBoldWhite18 = textStyleFamilyRobotoBold.copyWith(fontSize: getFontSize(18),color: cWhite);
  static TextStyle textStyleRobotoBoldBlack20 = textStyleFamilyRobotoBold.copyWith(fontSize: getFontSize(20),color: cBlack);

  static TextStyle textStyleRobotoMediumBlack20 = textStyleFamilyRobotoMedium.copyWith(fontSize: getFontSize(20),color: cBlack);
  // static TextStyle textStyleRobotoRegular15 = textStyleFamilyRobotoRegular.copyWith(fontSize: getFontSize(15),color: cGrey);
  static TextStyle textStyleRobotoMediumBlack35 = textStyleFamilyRobotoMedium.copyWith(fontSize: getFontSize(35),color: cBlack);
  static TextStyle textStyleRobotoBoldItalicBlue35 = textStyleFamilyRobotoBoldItalic.copyWith(fontSize: getFontSize(35),color: cBlue);
  // static TextStyle textStyleRobotoMediumBlack15 = textStyleFamilyRobotoMedium.copyWith(fontSize: getFontSize(15),color: cBlack);
  // static TextStyle textStyleRobotoMediumGrey15 = textStyleFamilyRobotoMedium.copyWith(fontSize: getFontSize(15),color: cGrey);
  // static TextStyle textStyleRobotoBoldWhite20 = textStyleFamilyRobotoBold.copyWith(fontSize: getFontSize(20),color: cWhite);
  static TextStyle textStyleRobotoLightBlack35 = textStyleFamilyRobotoLight.copyWith(fontSize: getFontSize(35),color: cBlack);

  static TextStyle textStyleRobotoRegularGrey12 = textStyleFamilyRobotoRegular.copyWith(fontSize: getFontSize(12),color: cGrey);
  static TextStyle textStyleRobotoRegularGrey15 = textStyleFamilyRobotoRegular.copyWith(fontSize: getFontSize(15),color: cGrey);
  static TextStyle textStyleRobotoRegularGrey25 = textStyleFamilyRobotoRegular.copyWith(fontSize: getFontSize(25),color: cGrey);


  static TextStyle textStyleRobotoMediumBlue15 = textStyleFamilyRobotoMedium.copyWith(fontSize: getFontSize(15),color: cBlue);
  static TextStyle textStyleRobotoMediumWhite15 = textStyleFamilyRobotoMedium.copyWith(fontSize: getFontSize(15),color: cWhite);

  // static TextStyle textStyleRobotoMediumBlack20 = textStyleFamilyRobotoMedium.copyWith(fontSize: getFontSize(20),color: cBlack);
  // static TextStyle textStyleRobotoMediumBlack35 = textStyleFamilyRobotoMedium.copyWith(fontSize: getFontSize(35),color: cBlack);

  static TextStyle textStyleRobotoBoldBlue25 = textStyleFamilyRobotoBold.copyWith(fontSize: getFontSize(25),color: cBlue);
  static TextStyle textStyleRobotoBlackItalic50 = textStyleFamilyRobotoBlackItalic.copyWith(fontSize: getFontSize(50),color: cBlue);
  static TextStyle textStyleRobotoMediumItalic20 = textStyleFamilyRobotoMediumItalic.copyWith(fontSize: getFontSize(20),color: cBlue);
  static TextStyle textStyleRobotoBoldWhite25 = textStyleFamilyRobotoMedium.copyWith(fontSize: getFontSize(25),color: cWhite);


  static TextStyle textStyleRobotoRegularGrey10 = textStyleFamilyRobotoBlack.copyWith(fontSize: getFontSize(10),color: cGrey);
  static TextStyle textStyleRobotoRegularGrey20 = textStyleFamilyRobotoRegular.copyWith(fontSize: getFontSize(20),color: cGrey);
  static TextStyle textStyleRobotoRegularRed15 = textStyleFamilyRobotoRegular.copyWith(fontSize: getFontSize(15),color: cRed);


  static TextStyle textStyleRobotoMediumGreyLight15 = textStyleFamilyRobotoMedium.copyWith(fontSize: getFontSize(15),color: cGreyLight);
  static TextStyle textStyleRobotoMediumParrot15 = textStyleFamilyRobotoMedium.copyWith(fontSize: getFontSize(15),color: cParrot);

  static TextStyle textStyleRobotoBoldBlack15 = textStyleFamilyRobotoBold.copyWith(fontSize: getFontSize(15),color: cBlack);
  static TextStyle textStyleRobotoBoldBlue15 = textStyleFamilyRobotoBold.copyWith(fontSize: getFontSize(15),color: cBlue);
  static TextStyle textStyleRobotoBoldGrey15 = textStyleFamilyRobotoBold.copyWith(fontSize: getFontSize(15),color: cGrey);

  static TextStyle textStyleRobotoMediumGrey20 = textStyleFamilyRobotoMedium.copyWith(fontSize: getFontSize(20),color: cGrey);
  static TextStyle textStyleRobotoMediumBlue20 = textStyleFamilyRobotoMedium.copyWith(fontSize: getFontSize(20),color: cBlue);

  static TextStyle textStyleRobotoMediumParrot12 = textStyleFamilyRobotoMedium.copyWith(fontSize: getFontSize(12),color: cParrot);

  static TextStyle textStyleRobotoMediumWhite20 = textStyleFamilyRobotoMedium.copyWith(fontSize: getFontSize(20),color: cWhite);
  static TextStyle textStyleRobotoMediumWhite35 = textStyleFamilyRobotoMedium.copyWith(fontSize: getFontSize(35),color: cWhite);
  static TextStyle textStyleRobotoBoldWhite35 = textStyleFamilyRobotoBold.copyWith(fontSize: getFontSize(35),color: cWhite);

  static TextStyle textStyleRobotoMediumGreyDivider12 = textStyleFamilyRobotoMedium.copyWith(fontSize: getFontSize(12),color: cGreyDivider);
  static TextStyle textStyleRobotoMediumWhiteOpacity12 = textStyleFamilyRobotoMedium.copyWith(fontSize: getFontSize(12),color: cWhite.withOpacity(0.5));
  static TextStyle textStyleRobotoBoldWhite12 = textStyleFamilyRobotoBold.copyWith(fontSize: getFontSize(12),color: cWhite);

  static TextStyle textStyleRobotoMediumYellowt15 = textStyleFamilyRobotoMedium.copyWith(fontSize: getFontSize(15),color: cYellow);
  static TextStyle textStyleRobotoMediumRed12 = textStyleFamilyRobotoMedium.copyWith(fontSize: getFontSize(12),color: cRed);
  //APPBAR TTTLE
  static TextStyle textStyleRobotoMediumRed15 = textStyleFamilyRobotoMedium.copyWith(fontSize: getFontSize(15),color: cRed);

  static TextStyle textStyleRobotoBlackItalic55 = textStyleFamilyRobotoBlackItalic.copyWith(fontSize: getFontSize(55),color: cWhite);
  static TextStyle textStyleRobotoBlackItalic35 = textStyleFamilyRobotoBlackItalic.copyWith(fontSize: getFontSize(35),color: cWhite);


  ///DARK APP APPSTYLE ///
  static TextStyle textStyleDarkRobotoMediumDarkGrey15 = textStyleFamilyRobotoMedium.copyWith(fontSize: getFontSize(15),color: cDarkGrey);
  static TextStyle textStyleDarkRobotoMediumWhite15 = textStyleFamilyRobotoMedium.copyWith(fontSize: getFontSize(15),color: cWhite);
  static TextStyle textStyleDarkRobotoRegular15 = textStyleFamilyRobotoRegular.copyWith(fontSize: getFontSize(15),color: cWhite);
  static TextStyle textStyleDarkRobotoMediumWhite35 = textStyleFamilyRobotoMedium.copyWith(fontSize: getFontSize(35),color: cWhite);
  static TextStyle textStyleDarkRobotoBoldItalicDarkBlue35 = textStyleFamilyRobotoBoldItalic.copyWith(fontSize: getFontSize(35),color: cBlue);
  static TextStyle textStyleDarkRobotoMediumWhite20 = textStyleFamilyRobotoMedium.copyWith(fontSize: getFontSize(20),color: cWhite);
  static TextStyle textStyleDarkRobotoLightWhite35 = textStyleFamilyRobotoLight.copyWith(fontSize: getFontSize(35),color: cWhite);
  static TextStyle textStyleDarkRobotoRegularDarkGrey15 = textStyleFamilyRobotoRegular.copyWith(fontSize: getFontSize(15),color: cDarkGrey);
  static TextStyle textStyleDarkRobotoBoldWhite35 = textStyleFamilyRobotoBold.copyWith(fontSize: getFontSize(35),color: cWhite);
  static TextStyle textStyleDarkRobotoBoldBlue25 = textStyleFamilyRobotoBold.copyWith(fontSize: getFontSize(25),color: cBlue);
  static TextStyle textStyleDarkRobotoRegularWhite25 = textStyleFamilyRobotoRegular.copyWith(fontSize: getFontSize(25),color: cWhite);
  static TextStyle textStyleDarkRobotoMediumWhite25 = textStyleFamilyRobotoMedium.copyWith(fontSize: getFontSize(25),color: cWhite);
  static TextStyle textStyleDarkRobotoBoldBlue15 = textStyleFamilyRobotoMedium.copyWith(fontSize: getFontSize(15),color: cBlue);
  static TextStyle textStyleDarkRobotoBoldDarkBlue15 = textStyleFamilyRobotoMedium.copyWith(fontSize: getFontSize(15),color: cDarkBlue);
  static TextStyle textStyleRobotoMediumBlue12 = textStyleFamilyRobotoMedium.copyWith(fontSize: getFontSize(12),color: cDarkBlue);
  static TextStyle textStyleRobotoMediumDarkBlue12 = textStyleFamilyRobotoMedium.copyWith(fontSize: getFontSize(12),color: cBlue);
  static TextStyle textStyleRobotoMediumYellow12 = textStyleFamilyRobotoMedium.copyWith(fontSize: getFontSize(12),color: cYellowMassage);
  static TextStyle textStyleRobotoMediumWhite12 = textStyleFamilyRobotoMedium.copyWith(fontSize: getFontSize(12),color: cWhite);
  static TextStyle textStyleDarkRobotoMediumBlack15 = textStyleFamilyRobotoMedium.copyWith(fontSize: getFontSize(15),color: cBlack);
  static TextStyle textStyleDarkRobotoRegularBlack12 = textStyleFamilyRobotoMedium.copyWith(fontSize: getFontSize(12),color: cBlack);
  static TextStyle textStyleDarkRobotoBoldWhite15 = textStyleFamilyRobotoBold.copyWith(fontSize: getFontSize(15),color: cWhite);
  static TextStyle textStyleDarkRobotoRegularDarkGrey13 = textStyleFamilyRobotoRegular.copyWith(fontSize: getFontSize(13),color: cDarkGrey);
  // static TextStyle textStyleRobotoMediumBlack35 = textStyleFamilyRobotoMedium.copyWith(fontSize: getFontSize(35),color: cBlack);

  static TextStyle textStyleDarkRobotoBoldWhite25 = textStyleFamilyRobotoBold.copyWith(fontSize: getFontSize(25),color: cWhite);
  static TextStyle textDarkStyleDarkRobotoBoldBlue25 = textStyleFamilyRobotoBold.copyWith(fontSize: getFontSize(25),color: cBlue);
  static TextStyle textDarkStyleDarkRobotoBoldBlue23 = textStyleFamilyRobotoBold.copyWith(fontSize: getFontSize(23),color: cBlue);
  static TextStyle textDarkStyleRobotoRegularGrey25 = textStyleFamilyRobotoRegular.copyWith(fontSize: getFontSize(25),color: cGrey);
  static TextStyle textStyleRobotoMediumDarkBlue18 = textStyleFamilyRobotoMedium.copyWith(fontSize: getFontSize(18),color: cDarkBlue);

}