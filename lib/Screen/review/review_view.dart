import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:package_delivery/Constant/app_constant.dart';
import 'package:package_delivery/Constant/app_image.dart';
import 'package:package_delivery/Constant/appstyle.dart';
import 'package:package_delivery/Constant/colors.dart';
import 'package:package_delivery/Screen/review/review_controller.dart';
import 'package:package_delivery/widget/custom_button.dart';
import 'package:package_delivery/widget/custom_new_appbar.dart';
import 'package:package_delivery/widget/text_input_filed.dart';

class ReviewWidget extends GetView<ReviewLogic> {
  const ReviewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<ReviewLogic>();

    var h = MediaQuery
        .of(context)
        .size
        .height;
    var w = MediaQuery
        .of(context)
        .size
        .width;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: CustomNewAppBar(
          title: "Review",
          leading: Icons.arrow_back_ios_rounded,
          onTap: () {
            Get.back();
          },
        ),
        resizeToAvoidBottomInset: false,
        backgroundColor: cDarkBlue,
        body: Obx(() {
          return Stack(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(w / 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Center(
                      //   child: Container(
                      //     width: w / 4,
                      //     decoration: BoxDecoration(shape: BoxShape.circle),
                      //     child: Image.asset(
                      //       Assets.userProfile,
                      //       fit: BoxFit.cover,
                      //     ),
                      //   ),
                      // ),
                      controller.driverImage!.value == '' || controller.driverImage!.value == 'null'
                      ? Center(
                          child: Container(
                            width: w * 0.25,
                            height: h * 0.13,
                            decoration: BoxDecoration(color: cWhite, shape: BoxShape.circle),
                            child: SvgPicture.asset(Assets.iconProfilePerson),
                          ),
                        )
                      : Center(
                          child: Container(
                            width: w * 0.25,
                            height: h * 0.13,
                            decoration: BoxDecoration(
                              color: cWhite, shape: BoxShape.circle,
                              image: DecorationImage(image: NetworkImage(controller.driverImage!.value))),
                          ),
                        ),
                      SizedBox(height: h / 30),
                      Center(child: Text("You rated ${controller.receiverName!.value.toString()}", style: AppStyle.textStyleRobotoMediumWhite20,)),
                      SizedBox(height: h / 30),
                      Center(
                        child: RatingBar(
                          initialRating: 3.5,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: w / 7,
                          glow: true,
                          updateOnDrag: true,
                          itemPadding: EdgeInsets.symmetric(horizontal: getHorizontalSize(5)),
                          // unratedColor: cGreyStar,
                          ratingWidget: RatingWidget(
                            full: SvgPicture.asset(Assets.iconStarFillFull, fit: BoxFit.cover),
                            half: SvgPicture.asset(Assets.iconStarFillHalf, fit: BoxFit.cover),
                            empty: SvgPicture.asset(Assets.iconStarFillOut, fit: BoxFit.cover)),
                          onRatingUpdate: (rating) {
                            controller.userReview!.value = rating;
                            debugPrint('onRatingUpdate => controller.userReview!.value : ${controller.userReview!.value}');
                          },
                        ),
                      ),
                      SizedBox(height: h / 30),
                      Text("Add Your Review", style: AppStyle.textStyleRobotoMediumWhite15),
                      SizedBox(height: h / 50),
                      TextInputFindOut(
                        controller: controller.cReview,
                        maxLines: 5,
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        label: 'Say something about service?',
                        alignLabelWithHint: true,
                        labelStyle: AppStyle.textStyleRobotoRegular15,
                        fillColor: cWhite,
                        enbleBorderColor: cTransparent,
                        style: AppStyle.textStyleRobotoMediumBlack15),
                    ],
                  ),
                ),
              ),
              CustomButton(
                onPressed: () {
                  if (controller.cReview!.text.isEmpty) {
                    Const().toast('Please enter the review');
                  }
                  else {
                    controller.saveReviewData();
                  }
                },
                title: "Submit",
                padding: EdgeInsets.symmetric(horizontal: w * 0.04, vertical: h * 0.02),

              ),
            ],
          );
        }),
      ),
    );
  }
}
