import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:package_delivery/AppRoute/app_route.dart';
import 'package:package_delivery/Constant/app_image.dart';
import 'package:package_delivery/Constant/appstyle.dart';
import 'package:package_delivery/Constant/colors.dart';
import 'package:package_delivery/Screen/notification_list/notification_list_logic.dart';
import 'package:package_delivery/widget/custom_new_appbar.dart';
import 'package:package_delivery/widget/data_not_found_widget.dart';
import 'driver_list_logic.dart';

class DriverListWidget extends GetView<DriverListLogic> {
  const DriverListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<DriverListLogic>();
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: cDarkBlue,
      appBar: CustomNewAppBar(
        title: 'Drivers Listing',
        leading: Icons.arrow_back_ios_rounded,
        // leading: Icon(Icons.arrow_back_ios_rounded),
        onTap: () {
          Get.back();
        },
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: w * 0.04, vertical: h * 0.01),
        child: Obx(() {
          return
            controller.isDriverDataLoad.value == true ?
            DataNotFoundWidget() :
            ListView.separated(
              shrinkWrap: true,
              itemCount: controller.driverList.value.length,// 20,
              separatorBuilder: (_, __) => SizedBox(height: h * 0.01),
              itemBuilder: ((context, index) {
                return GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: w * 0.025, vertical: h * 0.013),
                    decoration: BoxDecoration(
                      color: cWhite,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        controller.driverList.value[index].driverPhoto != null ?
                        Container(
                          height: h * 0.13,
                          width: h * 0.13,
                          decoration: BoxDecoration(
                            color: cDarkBlue,
                            borderRadius: BorderRadius.circular(10),
                            image:  DecorationImage(image: NetworkImage( controller.driverList.value[index].driverPhoto!))
                          ),
                        ) :
                        Container(
                            height: h * 0.13,
                            width: h * 0.13,
                          decoration: BoxDecoration(color: cBlue, borderRadius: BorderRadius.circular(10)),
                          child: Center(child: Text(controller.driverList.value[index].username![0].toUpperCase(), style: AppStyle.textStyleRobotoBlackItalic55))),
                        SizedBox(width: w * 0.03),
                        Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              Assets.iconSidemenuDriverList, color: cBlue,
                              height: h * 0.02,),
                            SizedBox(width: w * 0.01),
                            Text(controller.driverList.value[index].username!, style: AppStyle.textStyleRobotoBoldBlack15,),
                          ],
                        ),
                        SizedBox(height: w * 0.02),
                        Row(
                          children: [
                            SvgPicture.asset(Assets.iconCar, color: cBlue, height: h * 0.017,),
                            SizedBox(width: w * 0.01),
                            Text('${controller.driverList.value[index].vehicleName.toString()} ${controller.driverList.value[index].vehicleNumber.toString()}', style: AppStyle.textStyleDarkRobotoRegularDarkGrey13,),
                          ],
                        ),
                        SizedBox(height: w * 0.02),
                        Row(
                          children: [
                            SvgPicture.asset(Assets.iconCard, color: cBlue, height: h * 0.017,),
                            SizedBox(width: w * 0.01),
                            Text(controller.driverList.value[index].licenseNumber.toString(), style: AppStyle.textStyleDarkRobotoRegularDarkGrey13,),
                          ],
                        ),
                        SizedBox(height: w * 0.01),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  Assets.iconCall, color: cBlue,
                                  height: h * 0.017,),
                                SizedBox(width: w * 0.01),
                                Text('${controller.driverList.value[index].phoneCode.toString()} ${controller.driverList.value[index].contactNumber.toString()}', style: AppStyle
                                    .textStyleDarkRobotoRegularDarkGrey13,),
                              ],
                            ),
                            SizedBox(width: w * 0.05),
                            controller.driverList.value[index].getCompanyDriver == null //&& controller.driverList.value[index].getCompanyDriver!.isAvailble == 1
                            ? Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(w * 0.015),
                                decoration: BoxDecoration(color: cRedOpacity, borderRadius: BorderRadius.circular(5)),
                                child: Text('Unavailable', overflow: TextOverflow.ellipsis, style: AppStyle.textStyleRobotoMediumRed12))
                            : controller.driverList.value[index].getCompanyDriver!.isAvailble == 0
                            ?  Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(w * 0.015),
                                decoration: BoxDecoration(color: cRedOpacity, borderRadius: BorderRadius.circular(5)),
                                child: Text('Unavailable', overflow: TextOverflow.ellipsis, style: AppStyle.textStyleRobotoMediumRed12))
                            : Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(w * 0.015),
                                decoration: BoxDecoration(color: cParrotOpacity, borderRadius: BorderRadius.circular(5)),
                                child: Text('Available', overflow: TextOverflow.ellipsis, style: AppStyle.textStyleRobotoMediumParrot12))

                          ],
                        )
                          ],
                        )
                      ],
                    ),
                  ),

                );
              })
          );
        }),
      ),
    );
  }
}
