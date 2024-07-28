import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:package_delivery/AppRoute/app_route.dart';
import 'package:package_delivery/Constant/app_constant.dart';
import 'package:package_delivery/Constant/app_image.dart';
import 'package:package_delivery/Constant/appstyle.dart';
import 'package:package_delivery/Constant/colors.dart';
import 'package:package_delivery/Screen/subscription/subscription_controller.dart';
import 'package:package_delivery/Screen/subscription/subscription_text.dart';
import 'package:package_delivery/widget/custom_button.dart';
import 'package:package_delivery/widget/custom_new_appbar.dart';

class SubscriptionWidget extends GetView<SubscriptionLogic> {

  const SubscriptionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final logic = Get.find<RoleSelectionLogic>();
    var h = MediaQuery
        .of(context)
        .size
        .height;
    var w = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      backgroundColor: cDarkBlue,
      appBar: CustomNewAppBar(
        title: "Subscription",
        leading: Icons.arrow_back_ios_rounded,
        onTap: () {
          Get.back();
        },
      ),
      body: Obx(() {
        return Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: w / 20),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: h * 0.075),
                    GestureDetector(
                        onTap: () {

                          // Navigator.push(context, MaterialPageRoute(builder: (context) => const SubTestScreen()));
                        },
                        child: Container(
                            height: h * 0.12,
                            decoration: const BoxDecoration(shape: BoxShape.circle),
                            child: Image.asset(Assets.imageSubscription))),
                    SizedBox(height: h * 0.02),
                    Text('Upgrade Premium', style: AppStyle.textStyleDarkRobotoBoldWhite25),
                    SizedBox(height: h * 0.02),
                    Text('Do more with premium feature.', style: AppStyle.textStyleRobotoMediumGrey15),
                    SizedBox(height: h * 0.04),
                    ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        separatorBuilder: (context, index) => SizedBox(height: h * 0.02),
                        itemCount: controller.products.length,
                        itemBuilder: (context, index) {
                          return Obx(() {
                            return GestureDetector(
                              onTap: () {
                                controller.selectedPlan!.value = index.toString();
                                debugPrint('products : ${controller.products}');
                                debugPrint('products[index] : ${controller.products[index]}');
                              },
                              child: Container(
                                height: h / 10,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: controller.selectedPlan!.value == index.toString() ? cWhite : cDarkBlue,
                                    border: Border.all(color: cWhite),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: w / 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: h * 0.04,
                                        child: controller.selectedPlan!.value == index.toString()
                                          ? SvgPicture.asset(Assets.iconRadioTrue, fit: BoxFit.contain)
                                          : SvgPicture.asset(Assets.iconRadioFalse, fit: BoxFit.contain)),
                                      SizedBox(width: w / 15),
                                      Flexible(
                                        child: Text(
                                          controller.products[index].title.toString().replaceAll(' (Ship pack)', ''),// ${controller.products[index].description.toString()}',
                                          style: controller.selectedPlan!.value == index.toString()
                                            ? AppStyle.textDarkStyleDarkRobotoBoldBlue23
                                            : AppStyle.textDarkStyleRobotoRegularGrey25),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          });
                        }
                    ),
                  ],
                ),
              ),
            ),
            CustomButton(
                onPressed: () {
                  if(controller.selectedPlan!.value == ""){
                    Const().toast('Please select plan.');
                  }else{
                    controller.makingPurchase();
                  }
                },
                padding: EdgeInsets.symmetric(horizontal: w * 0.15, vertical: h * 0.02),
                title: "Submit")
          ],
        );
      }),
    );
  }


}

