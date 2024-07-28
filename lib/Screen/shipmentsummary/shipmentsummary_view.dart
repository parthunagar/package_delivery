import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:package_delivery/Constant/app_constant.dart';
import 'package:package_delivery/Constant/app_image.dart';
import 'package:package_delivery/Constant/appstyle.dart';
import 'package:package_delivery/Constant/colors.dart';
import 'package:package_delivery/Screen/payment/payment_view.dart';
import 'package:package_delivery/Screen/shipmentsummary/shipmentsummary_controller.dart';
import 'package:package_delivery/widget/custom_button.dart';
import 'package:package_delivery/widget/custom_new_appbar.dart';
import 'package:package_delivery/widget/data_not_found_widget.dart';
import 'package:package_delivery/widget/shadow_container.dart';

class ShipmentSummaryWidget extends GetView<ShipmentSummaryLogic> {
  const ShipmentSummaryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    final logic = Get.find<ShipmentSummaryLogic>();
    return Scaffold(
      backgroundColor: cDarkBlue,
      appBar: CustomNewAppBar(
        title: 'Shipment Summary',
        leading: Icons.arrow_back_ios_rounded,
        onTap: () {
          Get.back();
        },
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: getHorizontalSize(15)),
        child: Obx(
          () => controller.isShipmentSummaryDataLoad.value == true
              ? DataNotFoundWidget()
              : controller.shipmentSummaryList.value.length != 0
                  ? Stack(
                    children: [
                      SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(height: getVerticalSize(10)),
                              Container(
                                width: double.infinity,
                                padding: EdgeInsets.all(getHorizontalSize(15)),
                                decoration: BoxDecoration(color: cWhite, borderRadius: const BorderRadius.all(Radius.circular(10.0))),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: w / 8,
                                          height: w / 8,
                                          child: SvgPicture.asset(Assets.iconPackageWeight, fit: BoxFit.contain)),
                                        SizedBox(width: w / 20),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('Package Weight', style: AppStyle.textStyleRobotoMediumBlack15),
                                            Text(controller.shipmentSummaryList.value[0].packageWeight == null ? '' : '${controller.shipmentSummaryList.value[0].packageWeight} Pound',
                                              style: AppStyle.textStyleDarkRobotoRegularDarkGrey15),
                                          ],
                                        ),
                                      ],
                                    ),
                                    // SizedBox(height: h / 70),
                                    // const TwoTextRow(text1: "Quantity", text2: "2 item"),
                                    SizedBox(height: h / 70),
                                    TwoTextRow(text1: "Package Name", text2: controller.shipmentSummaryList.value[0].sendingDetails.toString()),
                                    SizedBox(height: h / 70),
                                    TwoTextRow(text1: "Mode of Transport", text2: controller.shipmentSummaryList.value[0].transportType.toString()),
                                    SizedBox(height: h / 70),
                                    TwoTextRow(text1: "Delivery Type", text2: controller.shipmentSummaryList.value[0].deliveryType.toString()),
                                    SizedBox(height: h / 70),
                                    TwoTextRow(text1: "${Const.currySymbol} Cost", text2: controller.shipmentSummaryList.value[0].amount.toString()),
                                  ],
                                ),
                              ),
                              SizedBox(height: h / 70),
                              ShadowContainer(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Receiver Details", style: AppStyle.textStyleDarkRobotoBoldBlue15),
                                    SizedBox(height: h / 70),
                                    TwoTextRow(text1: "Name", text2: controller.shipmentSummaryList.value[0].receiverName.toString()),
                                    SizedBox(height: h / 70),
                                    TwoTextRow(text1: "Phone No.", text2: controller.shipmentSummaryList.value[0].receiverPhoneNumber.toString()),
                                  ],
                                ),
                              ),
                              SizedBox(height: h / 70),
                              ShadowContainer(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Pickup Location", style: AppStyle.textStyleDarkRobotoBoldBlue15),
                                    SizedBox(height: h / 70),
                                    Text(controller.shipmentSummaryList.value[0].pickupAddress!.trim().toString(), style: AppStyle.textStyleDarkRobotoRegularDarkGrey15),
                                  ],
                                ),
                              ),
                              SizedBox(height: h / 70),
                              ShadowContainer(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text("Photos of the Package", style: AppStyle.textStyleDarkRobotoBoldBlue15),
                                    SizedBox(height: h / 70),
                                    SizedBox(
                                      height: w / 5,//height of inside container
                                      child: ListView.separated(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: controller.shipmentSummaryList.value[0].getShipmentImage!.length, //10,
                                          shrinkWrap: true,
                                          separatorBuilder: (context, index) {
                                            return SizedBox(width: w / 20);
                                          },
                                          itemBuilder: (context, index) {
                                            return Container(
                                              width: w / 5,
                                              height: w / 5,
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.circular(10),
                                                child: Image.network(controller.shipmentSummaryList.value[0].getShipmentImage![index].shipmentImage, fit: BoxFit.fill),
                                              ),
                                            ); //const ImageTile(
                                            // imgUrl: Assets
                                            //     .img1); //Image.network(controller.shipmentSummaryList.value[0].getShipmentImage.shipmentImage[0]) ;//ImageTile(imgUrl: Assets.img1);
                                          }),
                                    ),
                                    SizedBox(height: h / 40),
                                    Text("Additional Details", style: AppStyle.textStyleDarkRobotoBoldBlue15),
                                    SizedBox(height: h / 70),
                                    Text(controller.shipmentSummaryList.value[0].additionalDetails.toString(), style: AppStyle.textStyleDarkRobotoRegularDarkGrey15),
                                  ],
                                ),
                              ),
                              SizedBox(height: h * 0.25),

                            ],
                          ),
                        ),
                      Column(
                        // crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          controller.freeDeliveryList!.value!.freeDeliveryData ==null ? const SizedBox() :
                          controller.freeDeliveryList!.value!.freeDeliveryData!.freeDelivery! <=0 ?
                          const SizedBox() :
                          CustomButton(
                            padding: EdgeInsets.only(left: w / 10,right: w / 10,top: h / 50),
                            title: "Get Free Delivery",
                            onPressed: () {
                              //TODO: UPDATE DELIVERY AND NAVIGATE TO DASHBOARD
                              // controller.getUpdateDeliveryData();
                            },
                          ),
                          CustomButton(
                            padding: EdgeInsets.symmetric(horizontal: w / 10, vertical: h / 50),
                            title: "Continue to Payment",
                            onPressed: () {
                              // handleCheckout(context);
                              // Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                              double amount = double.parse(controller.shipmentSummaryList.value[0].amount!)* 100;
                               print('amount.round()' + amount.round().toString());
                              controller.startCharge(context,h,w, amount.round());
                            },
                          ),

                        ],
                      ),
                    ],
                  )
                  : const SizedBox(),
        ),
      ),
    );
  }
}

class TwoTextRow extends StatelessWidget {
  const TwoTextRow({
    Key? key,
    required this.text1,
    required this.text2,
  }) : super(key: key);

  final String text1, text2;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text1,
          style: AppStyle.textStyleRobotoMediumBlack15,
        ),
        Text(
          text2,
          style: AppStyle.textStyleDarkRobotoRegularDarkGrey15,
        ),
      ],
    );
  }
}

