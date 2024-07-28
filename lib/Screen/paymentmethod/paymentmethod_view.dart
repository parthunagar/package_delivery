import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:package_delivery/AppRoute/app_route.dart';
import 'package:package_delivery/Constant/app_constant.dart';
import 'package:package_delivery/Constant/app_image.dart';
import 'package:package_delivery/Constant/appstyle.dart';
import 'package:package_delivery/Constant/colors.dart';
import 'package:package_delivery/Screen/paymentmethod/paymentmethod_controller.dart';
import 'package:package_delivery/widget/custom_new_appbar.dart';

class PaymentMethodWidget extends GetView<PaymentMethodLogic> {
  const PaymentMethodWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<PaymentMethodLogic>();

    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: cDarkBlue,
      appBar: CustomNewAppBar(
        title: "Payment Method",
        leading: Icons.arrow_back_ios_rounded,
        onTap: () {
          Get.back();
        },),

      body: Stack(
        children: [
         SingleChildScrollView(
           child: Padding(
             padding: EdgeInsets.all(w / 20),
             child: Column(
               mainAxisAlignment: MainAxisAlignment.start,
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 SizedBox(height: h / 50),
                 Container(
                   width: double.infinity,
                   padding: EdgeInsets.all(w / 20),
                   decoration: BoxDecoration(color: cBlue, borderRadius: BorderRadius.circular(8)),
                   child: Column(
                     children: [
                       Text("Amount to Pay", style: AppStyle.textStyleRobotoMediumWhite20),
                       SizedBox(height: h / 80),
                       RichText(text: TextSpan(
                           children: [
                             TextSpan(text: '${Const.currySymbol} ', style: AppStyle.textStyleRobotoMediumWhite35),
                             TextSpan(text: '1500 ', style: AppStyle.textStyleRobotoBoldWhite35),
                           ]
                       )),
                     ],
                   ),
                 ),
                 SizedBox(height: h / 35),
                 Text("Available Methods to pay:", style: AppStyle.textStyleRobotoMediumBlue15),
                 SizedBox(height: h / 50),
                 SizedBox(
                   width: double.infinity,
                   child: Wrap(
                     alignment: WrapAlignment.spaceBetween,
                     runAlignment: WrapAlignment.spaceBetween,
                     runSpacing: w / 30,
                     children:  [
                       PaymentMethodTag(
                         imgUrl: Assets.iconPaymentDebitcard,
                         bodyText: "Debit / Credit Card",
                         onTap: () {
                           debugPrint('on tap');
                            Get.toNamed(AppRoutes.cardListScreen);
                         }),
                       PaymentMethodTag(
                         imgUrl: Assets.iconPaymentWallet,
                         bodyText: "Pay with Wallet",
                         onTap: () {

                         }),
                       PaymentMethodTag(
                         imgUrl: Assets.iconPaymentCod,
                         bodyText: "Case on Delivery",
                         onTap: () {

                         }),
                       PaymentMethodTag(
                         imgUrl: Assets.iconPaymentNewcard,
                         bodyText: "Add New Card",
                         onTap: () {
                           Get.toNamed(AppRoutes.addEditCardScreen);
                         }),
                     ],
                   ),
                 ),

               ],
             ),
           ),
         ),
          // CustomButton(title: "Confirm Payment",)
        ],
      ),
    );
  }
}

class PaymentMethodTag extends StatefulWidget {
  String? imgUrl, bodyText;
  var onTap;

  PaymentMethodTag({this.imgUrl, this.bodyText, this.onTap});



  @override
  _PaymentMethodTagState createState() => _PaymentMethodTagState();
}

class _PaymentMethodTagState extends State<PaymentMethodTag> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: w / 2 - w / 15,
        padding: EdgeInsets.all(getHorizontalSize(15)),
        decoration: BoxDecoration(
          border: Border.all(color: cGreyLight, width: 1.0),
          color: cWhite,
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          boxShadow: [
            BoxShadow(color: cGreyLight, blurRadius: 1.0, offset:  const Offset(0.0, 0.0)),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(widget.imgUrl!),
            SizedBox(height: h / 50),
            Text(widget.bodyText!, style: AppStyle.textStyleRobotoBoldBlack15),
          ],
        ),
      ),
    );
  }
}


