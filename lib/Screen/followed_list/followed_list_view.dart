import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:package_delivery/AppRoute/app_route.dart';
import 'package:package_delivery/Constant/app_image.dart';
import 'package:package_delivery/Constant/appstyle.dart';
import 'package:package_delivery/Constant/colors.dart';
import 'package:package_delivery/widget/custom_new_appbar.dart';
import 'package:package_delivery/widget/custom_progress_bar.dart';
import 'package:package_delivery/widget/data_not_found_widget.dart';
import 'followed_list_controller.dart';

class FollowedListWidget extends GetView<FollowedListLogic> {
  const FollowedListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final logic = Get.find<FollowedListLogic>();
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: cDarkBlue,
      appBar: CustomNewAppBar(
        title: 'Followed List',
        leading: Icons.arrow_back_ios_rounded,
        onTap: () {
          Get.back();
        },
      ),
      body: Obx(() {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: w * 0.04, vertical: h * 0.01),
          child: controller.isFollowersListDataLoad.value == true ?
          DataNotFoundWidget()
          : ListView.separated(
              itemCount: controller.followedCompanyList.value.length,
              separatorBuilder: (_, __) => Divider(color: cDarkBlueDivider, thickness: 1, height: h * 0.01,),
              itemBuilder: ((context, index) {
                return Obx(() {
                  return GestureDetector(
                    onTap: () {

                    },
                    child: Container(
                      padding: EdgeInsets.only(right: w * 0.04, top: h * 0.02, bottom: h * 0.02),
                      decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                      child: Row(
                        children: [
                          // Container(
                          //   height: h * 0.08,
                          //   width: w * 0.16,
                          //   decoration: const BoxDecoration(shape: BoxShape.circle, image: DecorationImage(image: AssetImage(Assets.demoImage3), fit: BoxFit.cover)),
                          // ),
                          CachedNetworkImage(
                            height: h * 0.08,
                            width: w * 0.16,
                            imageUrl: controller.followedCompanyList.value[index].getCompany!.companyPhoto.toString(),
                            imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                // borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(8), bottomRight: Radius.circular(7)),
                                // boxShadow: [BoxShadow(color: cBlack, spreadRadius: 0.3, offset: const Offset(0.0, 1.0), blurRadius: 2.0)],
                                image: DecorationImage(image: imageProvider, fit: BoxFit.fill )),
                            ),
                            placeholder: (context, url) => CustomProgressBar(color: cGreyDivider,),
                            errorWidget: (context, url, error) =>  Container(
                              width: w * 0.4,
                              decoration: BoxDecoration(
                                  color: cBlue,
                                  // boxShadow: [BoxShadow(color: cBlack, spreadRadius: 0.3, offset: const Offset(0.0, 1.0), blurRadius: 2.0)],
                                  // borderRadius: BorderRadius.circular(6)
                                  shape: BoxShape.circle
                              ),
                              child:Center(child: Text(controller.followedCompanyList.value[index].getCompany!.name![0].toUpperCase(),style: AppStyle.textStyleRobotoBlackItalic35,),),
                            ),
                          ),
                          SizedBox(width: w * 0.04),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(controller.followedCompanyList.value[index].getCompany!.name.toString(), style: AppStyle.textStyleDarkRobotoBoldWhite15),
                                    SizedBox(height: h * 0.006),
                                    RatingBar(
                                      initialRating: controller.followedCompanyList.value[index].getRating != null ?
                                      controller.followedCompanyList.value[index].getRating!.companyRatingStar != null
                                          ? double.parse(controller.followedCompanyList.value[index].getRating!.companyRatingStar)
                                          : 0.0
                                          :0.0,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      updateOnDrag: false,
                                      itemCount: 5,
                                      ignoreGestures: true,
                                      itemPadding: EdgeInsets.symmetric(horizontal: w * 0.005),
                                      ratingWidget: RatingWidget(
                                        full: SvgPicture.asset(Assets.iconStarFillFull),
                                        half: SvgPicture.asset(Assets.iconStarFillHalf),
                                        empty: SvgPicture.asset(Assets.iconStarFillOut)),
                                      itemSize: h * 0.025,
                                      onRatingUpdate: (rating){},
                                    ),
                                  ],
                                ),

                                controller.followedCompanyList.value[index].isCompanyFollow == 0
                                    ? GestureDetector(
                                        onTap: () {
                                          controller.getFollowUnfollowListData(1, int.parse(controller.followedCompanyList.value[index].getCompany!.id.toString()),controller.userId.toString());
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          padding: EdgeInsets.all(w * 0.015),
                                          decoration: BoxDecoration(border: Border.all(color: cBlue), borderRadius: BorderRadius.circular(5)),
                                          child: Text('Follow', overflow: TextOverflow.ellipsis, style: AppStyle.textStyleRobotoMediumWhite12)))
                                    : GestureDetector(
                                        onTap: () {
                                          controller.getFollowUnfollowListData(0, int.parse(controller.followedCompanyList.value[index].getCompany!.id.toString()),controller.userId.toString());
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          padding: EdgeInsets.all(w * 0.015),
                                          decoration: BoxDecoration(color: cWhite, borderRadius: BorderRadius.circular(5)),
                                          child: Text('Following', overflow: TextOverflow.ellipsis, style: AppStyle.textStyleRobotoMediumDarkBlue12)))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                });
              })
          ),
        );
      }),
    );
  }
}
