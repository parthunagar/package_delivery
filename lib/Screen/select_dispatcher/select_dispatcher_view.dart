import 'dart:ffi';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:package_delivery/AppRoute/app_route.dart';
import 'package:package_delivery/Constant/app_image.dart';
import 'package:package_delivery/Constant/appstyle.dart';
import 'package:package_delivery/Constant/colors.dart';
import 'package:package_delivery/Screen/select_dispatcher/familiar_faces_list_model.dart';
import 'package:package_delivery/Screen/select_dispatcher/shipping_company_model.dart';
import 'package:package_delivery/Screen/select_dispatcher/top_suggestion_list_model.dart';
import 'package:package_delivery/widget/customDialog.dart';
import 'package:package_delivery/widget/custom_button.dart';
import 'package:package_delivery/widget/custom_new_appbar.dart';
import 'package:package_delivery/widget/custom_progress_bar.dart';
import 'package:package_delivery/widget/data_not_found_widget.dart';
import 'package:package_delivery/widget/text_input_filed.dart';
import 'package:package_delivery/widget/text_input_filed_serch.dart';

import 'select_dispatcher_logic.dart';

class SelectDispatcherWidget extends GetView<SelectDispatcherLogic> {
  const SelectDispatcherWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final logic = Get.find<SelectDispatcherLogic>();
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: cDarkBlue,
        appBar: CustomNewAppBar(
          title: 'Select Dispatcher',
          leading: Icons.arrow_back_ios_rounded,
          // leading: Icon(Icons.arrow_back_ios_rounded),
          onTap: () {
            Get.back();
          },
        ),

