import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:package_delivery/AppRoute/app_route.dart';
import 'package:package_delivery/Constant/app_image.dart';
import 'package:package_delivery/Constant/appstyle.dart';
import 'package:package_delivery/Constant/colors.dart';
import 'package:package_delivery/Screen/coupon_history_list/coupon_history_list_logic.dart';
import 'package:package_delivery/widget/Paint/custom_dolDrama_paint.dart';
import 'package:package_delivery/widget/Paint/dashed_line_paint.dart';
import 'package:package_delivery/widget/Paint/fdotted_line.dart';
import 'package:package_delivery/widget/custom_new_appbar.dart';
import 'package:package_delivery/widget/data_not_found_widget.dart';
import 'package:package_delivery/widget/ticket_widget.dart';

class CouponHistoryListWidget extends GetView<CouponHistoryListLogic> {
  const CouponHistoryListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final logic = Get.find<NotificationListLogic>();
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: cDarkBlue,
      appBar: CustomNewAppBar(
        title: 'Coupon History',
        leading: Icons.arrow_back_ios_rounded,
        // leading: Icon(Icons.arrow_back_ios_rounded),
        onTap: () {
          Get.back();
        },
      ),

      body: Obx(() {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: w * 0.04),
          child: controller.isCouponHistoryDataLoad.value == true
            ? DataNotFoundWidget()
            : ListView.separated(
                itemCount: controller.couponHistoryList.value.length,
                separatorBuilder: ((context, index) {
                  return SizedBox(height: h * 0.01);
                }),
                itemBuilder: ((context, index) {
                  var dateTime = DateFormat("yyyy-MM-dd HH:mm:ss").parse(controller.couponHistoryList.value[index].usedAt!.toString(), true);
                  var dateLocal = dateTime.toLocal();
                  final DateFormat formatter = DateFormat('dd,MMM yyyy');
                  final String formattedDate = formatter.format(dateLocal);
                  debugPrint('formattedDate : $formattedDate');
                  return Container(
                    padding: EdgeInsets.only(right: w * 0.02),
                    decoration: BoxDecoration(color: cWhite,
                      border: Border.all(color: cWhite),
                      borderRadius: const BorderRadius.all(Radius.circular(5.0))),
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: cBlue,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(5), bottomLeft: Radius.circular(5),
                              bottomRight: Radius.circular(10), topRight: Radius.circular(10))
                          ),
                          child: Row(
                            children: [
                              Container(
                                  height: h * 0.09,
                                  width: w * 0.16,
                                  padding: EdgeInsets.symmetric(horizontal: w * 0.03,vertical: h * 0.02),
                                  decoration: BoxDecoration(
                                    color: cDarkBlue,
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(5), bottomLeft: Radius.circular(5),
                                      bottomRight: Radius.circular(10), topRight: Radius.circular(10))),
                                  child: Transform.rotate(
                                    angle: 2.5,
                                    child: SvgPicture.asset(Assets.iconCouponHistory,color: cBlue))),
                              Container(
                                  height: h * 0.09,
                                  width: w * 0.12,
                                  padding: EdgeInsets.symmetric(horizontal: w * 0.01),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: cBlue,
                                    borderRadius: const BorderRadius.only(
                                      bottomRight: Radius.circular(10), topRight: Radius.circular(10)
                                    )),
                                  child: RichText(
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    text: TextSpan(
                                    children: [
                                      TextSpan(text: 'OFF\n', style: AppStyle.textStyleRobotoBoldWhite12),
                                      TextSpan(text: controller.couponHistoryList.value[index].getCouponDetail!.amount.toString(), style: AppStyle.textStyleRobotoBoldWhite12),
                                     ]
                                )),
                              ),
                            ],
                          ),
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
                                    width: w * 0.4,
                                    child: Text(
                                      controller.couponHistoryList.value[index].getCouponDetail!.description.toString(),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: AppStyle.textStyleRobotoMediumBlack15),
                                  ),
                                  Container(
                                    width: w * 0.17,
                                    padding: EdgeInsets.symmetric(horizontal: w * 0.02, vertical: h * 0.005),
                                    decoration: BoxDecoration(color: cDarkBlue, borderRadius: BorderRadius.circular(5)),
                                    child: Text(
                                      controller.couponHistoryList.value[index].getCouponDetail!.couponCode.toString(),
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,style: AppStyle.textStyleRobotoBoldWhite12)),
                                ],
                              ),
                              SizedBox(height: h * 0.005),
                              RichText(
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                text: TextSpan(
                                  children: [
                                    TextSpan(text: 'Valid Until : ', style: AppStyle.textStyleDarkRobotoMediumDarkGrey15),
                                    TextSpan(text: formattedDate.toString(), style: AppStyle.textStyleDarkRobotoMediumDarkGrey15),
                                  ]
                                )
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                })
          ),
        );
      }),
    );
  }
}
