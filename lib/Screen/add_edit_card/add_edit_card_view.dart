import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:package_delivery/AppRoute/NavigationArgs.dart';
import 'package:package_delivery/Constant/app_constant.dart';
import 'package:package_delivery/Constant/app_image.dart';
import 'package:package_delivery/Constant/appstyle.dart';
import 'package:package_delivery/Constant/colors.dart';
import 'package:package_delivery/widget/custom_button.dart';
import 'package:package_delivery/widget/custom_new_appbar.dart';
import 'package:package_delivery/widget/payment_card/input_formatters.dart';
import 'package:package_delivery/widget/payment_card/payment_card.dart';
import 'package:package_delivery/widget/text_input_filed.dart';

import 'add_edit_card_logic.dart';

class AddEditCardWidget extends GetView<AddEditCardLogic> {
  const AddEditCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final logic = Get.find<AddEditCardLogic>();
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: cDarkBlue,
      appBar: CustomNewAppBar(
        title: Get.parameters[NavigationArgs.kEdit] == 'true' ? "Edit Card" : "Add New Card",
        leading: Icons.arrow_back_ios_rounded,
        onTap: () {
          Get.back();
        },),
      body: Obx(() {
        return Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: w * 0.02),
                child: Column(
                  children: [
                    SizedBox(height: h * 0.02),

                    Container(
                      height: h * 0.25,
                      padding: EdgeInsets.symmetric(horizontal: w * 0.06),
                      width: w,
                      // decoration: BoxDecoration(
                      //   borderRadius: BorderRadius.circular(10),
                      //   gradient: LinearGradient(
                      //     begin: Alignment.topLeft,
                      //     end: Alignment.bottomRight,
                      //     colors: [
                      //       cCardGradientColor1,
                      //       cCardGradientColor2,
                      //     ],
                      //   ),
                      // ),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: cBlack),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // SvgPicture.asset(Assets.imageVisaCard),
                          SizedBox(height: h * 0.03),
                          // Text('**** **** **** 8630', style: AppStyle.textStyleRobotoBoldWhite20.copyWith(letterSpacing: 3),),
                          RichText(
                            text: TextSpan(
                              children: <TextSpan>[
                                // TextSpan(
                                //     text: controller.cardNoHideString!.value.replaceAllMapped(RegExp(Const.cardNumber), (match) => '*'),
                                //     // controller.cCardNo!.text,// '**** **** **** ',
                                //     style: AppStyle.textStyleRobotoBoldWhite20.copyWith(letterSpacing: 3)),
                                // TextSpan(
                                //     text: ' ${controller.cardNoUnHideString!.value}',//'8630',
                                //     style: AppStyle.textStyleRobotoBoldWhite20.copyWith(letterSpacing: 3)),
                                //
                                // TextSpan(
                                //     text: ' ${controller.cCardNo!.text.length}',//'8630',
                                //     style: AppStyle.textStyleRobotoBoldWhite20)
                                TextSpan(
                                    text: controller.cardNoHideString!.value.replaceAllMapped(RegExp(Const.cardNumber), (match) => '✱'),
                                    // controller.cCardNo!.text,// '*** *** **** ',
                                    style: AppStyle.textStyleRobotoBoldWhite20.copyWith(letterSpacing: 0)),
                                TextSpan(
                                    text: controller.cardNoUnHideString!.value,
                                    style: AppStyle.textStyleRobotoBoldWhite20.copyWith(letterSpacing: 3)),
                              ],
                            ),
                          ),
                          SizedBox(height: h * 0.03),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Column(
                                children: [
                                  Text('Expiry Date', style: AppStyle.textStyleRobotoMediumWhiteOpacity12,),
                                  SizedBox(height: h * 0.005),
                                  Text(controller.cardDateString!.value, style: AppStyle.textStyleRobotoBoldWhite12,),
                                ],
                              ),
                              Container(
                                width: w * 0.6,
                                // color: Colors.red,
                                alignment: Alignment.centerRight,
                                padding: EdgeInsets.only(right: w * 0.1),
                                child: Column(
                                  children: [
                                    Text('Card holder name', style: AppStyle.textStyleRobotoMediumWhiteOpacity12,),
                                    SizedBox(height: h * 0.005),
                                    Text(controller.cardNameString!.value, overflow: TextOverflow.ellipsis, style: AppStyle.textStyleRobotoBoldWhite12,),
                                  ],
                                ),
                              )
                              // SizedBox(width: w * 0.001),

                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: h * 0.06),
                    TextInputFindOut(
                        controller: controller.cCardName,
                        label: 'Card Holder Name',
                        style: AppStyle.textStyleDarkRobotoMediumBlack15,
                        textInputType: TextInputType.emailAddress),
                    SizedBox(height: h * 0.02),
                    TextInputFindOut(
                        controller: controller.cCardNo,
                        label: 'Card Number',
                        style: AppStyle.textStyleDarkRobotoMediumBlack15,
                        // validator: CardUtils.validateCardNumWithLuhnAlgorithm,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          CardNumberInputFormatter(),
                          LengthLimitingTextInputFormatter(22),
                        ],
                        textInputType: TextInputType.number),

                    SizedBox(height: h * 0.02),
                    Row(
                      children: [
                        Expanded(child: TextInputFindOut(
                            controller: controller.cDate,
                            label: 'Expiry Date',
                            style: AppStyle.textStyleDarkRobotoMediumBlack15,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(4),
                              CardMonthInputFormatter()
                              // birthDateInput,
                            ],
                            textInputType: TextInputType.datetime
                        ),),
                        SizedBox(width: w * 0.03),
                        Expanded(child: TextInputFindOut(
                            controller: controller.cCVV,
                            label: 'CVV',
                            style: AppStyle.textStyleDarkRobotoMediumBlack15,
                            obscuringCharacter: '●',
                            textInputAction: TextInputAction.done,
                            obsecureCVV: true,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(3),
                            ],
                            textInputType: TextInputType.number),)

                      ],
                    ),
                    SizedBox(height: h * 0.15),
                  ],
                ),
              ),
            ),
            CustomButton(
              title: Get.parameters[NavigationArgs.kEdit] == 'true' ? 'Edit' : 'Save',
              onPressed: () async {
                RegExp numericValueNotAllow = RegExp(
                    Const.nameWithNumericPattern);
                RegExp specialCharacterNotAllow = RegExp(
                    Const.nameWithSpecialCharacterPattern);
                if (controller.cCardName!.text.isEmpty &&
                    controller.cCardNo!.text.isEmpty &&
                    controller.cDate!.text.isEmpty &&
                    controller.cCVV!.text.isEmpty) {
                  debugPrint('Please enter the email and password');
                  Const().toast('Please enter all the details.');
                }
                else if (controller.cCardName!.text.isEmpty) {
                  debugPrint('Please enter the email');
                  Const().toast('Please enter the card name');
                }
                else
                if (numericValueNotAllow.hasMatch(controller.cCardName!.text)) {
                  Const().toast('Please enter only characters in name field');
                }
                else if (!specialCharacterNotAllow.hasMatch(
                    controller.cCardName!.text)) {
                  Const().toast(
                      "Name field Must not contain special character in last position");
                }

                else if (controller.cCardNo!.text.isEmpty) {
                  debugPrint('Please enter card number');
                  Const().toast('Please enter card number');
                }
                else if (controller.cCardNo!.text.length <= 21) {
                  debugPrint('Please enter valid card number');
                  Const().toast('Please enter valid card number');
                }
                else if (controller.cDate!.text.isEmpty) {
                  debugPrint('Please enter expiry date');
                  Const().toast('Please enter expiry date');
                }
                else if (controller.cCVV!.text.isEmpty) {
                  debugPrint('Please enter CVV number');
                  Const().toast('Please enter CVV number');
                }
                else if (controller.cCVV!.text.length < 3) {
                  debugPrint('Please enter valid CVV number');
                  Const().toast('Please enter valid CVV number');
                }
                else {
                  debugPrint('SAVE LOGIN DATA');
                  controller.saveCardData();
                }
              },
            )
          ],
        );
      }),
    );
  }
}
