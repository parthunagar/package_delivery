
import 'package:flutter/material.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:package_delivery/Constant/app_image.dart';
import 'package:package_delivery/Constant/appstyle.dart';
import 'package:package_delivery/Constant/colors.dart';

YYDialog dialogWithDivider(
    BuildContext c,
    String header,
    String btn1Title,
    String btn2Title,
    dynamic onTap1,
    dynamic onTap2) {
  var h = MediaQuery.of(c).size.height;
  var w = MediaQuery.of(c).size.width;
  return YYDialog().build(c)
    ..width = w * 0.8
  // ..height = h * 0.5
    ..borderRadius = 4.0
    ..borderRadius = 10.0
    ..widget(
        Padding(
            padding: EdgeInsets.only(top: h * 0.04),
            child: SvgPicture.asset(Assets.iconUploadPhoto, height: h * 0.07, fit: BoxFit.contain)))

    ..text(
        padding: const EdgeInsets.all(25.0),
        alignment: Alignment.center,
        textAlign: TextAlign.center,
        text: header,
        color: cGrey,
        fontSize: 14.0,
        fontWeight: FontWeight.w500)

    ..widget(
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: onTap1,
            child: SvgPicture.asset(Assets.iconUploadCamera, height: h * 0.07, fit: BoxFit.contain),
          ),
          SizedBox(width: w * 0.05),
          GestureDetector(
            onTap: onTap2,
            child: SvgPicture.asset(Assets.iconUploadGallery, height: h * 0.07, fit: BoxFit.contain),
          )
        ],
      )
    )
    ..widget(SizedBox(height: h * 0.04))


  // ..divider()
  //   ..doubleButton(
  //       padding: const EdgeInsets.only(top: 10.0),
  //       gravity: Gravity.center,
  //       // withDivider: true,
  //       text1: btn1Title,
  //
  //       color1: cGrey,
  //       fontSize1: 14.0,
  //       fontWeight1: FontWeight.bold,
  //       onTap1: onTapCancel,
  //       text2: btn2Title,
  //       color2: cGrey,
  //       fontSize2: 14.0,
  //       fontWeight2: FontWeight.bold,
  //       onTap2: onTapDelete)
    ..duration = const Duration(milliseconds: 500)
    ..animatedFunc = (child, animation) {
      return ScaleTransition(child: child, scale: Tween(begin: 0.0, end: 1.0).animate(animation));
    }
    ..show();
}


YYDialog dialogChooseDivider(
    BuildContext c,
    String header,
    String btn1Title,
    String btn2Title,
    dynamic onTap1,
    dynamic onTap2,
    // bool changeColorBtn1,
    // bool changeColorBtn2,
    ) {
  var h = MediaQuery.of(c).size.height;
  var w = MediaQuery.of(c).size.width;
  return YYDialog().build(c)
    ..width = w * 0.8
  // ..height = h * 0.5
    ..borderRadius = 4.0
    ..borderRadius = 10.0
    ..widget(
        Padding(
            padding: EdgeInsets.only(top: h * 0.04),
            child: SvgPicture.asset(Assets.iconDriver, height: h * 0.1, fit: BoxFit.contain)))

    ..text(
        padding: const EdgeInsets.all(25.0),
        alignment: Alignment.center,
        textAlign: TextAlign.center,
        text: header,
        color: cGrey,
        fontSize: 14.0,
        fontWeight: FontWeight.w500)

    ..widget(
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: onTap1,
              child:Container(
                padding: EdgeInsets.symmetric(horizontal: w * 0.06,vertical: h * 0.01),
                decoration: BoxDecoration(
                  border: Border.all(color: cBlue),
                  color: cBlue,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(btn1Title,style: AppStyle.textStyleRobotoBoldWhite20,),
              ),
            ),
            SizedBox(width: w * 0.05),
            GestureDetector(
              onTap: onTap2,
              child:Container(
                padding: EdgeInsets.symmetric(horizontal: w * 0.06,vertical: h * 0.01),
                decoration: BoxDecoration(
                  border: Border.all(color: cBlue),
                  color: cWhite,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(btn2Title,style: AppStyle.textStyleRobotoBoldBlack20,),
              ),
            ),
          ],
        )
    )
    // ..widget(SizedBox(height: h * 0.04))


  // ..divider()
  //   ..doubleButton(
  //       padding: const EdgeInsets.only(top: 10.0),
  //       gravity: Gravity.center,
  //       // withDivider: true,
  //       text1: btn1Title,
  //       color1: cGrey,
  //       fontSize1: 14.0,
  //       fontWeight1: FontWeight.bold,
  //       onTap1: onTap1,
  //       text2: btn2Title,
  //       color2: cGrey,
  //       fontSize2: 14.0,
  //       fontWeight2: FontWeight.bold,
  //       onTap2: onTap2)
    ..widget(SizedBox(height: h * 0.04))
    ..duration = const Duration(milliseconds: 500)
    ..animatedFunc = (child, animation) {
      return ScaleTransition(child: child, scale: Tween(begin: 0.0, end: 1.0).animate(animation));
    }
    ..show();
}

