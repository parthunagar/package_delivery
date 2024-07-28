import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:package_delivery/AppRoute/NavigationArgs.dart';
import 'package:package_delivery/AppRoute/app_route.dart';
import 'package:package_delivery/Constant/app_constant.dart';
import 'package:package_delivery/Constant/app_image.dart';
import 'package:package_delivery/Constant/appstyle.dart';
import 'package:package_delivery/Constant/colors.dart';
import 'package:package_delivery/Screen/applyCoupon/apply_coupon_controller.dart';
import 'package:package_delivery/widget/customDialog.dart';
import 'package:package_delivery/widget/custom_button.dart';
import 'package:package_delivery/widget/custom_new_appbar.dart';
import 'package:package_delivery/widget/custom_progress_bar.dart';
import 'package:package_delivery/widget/data_not_found_widget.dart';
import 'package:package_delivery/widget/text_input_filed_serch.dart';

class ApplyCouponWidget extends GetView<ApplyCouponLogic> {
  ApplyCouponWidget({Key? key}) : super(key: key);

  // var focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    final logic = Get.find<ApplyCouponLogic>();
    return Scaffold(
      backgroundColor: cDarkBlue,
      appBar: CustomNewAppBar(
        title: 'Coupon List',
        leading: Icons.arrow_back_ios_rounded,
        onTap: () {
          Get.back();
        },
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: w * 0.04),
        child: Obx(() {
          return Stack(
            // alignment: Alignment.bottomCenter,
            children: [
              controller.isCouponDataLoad.value == true ?
              DataNotFoundWidget() :
              ListView.separated(
                  itemCount: controller.couponList.value.length,
                  separatorBuilder: (context, index) => SizedBox(height: h * 0.01),
                  padding: EdgeInsets.only(bottom: h * 0.22),
                  itemBuilder: ((context, index) {
                    return Obx(() {
                      debugPrint('controller.couponList.value.isEmpty : ${controller.couponList.value.isEmpty}');
                      return GestureDetector(
                        onTap: () {
                          debugPrint('index : $index');
                          controller.cCoupon!.text = controller.couponList.value[index].couponCode.toString();
                          controller.couponId!.value =  controller.couponList.value[index].id.toString();
                          controller.couponCode!.value =  controller.couponList.value[index].couponCode.toString();
                          controller.selectedIndex.value = index.toDouble();
                          debugPrint('controller.selectedIndex : ${controller.selectedIndex}');
                          controller.cCoupon!.selection = TextSelection.fromPosition(TextPosition(offset: controller.cCoupon!.text.length));
                          // Get.toNamed(AppRoutes.selectDispatcherScreen);
                        },
                        // child: ClipRRect(
                        //   child: Banner(
                        //     message: controller.couponList.value[index].couponStatus.toString(),
                        //     location: BannerLocation.topStart,
                        //     color: controller.couponList.value[index].couponStatus.toString() == "Active" ? cGreen : cRed,
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: w * 0.04, vertical: h * 0.02),
                              decoration: BoxDecoration(
                                  color: cWhite,
                                  // boxShadow: [
                                  //   controller.selectedIndex.value == index.toDouble()
                                  //       ? BoxShadow(color: cBlue, blurRadius: 10.0, offset: const Offset(0, 0))
                                  //       : const BoxShadow(),
                                  // ],
                                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                                  border: Border.all(color: controller.selectedIndex.value == index.toDouble() ? cBlue : cTransparent, width: 1.5)
                              ),
                              child: Row(
                                children: [
                                  // SvgPicture.asset(Assets.iconNotificationTransit, height: h * 0.07),
                                  Container(
                                      height: h * 0.06,
                                      width: w * 0.13,
                                      decoration: BoxDecoration(color: cBlue, shape: BoxShape.circle),
                                      padding: EdgeInsets.symmetric(horizontal: w * 0.02),
                                      child: SvgPicture.asset(Assets.iconCouponHistory, fit: BoxFit.contain, color: cWhite,)
                                  ),
                                  SizedBox(width: w * 0.02),
                                  Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [

                                              SizedBox(
                                                width: w * 0.5,
                                                child: Text(controller.couponList.value[index].couponTitle.toString() ,//+ ' ${controller.couponList.value[index].couponStatus.toString()}',
                                                    maxLines: 2,
                                                    overflow: TextOverflow.ellipsis,
                                                    style: AppStyle.textStyleRobotoMediumBlack15)),
                                              Container(
                                                width: w * 0.17,
                                                  padding: EdgeInsets.symmetric(horizontal: w * 0.02, vertical: h * 0.005),
                                                  decoration: controller.selectedIndex.value != index.toDouble()
                                                      ? BoxDecoration(color: cRedOpacity, borderRadius: BorderRadius.circular(5))
                                                      : BoxDecoration(color: cParrotOpacity, borderRadius: BorderRadius.circular(5)),
                                                  child: Text(controller.couponList.value[index].couponCode.toString(),
                                                      overflow: TextOverflow.ellipsis,
                                                      textAlign: TextAlign.center,
                                                      style: controller.selectedIndex.value != index.toDouble() ?
                                                  AppStyle.textStyleRobotoMediumRed12 : AppStyle.textStyleRobotoMediumParrot12)),
                                            ],
                                          ),
                                          SizedBox(height: h * 0.01),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                // color: Colors.red[100],
                                                width: w * 0.35,
                                                child: RichText(text: TextSpan(
                                                    children: [
                                                      TextSpan(
                                                          text: 'Valid Until : ${DateFormat('dd MMM').format(controller.couponList.value[index].startDate!)}',
                                                          style: AppStyle.textStyleRobotoRegularGrey15),
                                                      TextSpan(
                                                          text: ' to ',
                                                          style: AppStyle.textStyleRobotoRegularGrey15),
                                                      TextSpan(
                                                          text: DateFormat('dd MMM').format(controller.couponList.value[index].endDate!),
                                                          style: AppStyle.textStyleRobotoRegularGrey15),
                                                    ]
                                                )),
                                              ),
                                              Expanded(
                                                child: RichText(
                                                    textAlign: TextAlign.end,
                                                    maxLines: 2,
                                                    text: TextSpan(
                                                    children: [
                                                      TextSpan(
                                                          text: controller.couponList.value[index].amount.toString(),
                                                          style: AppStyle.textStyleRobotoMediumBlack15),
                                                      TextSpan(
                                                          text: controller.couponList.value[index].couponType.toString()=='Flat'?' NGN ':' % ' ,
                                                          style: AppStyle.textStyleRobotoMediumBlack15),
                                                      TextSpan(
                                                          text: ' OFF',
                                                          style: AppStyle.textStyleRobotoRegularGrey15),
                                                    ]
                                                )),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ))
                                ],
                              ),
                            ),
                          // ) ),
                      );
                    });
                  })
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  color: cDarkBlue,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      controller.isCouponDataLoad.value == true ?
                      const SizedBox() :
                      Column(
                        children: [
                          SizedBox(height: h * 0.02),
                          TextInputFindOutSerch(
                              controller: controller.cCoupon,
                              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: cTransparent, width: 2)),
                              enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: cTransparent, width: 2)),
                              textInputAction: TextInputAction.done,
                              label: 'Apply Coupon Here',
                              textInputType: TextInputType.text,
                              onChange: (String? val) {
                                debugPrint('TextInputFindOutSerch => val : $val');
                                controller.couponCode!.value = val!;
                              },
                              suffixWidget: GestureDetector(
                                onTap: controller.couponCode!.value == '' ? () {} : () {
                                  if(controller.cCoupon!.text.isEmpty) {
                                    Const().toast('Please select coupon.');
                                  }
                                  else {
                                    controller.setApplyCouponCode(controller.couponId!.value);
                                  }
                                },
                                child: controller.isApplyCouponLoad!.value == false
                                  ? Padding(
                                      padding: EdgeInsets.only(top: h * 0.025, right: w * 0.04),
                                      child: Text('APPLY', style: controller.couponCode!.value == '' ?
                                      AppStyle.textStyleRobotoBoldGrey15 :
                                      AppStyle.textStyleDarkRobotoBoldBlue15))
                                  : Container(
                                      width: w * 0.005,
                                      height: h * 0.02,
                                      margin: EdgeInsets.symmetric(vertical: h * 0.02, horizontal: w * 0.04),
                                      child: CustomProgressBar(strokeWidth: 3)))),
                        ],
                      ),
                      // SizedBox(height: h * 0.03,),
                      CustomButton(
                        padding: EdgeInsets.symmetric(horizontal: w / 10, vertical: h / 50),
                        title: "Continue to Payment",
                        onPressed: () {
                          debugPrint(' =========> ON CLICK PAYMENT <========= ');
                          debugPrint('applyCouponList : ${controller.applyCouponList.value.id}');
                          if(controller.applyCouponList.value.id == null && controller.cCoupon!.text.isNotEmpty) {
                            debugPrint('applyCouponList : ${controller.applyCouponList.value.id}');
                            debugPrint('OPEN DIALOGUE');
                            dialogApplyCoupon(context,
                              'Are you sure you don’t want to apply the coupon?',
                              'Yes', 'No', () {
                                // _handleURLButtonPress(c, ImageSource.camera);
                                debugPrint(" =====> ON CLICK YES <===== ");
                                Get.back();
                                Get.toNamed(AppRoutes.shipmentSummaryScreen, arguments: {
                                  NavigationArgs.cShipmentId: controller.shipmentId,
                                });

                              }, () {
                                // _handleURLButtonPress(c, ImageSource.gallery);
                                debugPrint(" =====> ON CLICK NO <===== ");
                                Get.back();
                              },

                            );
                          }
                          else{
                            debugPrint('DO NOT OPEN DIALOGUE');
                            Get.toNamed(AppRoutes.shipmentSummaryScreen, arguments: {
                              NavigationArgs.cShipmentId: controller.shipmentId,
                            });
                          }

                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}



