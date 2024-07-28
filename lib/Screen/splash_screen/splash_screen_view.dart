import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_delivery/Constant/app_image.dart';
import 'package:package_delivery/Constant/appstyle.dart';
import 'package:package_delivery/Constant/colors.dart';
import 'package:package_delivery/widget/splash_screen.dart';
import 'splash_screen_logic.dart';

class SplashScreenWidget extends  GetView<SplashScreenLogic> {
  const SplashScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<SplashScreenLogic>();
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: h,
            width: w,
            color: cWhite,
            child:  Image.asset(Assets.splashBackgroundImagePNG,fit: BoxFit.fill),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: h * 0.22,
                width: w * 0.4,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(Assets.splashGifIcon),
                      fit: BoxFit.fill
                  ),
                ),
              ),
              Text('Ship Pack',textAlign: TextAlign.center, style: AppStyle.textStyleRobotoBlackItalic50,),
              Text('One Place, All Logistics',textAlign: TextAlign.center, style: AppStyle.textStyleRobotoMediumItalic20,),
              SizedBox(height: h * 0.2,)
            ],
          )
        ],
      ),
    );
  }
}