YYDialog dialogApplyCoupon(
    BuildContext c,
    String header,
    String btn1Title,
    String btn2Title,
    dynamic onTap1,
    dynamic onTap2,
    // bool changeColorBtn1,
    // bool changeColorBtn2,
    ) {
  var h = MediaQuery.of(c).size.height;
  var w = MediaQuery.of(c).size.width;
  return YYDialog().build(c)
    ..width = w * 0.8
  // ..height = h * 0.5
    ..borderRadius = 4.0
    ..borderRadius = 10.0
    // ..widget(
    //     Padding(
    //         padding: EdgeInsets.only(top: h * 0.04),
    //         child: SvgPicture.asset(Assets.iconDriver, height: h * 0.1, fit: BoxFit.contain))
    // )

    ..text(
        padding: const EdgeInsets.all(25.0),
        alignment: Alignment.center,
        textAlign: TextAlign.center,
        text: header,
        color: cGrey,
        fontSize: 14.0,
        fontWeight: FontWeight.w500)

    ..widget(
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: onTap1,
              child:Container(
                padding: EdgeInsets.symmetric(horizontal: w * 0.06,vertical: h * 0.01),
                decoration: BoxDecoration(
                  border: Border.all(color: cBlue),
                  color: cBlue,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(btn1Title,style: AppStyle.textStyleRobotoBoldWhite20,),
              ),
            ),
            SizedBox(width: w * 0.05),
            GestureDetector(
              onTap: onTap2,
              child:Container(
                padding: EdgeInsets.symmetric(horizontal: w * 0.06,vertical: h * 0.01),
                decoration: BoxDecoration(
                  border: Border.all(color: cBlue),
                  color: cWhite,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(btn2Title,style: AppStyle.textStyleRobotoBoldBlack20,),
              ),
            ),
          ],
        )
    )
  // ..widget(SizedBox(height: h * 0.04))


  // ..divider()
  //   ..doubleButton(
  //       padding: const EdgeInsets.only(top: 10.0),
  //       gravity: Gravity.center,
  //       // withDivider: true,
  //       text1: btn1Title,
  //       color1: cGrey,
  //       fontSize1: 14.0,
  //       fontWeight1: FontWeight.bold,
  //       onTap1: onTap1,
  //       text2: btn2Title,
  //       color2: cGrey,
  //       fontSize2: 14.0,
  //       fontWeight2: FontWeight.bold,
  //       onTap2: onTap2)
    ..widget(SizedBox(height: h * 0.04))
    ..duration = const Duration(milliseconds: 500)
    ..animatedFunc = (child, animation) {
      return ScaleTransition(child: child, scale: Tween(begin: 0.0, end: 1.0).animate(animation));
    }
    ..show();
}