        body: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: w * 0.04),
                child: GetBuilder<SelectDispatcherLogic>(builder: (logic) {
                  return Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: h * 0.02),
                      Text('Search for Company', textAlign: TextAlign.center,
                          style: AppStyle.textStyleRobotoMediumWhite15),
                      SizedBox(height: h * 0.02),
                      // TextInputFindOut(
                      //   controller: controller.cSearch,
                      //   label: 'Search for Driver/Company',
                      //   textInputType: TextInputType.emailAddress,
                      //   textInputAction: TextInputAction.done,
                      //   onSaved: (string) {
                      //     controller.getCompanyListData(string);
                      //     // if(string == null){
                      //     //   controller.getCompanyListData('');
                      //     // }
                      //     debugPrint(' =====> CLICK ON SAVED <===== $string ');
                      //   },
                      // ),

                      TextInputFindOutSerch(
                          controller: controller.cSearch,
                          textInputAction: TextInputAction.done,
                          prefixWidget: Container(
                            padding: EdgeInsets.all(h * 0.015),
                            child: SvgPicture.asset(
                              Assets.iconSearch,
                            ),
                          ),

                          onSaved: (string) {
                            controller.getCompanyListData(string);
                            debugPrint(' =====> CLICK ON SAVED <===== $string ');
                          },
                          label: 'Search for Company',
                          textInputType: TextInputType.text),

                      SizedBox(height: h * 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Familiar Faces', textAlign: TextAlign.center,
                              style: AppStyle.textStyleRobotoMediumWhite15),
                          // Text('See All',
                          //     textAlign: TextAlign.center,
                          //     style: AppStyle.textStyleRobotoRegularGrey15),
                        ],
                      ),
                      SizedBox(height: h * 0.02),
                      Obx(() {
                        return Container(
                          height: h * 0.2,
                          // color: Colors.red[100],
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            separatorBuilder: (_, __) => SizedBox(width: w * 0.02),
                            itemCount: controller.familyFacesList.value.length,
                            itemBuilder: ((context, index) {
                              return GestureDetector(
                                onTap: (){
                                  FamiliarFacesDatum? familiarFaces =controller.familyFacesList.value[index];
                                  int id = familiarFaces.id!;
                                  selectDriver(context, id);
                                },
                                child: Stack(
                                  children: [

                                    // Container(
                                    //     width: w * 0.4,
                                    //     margin: EdgeInsets.symmetric(vertical: h * 0.004),
                                    //     decoration: BoxDecoration(
                                    //       // color: Colors.yellow,
                                    //         boxShadow: [BoxShadow(color: cBlack, spreadRadius: 0.3, offset: const Offset(0.0, 1.0), blurRadius: 2.0)],
                                    //         borderRadius: BorderRadius.circular(10),
                                    //         image: DecorationImage(
                                    //             image: NetworkImage(controller.familyFacesList.value[index].driverPhoto.toString()),
                                    //             fit: BoxFit.cover)
                                    //     ),),
                                    CachedNetworkImage(
                                      width: w * 0.4,
                                      imageUrl: controller.familyFacesList.value[index].driverPhoto.toString(),
                                      imageBuilder: (context, imageProvider) => Container(
                                        decoration: BoxDecoration(
                                            borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(8), bottomRight: Radius.circular(7)),
                                            boxShadow: [BoxShadow(color: cBlack, spreadRadius: 0.3, offset: const Offset(0.0, 1.0), blurRadius: 2.0)],
                                            image: DecorationImage(image: imageProvider, fit: BoxFit.fill )),
                                      ),
                                      placeholder: (context, url) => CustomProgressBar(color: cGreyDivider,),
                                      errorWidget: (context, url, error) =>  Container(
                                        width: w * 0.4,
                                        decoration: BoxDecoration(
                                            color: cBlue,
                                            boxShadow: [BoxShadow(color: cBlack, spreadRadius: 0.3, offset: const Offset(0.0, 1.0), blurRadius: 2.0)],
                                            borderRadius: BorderRadius.circular(6)),
                                        child:Center(child: Text(controller.topSuggestionList.value[index].username![0].toUpperCase(),style: AppStyle.textStyleRobotoBlackItalic55,),),
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      // crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          height: h * 0.07, width: w * 0.4,
                                          padding: EdgeInsets.symmetric(vertical: h * 0.02),
                                          // width: double.minPositive,
                                          decoration: BoxDecoration(
                                              color: cBlackOpacity,
                                              borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8))),
                                          child: Column(
                                            // mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              // SizedBox(height: h *0.01),
                                              Expanded(child: Text(
                                                controller.familyFacesList.value[index].username.toString(),
                                                style: AppStyle.textStyleRobotoMediumWhite15,maxLines: 1,)),
                                              // Expanded(child: Text('10-15 Mins Away', style: AppStyle.textStyleRobotoRegularGrey15,))
                                            ],
                                          ),
                                        ),

                                      ],
                                    )
                                      // child:  CachedNetworkImage(
                                      //       height: h * 0.12,
                                      //       width: w * 0.23,
                                      //       imageUrl: controller.familyFacesList.value[index].driverPhoto.toString(),
                                      //       imageBuilder: (context, imageProvider) => Container(
                                      //         decoration: BoxDecoration(
                                      //           boxShadow: [BoxShadow(color: cBlack, spreadRadius: 0.3, offset: const Offset(0.0, 1.0), blurRadius: 2.0)],
                                      //           image: DecorationImage(image: imageProvider, fit: BoxFit.fill )),
                                      //       ),
                                      //       placeholder: (context, url) => const CustomProgressBar(),
                                      //       errorWidget: (context, url, error) =>  Container(
                                      //         height: h * 0.12,
                                      //         width: w * 0.23,
                                      //         decoration: BoxDecoration(
                                      //           color: cBlue,
                                      //           boxShadow: [BoxShadow(color: cBlack, spreadRadius: 0.3, offset: const Offset(0.0, 1.0), blurRadius: 2.0)],
                                      //           borderRadius: BorderRadius.circular(6)),
                                      //         child:Center(child: Text(controller.topSuggestionList.value[index].username[0].toUpperCase(),style: AppStyle.textStyleRobotoBlackItalic55,),),
                                      //       ),
                                      //   errorWidget: (context, url, error) => Container(
                                      //     decoration: BoxDecoration(
                                      //       image: DecorationImage(
                                      //         image: AssetImage(Assets.iconAppLogoPNG),
                                      //         fit: BoxFit.fill,
                                      //         // colorFilter: ColorFilter.mode(Colors.red, BlendMode.colorBurn)
                                      //       ),
                                      //     ),
                                      //   )



                                  ],)
                              );

                            }),
                          ),
                        );
                      }),
                      SizedBox(height: h * 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Top Suggestions',
                              textAlign: TextAlign.center,
                              style: AppStyle.textStyleRobotoMediumWhite15),
                          // Text('See All',
                          //     textAlign: TextAlign.center,
                          //     style: AppStyle.textStyleRobotoRegularGrey15),
                        ],
                      ),
                      SizedBox(height: h * 0.02),
                      Obx(() {
                        return SizedBox(
                          height: h * 0.15,
                          // width: w,
                          // color: Colors.red[100],
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            separatorBuilder: (_, __) => SizedBox(width: w * 0.02),
                            itemCount: controller.topSuggestionList.value.length,
                            itemBuilder: ((context, index) {
                              return GestureDetector(
                                onTap: (){
                                  TopSuggestionDatum? topSuggestion = controller.topSuggestionList.value[index];
                                  int id = topSuggestion.id!;
                                  selectDriver(context,id);
                                },
                                child: Container(
                                  width: w * 0.92,
                                  // padding: EdgeInsets.symmetric(horizontal: w * 0.02, vertical: h * 0.015),
                                  padding: EdgeInsets.only(left: w * 0.02,right: w * 0.04,top:  h * 0.015,bottom:   h * 0.015),
                                  decoration: BoxDecoration(
                                    color: cWhite,
                                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                                  ),
                                  child: Row(
                                    children: [
                                      // Image.asset(Assets.demoImage4,height: h * 0.07,fit: BoxFit.contain,),
                                      controller.topSuggestionList.value[index].driverPhoto == '' ?
                                      Container(
                                        height: h * 0.12,
                                        width: w * 0.23,
                                        decoration: BoxDecoration(
                                          color: cBlue,
                                            borderRadius: BorderRadius.circular(6),
                                            // image: DecorationImage(
                                            //     image: NetworkImage(controller.topSuggestionList.value[index].driverPhoto.toString(),),
                                            //     fit: BoxFit.fill)
                                        ),
                                        child: Center(child: Text(controller.topSuggestionList.value[index].username![0].toUpperCase(),style: AppStyle.textStyleRobotoBlackItalic55,),),
                                      ) :
                                      CachedNetworkImage(
                                        height: h * 0.12,
                                        width: w * 0.23,
                                        imageUrl: controller.topSuggestionList.value[index].driverPhoto.toString(),
                                        imageBuilder: (context, imageProvider) => Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: imageProvider,
                                                fit: BoxFit.fill,
                                                // colorFilter: ColorFilter.mode(Colors.red, BlendMode.colorBurn)
                                              ),
                                          ),
                                        ),
                                        placeholder: (context, url) => CustomProgressBar(),
                                        errorWidget: (context, url, error) =>  Container(
                                          height: h * 0.12,
                                          width: w * 0.23,
                                          decoration: BoxDecoration(
                                            color: cBlue,
                                            borderRadius: BorderRadius.circular(6),
                                          ),
                                          child:Center(child: Text(controller.topSuggestionList.value[index].username![0].toUpperCase(),style: AppStyle.textStyleRobotoBlackItalic55,),),
                                        ),
                                      ),

                                      SizedBox(width: w * 0.02),
                                      Expanded(child: Column(
                                        // mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          // SizedBox(height: h * 0.01),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            // crossAxisAlignment: CrossAxisAlignment.start,
                                            // mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(child: Text(controller.topSuggestionList.value[index].username.toString(),
                                                  overflow: TextOverflow.ellipsis,
                                                  style: AppStyle.textStyleDarkRobotoBoldBlue15)),
                                              controller.topSuggestionList.value[index].getCompanyDriver != null
                                                  ? Container(
                                                  alignment: Alignment.center,
                                                  padding: EdgeInsets.all(w * 0.015),
                                                  decoration: BoxDecoration(color: cParrotOpacity, borderRadius: BorderRadius.circular(2)),
                                                  child: Text('Available', overflow: TextOverflow.ellipsis, style: AppStyle.textStyleRobotoMediumParrot12))
                                                  : controller.topSuggestionList.value[index].getCompanyDriver != null && controller.topSuggestionList.value[index].getCompanyDriver!.isAvailble == 1
                                                  ?  Container(
                                                  alignment: Alignment.center,
                                                  padding: EdgeInsets.all(w * 0.015),
                                                  decoration: BoxDecoration(color: cParrotOpacity, borderRadius: BorderRadius.circular(5)),
                                                  child: Text('Available', overflow: TextOverflow.ellipsis, style: AppStyle.textStyleRobotoMediumParrot12))
                                                  : Container(
                                                  alignment: Alignment.center,
                                                  padding: EdgeInsets.all(w * 0.015),
                                                  decoration: BoxDecoration(color: cRedOpacity, borderRadius: BorderRadius.circular(5)),
                                                  child: Text('Not Available', overflow: TextOverflow.ellipsis, style: AppStyle.textStyleRobotoMediumRed12))

                                            ],
                                          ),
                                          SizedBox(height: h * 0.005),
                                          Text(
                                              // 'Dash Logistics',
                                              controller.topSuggestionList.value[index].companyName == null
                                              ? ''
                                              : controller.topSuggestionList.value[index].companyName!.name.toString(),

                                              style: AppStyle.textStyleRobotoRegularGrey15),
                                          SizedBox(height: h * 0.02),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              RatingBar(
                                                initialRating: controller.topSuggestionList.value[index].getRating ==  null || controller.topSuggestionList.value[index].getRating!.ratingStar ==null
                                                    ? 0.0
                                                    : double.parse(controller.topSuggestionList.value[index].getRating!.ratingStar!) ,
                                                // minRating: 1,
                                                direction: Axis.horizontal,
                                                allowHalfRating: true,
                                                updateOnDrag: false,
                                                itemCount: 5,
                                                ignoreGestures: true,
                                                // glow: false,
                                                itemPadding: EdgeInsets.symmetric(horizontal: w * 0.005),
                                                ratingWidget: RatingWidget(
                                                  full: SvgPicture.asset(Assets.iconStarFillFull),
                                                  half: SvgPicture.asset(Assets.iconStarFillHalf),
                                                  empty: SvgPicture.asset(Assets.iconStarFillOut)),
                                                itemSize: h * 0.025,
                                                onRatingUpdate: (rating) {
                                                  debugPrint(
                                                      'onRatingUpdate => rating : $rating');
                                                },
                                              ),
                                              // Expanded(child: Text(
                                              //     '10-15 Mins Away',
                                              //     overflow: TextOverflow.ellipsis,
                                              //     textAlign: TextAlign.end,
                                              //     style: AppStyle.textStyleRobotoRegularGrey12),),

                                            ],
                                          )
                                        ],
                                      ))
                                    ],
                                  ),
                                ),
                              );
                            }),
                          ),
                        );
                      }),
                      SizedBox(height: h * 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Shipping Companies',
                              textAlign: TextAlign.center,
                              style: AppStyle.textStyleRobotoMediumWhite15),
                          // GestureDetector(
                          //   onTap: (){
                          //     Get.toNamed(AppRoutes.shippingCompaniesScreen);
                          //   },
                          //   child: Text('See All',
                          //       textAlign: TextAlign.center,
                          //       style: AppStyle.textStyleRobotoRegularGrey15),
                          //
                          // )

                        ],
                      ),
                      SizedBox(height: h * 0.02),
                      Obx(() {
                        return controller.isCompanyDataLoad.value == true ?
                        DataNotFoundWidget() :
                        Container(
                          // color: Colors.red[200],
                          height: h * 0.26,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            separatorBuilder: (_, __) => SizedBox(width: w * 0.02),
                            itemCount: controller.companyList.value.length,
                            itemBuilder: ((context, index) {
                              return GestureDetector(
                                onTap: () {
                                  ShippingCompanyDatum? shippingCompany = controller.companyList.value[index];
                                  int id = shippingCompany.id!;
                                  selectDriver(context,id);
                                },
                                child: Container(
                                  width: w * 0.44,
                                  padding: EdgeInsets.symmetric(horizontal: w * 0.02, vertical: h * 0.01),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: cGreyLight, width: 2.0),
                                    color: cWhite,
                                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                                    // boxShadow: [
                                    //   BoxShadow(
                                    //     color: cGreyLight,
                                    //     spreadRadius: 1,
                                    //     blurRadius: 2,
                                    //     offset: const Offset(0, 3),
                                    //   ),
                                    // ],
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    // mainAxisSize: MainAxisSize.min,
                                    children: [
                                      //TODO : M6 => 05_02_2022
                                      controller.companyList.value[index].isCompanyFollow == 1
                                          ? GestureDetector(
                                          onTap: () {
                                            debugPrint('controller.companyList.value[index].id : ${controller.companyList.value[index].id}');
                                            controller.getFollowUnfollowListData(0, int.parse(controller.companyList.value[index].id.toString()),controller.userId.toString());
                                          },
                                          child: Align(
                                            alignment: Alignment.bottomRight,
                                            child: Container(
                                                width: w * 0.18,
                                                alignment: Alignment.center,
                                                padding: EdgeInsets.all(w * 0.015),
                                                decoration: BoxDecoration(color: cRedOpacity, borderRadius: BorderRadius.circular(5)),
                                                child: Text('UnFollow', overflow: TextOverflow.ellipsis, style: AppStyle.textStyleRobotoMediumRed12))),
                                          )
                                      : GestureDetector(
                                          onTap: () {
                                            controller.getFollowUnfollowListData(1, int.parse(controller.companyList.value[index].id.toString()),controller.userId.toString());
                                          },
                                          child: Align(
                                            alignment: Alignment.bottomRight,
                                            child:  Container(
                                                width: w *0.18,
                                                alignment: Alignment.center,
                                                padding: EdgeInsets.all(w * 0.015),
                                                decoration: BoxDecoration(color: cParrotOpacity, borderRadius: BorderRadius.circular(5)),
                                                child: Text('Follow', overflow: TextOverflow.ellipsis, style: AppStyle.textStyleRobotoMediumParrot12)),
                                          )),
                                      SizedBox(height: h * 0.02),
                                      Container(
                                        height: h * 0.09,
                                        width: w * 0.18,
                                        decoration: BoxDecoration(color: cBlue, borderRadius: BorderRadius.circular(6)),
                                        child: Center(child: Text(
                                          controller.companyList.value[index].username![0].toUpperCase().toString(),
                                          style: AppStyle.textStyleRobotoBlackItalic55)),
                                        // child: Center(child: Text('',style: AppStyle.textStyleRobotoBlackItalic55,),),
                                      ),
                                      SizedBox(height: h * 0.01),
                                      Text(controller.companyList.value[index].username.toString(), style: AppStyle.textStyleDarkRobotoBoldBlue15),
                                      SizedBox(height: h * 0.01),
                                      Text('${controller.companyList.value[index].avaliable == "" ? 0 : controller.companyList.value[index].avaliable.toString()} Driver Available', style: AppStyle.textStyleRobotoRegular15),
                                    ],
                                  ),

                                ),
                              );
                            }),
                          ),
                        );
                      }),
                      SizedBox(height: h * 0.02),
                    ],
                  );
                }),
              ),
            ),
            // CustomButton(
            //   title: 'Continue to Shipment Summary',
            //   padding: EdgeInsets.symmetric(
            //       horizontal: w * 0.07, vertical: h * 0.02),
            //   onPressed: () async {
            //     ///TODO: 27-01-2022
            //     // controller.callCreateShipment();
            //
            //   },
            // )
          ],
        )
    );
  }

  void selectDriver(BuildContext c, int id ) {
    dialogChooseDivider(c,
      'Are you sure hiring this driver?',
      'Yes', 'No', () {
        // _handleURLButtonPress(c, ImageSource.camera);
        debugPrint(" =====> ON CLICK YES <===== ");
        controller.callCreateShipment(id);
        Get.back();
      }, () {
        // _handleURLButtonPress(c, ImageSource.gallery);
        debugPrint(" =====> ON CLICK NO <===== ");
        Get.back();
      },

    );
  }
}
