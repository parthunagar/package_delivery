import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:package_delivery/Constant/app_image.dart';
import 'package:package_delivery/Constant/appstyle.dart';
import 'package:package_delivery/Constant/colors.dart';
import 'package:package_delivery/Screen/rate_and_review_list/rate_and_review_logic.dart';
import 'package:package_delivery/widget/custom_new_appbar.dart';
import 'package:package_delivery/widget/custom_progress_bar.dart';
import 'package:package_delivery/widget/data_not_found_widget.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'dart:async' show Timer;
import 'package:timeago/timeago.dart' as timeago;

class RateReviewListWidget extends GetView<RateReviewListLogic> {
  const RateReviewListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<RateReviewListLogic>();

    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    // debugPrint('controller.rateReviewList.value.details : ${controller.rateReviewList.value.details.toString()}');
    return Scaffold(
      backgroundColor: cDarkBlue,
      appBar: CustomNewAppBar(
        title: "Reviews",
        leading: Icons.arrow_back_ios_rounded,
        onTap: () {
          Get.back();
        },
      ),
      body: Obx(() {
        return
          controller.isRateReviewDataLoad.value == true ?
          DataNotFoundWidget() :
          controller.rateReviewList.value.details == null ?
          CustomProgressBar() :
          SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(w / 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(controller.rateReviewList.value.averageReview!.toStringAsFixed(2).toString(), style: AppStyle.textStyleDarkRobotoBoldWhite35),
                SizedBox(height: h / 100),
                RatingBar(
                  initialRating: controller.rateReviewList.value.averageReview!,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: w / 20,
                  glow: false,
                  itemPadding: EdgeInsets.symmetric(horizontal: getHorizontalSize(2)),
                  ignoreGestures: true,
                  ratingWidget: RatingWidget(
                    full: SvgPicture.asset(Assets.iconStarFillFull, fit: BoxFit.cover),
                    half: SvgPicture.asset(Assets.iconStarFillHalf, fit: BoxFit.cover),
                    empty: SvgPicture.asset(Assets.iconStarFillOut, fit: BoxFit.cover)),
                  onRatingUpdate: (rating) {},
                ),
                SizedBox(height: h / 80),
                Text("Based on ${controller.rateReviewList.value.totalReview.toString()} Reviews", textAlign: TextAlign.center, style: AppStyle.textStyleDarkRobotoMediumWhite15),
                SizedBox(height: h / 50),
                Column(
                  children: [
                    CustomHorizontalRatingBar(title: "Excellent", value: controller.rateReviewList.value.excellentAvg! / 5, color: cGreen),
                    SizedBox(height: h / 100),
                    CustomHorizontalRatingBar(title: "Good", value: controller.rateReviewList.value.goodAvg! / 5, color: cGreenLight),
                    SizedBox(height: h / 100),
                    CustomHorizontalRatingBar(title: "Average", value: controller.rateReviewList.value.avg! / 5, color: cYellowDark),
                    SizedBox(height: h / 100),
                    CustomHorizontalRatingBar(title: "Poor", value: controller.rateReviewList.value.poorAvg! / 5, color: cRed),
                    SizedBox(height: h / 100),
                  ],
                ),
                SizedBox(height: h / 30),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount:  controller.rateReviewList.value.details!.length,
                  separatorBuilder: (context, index) {
                    return controller.rateReviewList.value.details![index].getSenderDetails == null
                        ? const SizedBox()
                        : Divider(color: cDarkBlueDivider, thickness: 1, height: h / 50);
                  },
                  itemBuilder: (context, index) {
                    return  controller.rateReviewList.value.details![index].getSenderDetails == null
                        ? const SizedBox()
                        :  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CachedNetworkImage(
                                  width: w * 0.14,
                                  height: h * 0.075,
                                  imageUrl: controller.rateReviewList.value.details![index].getSenderDetails!.userImage.toString(),//index % 2 == 0 ? 'https://picsum.photos/250?image=1000000' : 'https://picsum.photos/250?image=9',
                                  imageBuilder: (context, imageProvider) =>
                                    Container(decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(image: imageProvider, fit: BoxFit.fill))),
                                  placeholder: (context, url) => CustomProgressBar(color: cGreyDivider,),
                                  errorWidget: (context, url, error) =>
                                    Container(
                                      width: w * 0.4,
                                      decoration: BoxDecoration(color: cBlue, shape: BoxShape.circle),
                                      child: Center(child: Text(controller.rateReviewList.value.details![index].getSenderDetails!.userImage!.toUpperCase().toString(),
                                        style: AppStyle.textStyleRobotoBlackItalic35))),
                                ),
                                SizedBox(width: w * 0.03),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: w * 0.3,
                                      child: Text(controller.rateReviewList.value.details![index].getSenderDetails!.username!.toString(),
                                        overflow: TextOverflow.ellipsis,
                                        style: AppStyle.textStyleDarkRobotoMediumWhite15),
                                    ),
                                    SizedBox(height: h / 500),
                                    Row(
                                      children: [
                                        RatingBar(
                                          // initialRating: controller.rateReviewList.value.details![index].getRatingBy == null ? 0.0 : double.parse(controller.rateReviewList.value.details![index].getRatingBy!.ratingStar!),
                                          initialRating: double.parse(controller.rateReviewList.value.details![index].driverRatingStar!),
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          itemCount: 5,
                                          itemSize: w / 30,
                                          glow: false,
                                          itemPadding: EdgeInsets.symmetric(horizontal: getHorizontalSize(2)),
                                          ignoreGestures: true,
                                          ratingWidget: RatingWidget(
                                            full: SvgPicture.asset(Assets.iconStarFillFull, fit: BoxFit.cover),
                                            half: SvgPicture.asset(Assets.iconStarFillHalf, fit: BoxFit.cover),
                                            empty: SvgPicture.asset(Assets.iconStarFillOut, fit: BoxFit.cover),
                                          ),
                                          onRatingUpdate: (rating) {},
                                        ),
                                        SizedBox(width: w / 50),
                                        Text(
                                            // controller.rateReviewList.value.details![index].getRatingBy == null ? '(0.0)' : '(${controller.rateReviewList.value.details![index].getRatingBy!.ratingStar.toString()})',
                                            '(${controller.rateReviewList.value.details![index].driverRatingStar!.toString()})',
                                            style: AppStyle.textStyleDarkRobotoMediumWhite15),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                    // controller.rateReviewList.value.details![index].getRatingBy == null ? '' : timeago.format(controller.rateReviewList.value.details![index].getRatingBy!.createdAt!).replaceAll('about', ''),
                                    'Order Id : ${controller.rateReviewList.value.details![index].trackingId}',
                                  style: AppStyle.textStyleDarkRobotoMediumWhite15),
                                Text(
                                    // controller.rateReviewList.value.details![index].getRatingBy == null ? '' : timeago.format(controller.rateReviewList.value.details![index].getRatingBy!.createdAt!).replaceAll('about', ''),
                                    timeago.format(controller.rateReviewList.value.details![index].updatedAt!).replaceAll('about', ''),
                                  style: AppStyle.textStyleDarkRobotoMediumWhite15),
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: h / 50),
                        Text(
                           // controller.rateReviewList.value.details![index].getRatingBy == null ? '' : controller.rateReviewList.value.details![index].getRatingBy!.ratingComment.toString(),
                            controller.rateReviewList.value.details![index].driverRatingComment.toString(),
                           textAlign: TextAlign.start, style: AppStyle.textStyleDarkRobotoRegularDarkGrey15),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

class CustomHorizontalRatingBar extends StatelessWidget {
  CustomHorizontalRatingBar({
    Key? key,
    required this.title,
    required this.value,
    this.color,
  }) : super(key: key);

  final String title;
  final double value;
  Color? color;

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Row(
      children: [
        Expanded(flex: 2, child: Text(title, style: AppStyle.textStyleDarkRobotoMediumWhite15)),
        SizedBox(width: w / 100),
        Expanded(
          flex: 8,
          child: LinearPercentIndicator(
            animation: true,
            animationDuration: 1000,
            lineHeight: h * 0.012,
            percent: value,
            barRadius: const Radius.circular(20),
            progressColor: color,
            backgroundColor: cGreyDivider,
          ),
        ),
      ],
    );
  }
}
