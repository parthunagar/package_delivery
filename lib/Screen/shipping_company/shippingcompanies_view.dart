import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_delivery/Constant/app_image.dart';
import 'package:package_delivery/Constant/appstyle.dart';
import 'package:package_delivery/Constant/colors.dart';
import 'package:package_delivery/Screen/shipping_company/shippingcompanies_controller.dart';
import 'package:package_delivery/widget/custom_appbar.dart';
import 'package:package_delivery/widget/custom_new_appbar.dart';

class ShippingCompaniesWidget extends GetView<ShippingCompaniesLogic> {
  const ShippingCompaniesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    final logic = Get.find<ShippingCompaniesLogic>();

    return Scaffold(
      appBar: CustomNewAppBar(
        title: 'Shipping Companiies',
        leading: Icons.arrow_back_ios_rounded,
        // leading: Icon(Icons.arrow_back_ios_rounded),
        onTap: () {
          Get.back();
        },
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: w / 20, vertical: h / 50),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: w / 2,
              crossAxisSpacing: getHorizontalSize(10),
              mainAxisSpacing: getHorizontalSize(10)),
          itemCount: 20,
          itemBuilder: (BuildContext ctx, index) {
            return Container(
              width: double.infinity,
              padding: EdgeInsets.all(getHorizontalSize(15)),
              decoration: BoxDecoration(
                border: Border.all(color: cGreyLight, width: 1.0),
                color: cWhite,
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                boxShadow: [
                   BoxShadow(
                    color: cGreyLight,
                    blurRadius: 1.0,
                    offset:  const Offset(0.0, 0.0),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: w/5,
                    height: w/5,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: const DecorationImage(image: AssetImage(Assets.demoImage4), fit: BoxFit.cover)),
                  ),
                  Text("Dash Logistics", style: AppStyle.textStyleRobotoBoldBlack15),
                  Text("25 Driver Available", style: AppStyle.textStyleRobotoRegularGrey15),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

