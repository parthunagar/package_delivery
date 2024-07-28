import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_delivery/widget/custom_progress_bar.dart';
import 'package:package_delivery/widget/data_not_found_widget.dart';
import 'followers_list_logic.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:package_delivery/AppRoute/app_route.dart';
import 'package:package_delivery/Constant/app_image.dart';
import 'package:package_delivery/Constant/appstyle.dart';
import 'package:package_delivery/Constant/colors.dart';
import 'package:package_delivery/widget/custom_new_appbar.dart';

class FollowersListWidget extends GetView<FollowersListLogic> {
  const FollowersListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<FollowersListLogic>();

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
        title: 'Followers List',
        leading: Icons.arrow_back_ios_rounded,
        onTap: () {
          Get.back();
        },
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: w * 0.04, vertical: h * 0.01),
        child: GetBuilder<FollowersListLogic>(builder: (logic) {
          return Obx(() {
            return
              controller.isFollowersListDataLoad.value == true ?
              DataNotFoundWidget() :
              ListView.separated(
                  itemCount: controller.followersList.value.length,
                  separatorBuilder: (context, index) => controller.followersList.value[index].isCompanyFollow == 0 ? const SizedBox() : Divider(color: cDarkBlueDivider, thickness: 1, height: h * 0.01,),
                  itemBuilder: ((context, index) {
                    return Obx(() {
                      return controller.followersList.value[index].isCompanyFollow == 0
                          ? const SizedBox()
                          : Container(
                            padding: EdgeInsets.only(right: w * 0.04, top: h * 0.02, bottom: h * 0.02),
                            decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                            child: Row(
                              children: [

                                CachedNetworkImage(
                                  height: h * 0.08,
                                  width: h * 0.08,
                                  imageUrl: controller.followersList.value[index].getDriverCustomer!.driverCustomerPhoto.toString(),//index % 2 == 0 ? 'https://picsum.photos/250?image=1000000' : 'https://picsum.photos/250?image=9',
                                  imageBuilder: (context, imageProvider) =>
                                      Container(decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(image: imageProvider, fit: BoxFit.fill))),
                                  placeholder: (context, url) => CustomProgressBar(color: cGreyDivider,),
                                  errorWidget: (context, url, error) =>
                                      Container(
                                          height: h * 0.08,
                                          width: h * 0.08,
                                          decoration: BoxDecoration(color: cBlue, shape: BoxShape.circle),
                                          child: Center(child: Text(controller.followersList.value[index].getDriverCustomer!.customerDriverName![0].toUpperCase().toString(),
                                              style: AppStyle.textStyleRobotoBlackItalic35))),
                                ),
                                // controller.followersList.value[index].getDriverCustomer!.driverCustomerPhoto == null
                                // ? Container(
                                //     height: h * 0.08,
                                //     width: w * 0.16,
                                //     decoration: BoxDecoration(shape: BoxShape.circle, color: cBlue),
                                //     child: Center(child: Text(controller.followersList.value[index].getDriverCustomer!.customerDriverName![0].toUpperCase(), style: AppStyle.textStyleRobotoBlackItalic55)))
                                // : Container(
                                //     height: h * 0.08,
                                //     width: w * 0.16,
                                //     decoration: BoxDecoration(
                                //       shape: BoxShape.circle,
                                //       image: DecorationImage(
                                //         image: NetworkImage(controller.followersList.value[index].getDriverCustomer!.driverCustomerPhoto!),
                                //         fit: BoxFit.cover)
                                //     ),
                                //   ),
                                SizedBox(width: w * 0.04),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(controller.followersList.value[index].getDriverCustomer!.customerDriverName.toString(), style: AppStyle.textStyleDarkRobotoBoldWhite15),
                                            SizedBox(height: h * 0.006),
                                            // Text(
                                            //    controller.followersList.value[index].getRating == null ? "" :
                                            //     controller.followersList.value[index].getRating!.ratingComment.toString(), overflow: TextOverflow.ellipsis, style: AppStyle.textStyleRobotoMediumGrey15),
                                          ]
                                      )),
                                      GestureDetector(
                                          onTap: () {
                                            debugPrint('controller.followersList.value[index].getDriverCustomer!.id : ${controller.followersList.value[index].getDriverCustomer!.id}');
                                            controller.getFollowUnfollowListData(0,controller.followersList.value[index].getDriverCustomer!.id!.toString());
                                          },
                                          child: Container(
                                            alignment: Alignment.center,
                                            width: w * 0.18,
                                            padding: EdgeInsets.all(w * 0.015),
                                            decoration: BoxDecoration(color: cWhite, borderRadius: BorderRadius.circular(5)),
                                            child: Text('Remove', overflow: TextOverflow.ellipsis, style: AppStyle.textStyleRobotoMediumDarkBlue12)))
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                    });
                  })
              );
          });
        }),
      ),
    );
  }
}
