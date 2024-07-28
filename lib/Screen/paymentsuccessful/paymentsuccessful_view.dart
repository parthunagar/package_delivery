import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_delivery/AppRoute/NavigationArgs.dart';
import 'package:package_delivery/AppRoute/app_route.dart';
import 'package:package_delivery/Constant/app_image.dart';
import 'package:package_delivery/Constant/appstyle.dart';
import 'package:package_delivery/Constant/colors.dart';
import 'package:package_delivery/Screen/dashboard/dashboard_controller.dart';
import 'package:package_delivery/Screen/paymentsuccessful/paymentsuccessful_controller.dart';
import 'package:package_delivery/Screen/traking/traking_logic.dart';
import 'package:package_delivery/widget/custom_button.dart';

class PaymentSuccessfulWidget extends GetView<PaymentSuccessfulLogic> {
  const PaymentSuccessfulWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<PaymentSuccessfulLogic>();

    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    Future<bool> _willPopCallback() async {
      Get.offAllNamed(AppRoutes.dashboardScreen);
      return true;
    }

    return WillPopScope(
      onWillPop: _willPopCallback,
      child: Scaffold(
        backgroundColor: cDarkBlue,
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: h / 1.65,
                    child: Image.asset(Assets.imageDone, fit: BoxFit.fill),
                  ),
                  Padding(
                    padding: EdgeInsets.all(w / 20),
                    child: Column(
                      children: [
                        SizedBox(height: h / 100),
                        Text(
                          "Your request has been sent and your dispatcher will contact you soon.",
                          textAlign: TextAlign.center,
                          style: AppStyle.textStyleRobotoRegularGrey20,
                        ),
                        SizedBox(height: h / 25),
                        Text.rich(
                          TextSpan(
                              text: "Your Tracking ID is ",
                              style: AppStyle.textStyleRobotoMediumGrey20,
                              children: [
                                TextSpan(
                                  text: controller.trackingID!.value.toString(),// "#BAN968",
                                  style: AppStyle.textStyleRobotoMediumWhite20)
                              ]),
                        ),
                        SizedBox(height: h * 0.15),

                      ],
                    ),
                  )
                ],
              ),
            ),
           Column(
             // crossAxisAlignment: CrossAxisAlignment.end,
             mainAxisAlignment: MainAxisAlignment.end,
             children: [
               CustomButton(
                 onPressed: () {
                   // Get.put<DashboardLogic>(DashboardLogic());
                   // var dLogic = Get.find<DashboardLogic>();
                   // Get.toNamed(AppRoutes.dashboardScreen,parameters: {NavigationArgs.kPaymentSuccess : 'true'});
                   Get.offAllNamed(AppRoutes.dashboardScreen)!.then((value) {
                     debugPrint('changeTabIndex => value : $value');
                     // dLogic.tabIndex.value = 2;
                     // dLogic.changeTabIndex(2);
                   }).onError((error, stackTrace) {
                     debugPrint('changeTabIndex => error : $error');
                   });
                   // dLogic.changeTabIndex(2);
                   // Future.delayed(Duration(seconds: 3)).then((value) {});
                   bool test = Get.isRegistered<DashboardLogic>();
                   bool testTracking = Get.isRegistered<TrakingLogic>();
                   if(test == false) {
                     var dLogic =  Get.put<DashboardLogic>(DashboardLogic());

                     // Get.find<DashboardLogic>();
                     // dLogic.changeTabIndex(2);
                     dLogic.tabIndex.value = 2;
                     dLogic.backGroundColor.value= cWhite;
                     debugPrint('trackingID : ${controller.trackingID.toString()}');
                     if(testTracking == false){
                       debugPrint('testTracking == false');
                       var trackingLogic =  Get.put<TrakingLogic>(TrakingLogic());
                       trackingLogic.callTrackingList(trackId: controller.trackingID.toString());
                     }
                     else{
                       var trackingLogic =  Get.find<TrakingLogic>();
                       trackingLogic.callTrackingList(trackId: controller.trackingID.toString());
                       debugPrint('testTracking != false');
                     }



                     debugPrint('dLogic.tabIndex.value : ${dLogic.tabIndex.value}');
                   }

                 },
                 title: "Go to Tracking",
                 padding: EdgeInsets.symmetric(horizontal: w * 0.2)),
               // SizedBox(height: h / 50),
               CustomButton(
                 onPressed: (){
                   Get.offAllNamed(AppRoutes.dashboardScreen);
                 },
                 title: "Back To Home",
                 backgroundColor: cDarkBlue,
                 primary: cBlack,
                 padding: EdgeInsets.symmetric(horizontal: w * 0.2),
                 textStyle: AppStyle.textStyleRobotoMediumWhite20,),
               SizedBox(height: h * 0.008,)
             ],
           )
            // Text(
            //   "Back To Home",
            //   style: AppStyle.textStyleRobotoMediumBlack20,
            // ),
            //
          ],
        ),
      ),
    );
  }
}
