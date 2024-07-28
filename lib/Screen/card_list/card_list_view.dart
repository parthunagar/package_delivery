import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:package_delivery/AppRoute/NavigationArgs.dart';
import 'package:package_delivery/AppRoute/app_route.dart';
import 'package:package_delivery/Constant/appstyle.dart';
import 'package:package_delivery/Constant/colors.dart';
import 'package:package_delivery/widget/custom_new_appbar.dart';

import 'card_list_logic.dart';

class CardListWidget extends StatelessWidget {
  const CardListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<CardListLogic>();
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: cDarkBlue,
      appBar: CustomNewAppBar(
        title: "Card Listing",
        leading: Icons.arrow_back_ios_rounded,
        onTap: () {
          Get.back();
        },),

      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: w * 0.04,vertical: h * 0.01),
          child:  ListView.separated(
            separatorBuilder: ((context,index){
              return SizedBox(height: h * 0.02);
            }),
              itemCount: 10,
              itemBuilder: ((context,index){
                return Slidable(
                    enabled: true,
                    endActionPane: ActionPane(
                      extentRatio: 0.4,
                      motion: const StretchMotion(),
                      children: [
                        SizedBox(width: w * 0.03),
                        Flexible(child: GestureDetector(
                          onTap: (){
                            onClickUpdate(context);
                          },
                          child: Container(
                            height: h * 0.17,
                            width: w  * 0.15,
                            decoration: BoxDecoration(color: cGreen, borderRadius: BorderRadius.circular(10)),
                            child: Icon(FontAwesomeIcons.solidEdit,color: cParrotOpacity,),
                            // child:
                            // SlidableAction(
                            //   // spacing: 5,
                            //   //   flex: 1,
                            //     onPressed: onClickUpdate, backgroundColor: cGreen, foregroundColor: cParrotOpacity, icon: FontAwesomeIcons.solidEdit),
                          ),
                        ),),
                        SizedBox(width: w * 0.03),
                        // SlidableAction(
                        //   // spacing: 10.0,
                        //   // flex: 1,
                        //   onPressed: onClickDelete, backgroundColor: cRedOpacity, foregroundColor: cRed, icon: Icons.delete,),
                        Flexible(child: GestureDetector(
                          onTap: (){
                            onClickDelete(context);
                          },
                          child: Container(
                            height: h * 0.17,
                            width: w  * 0.15,
                            decoration: BoxDecoration(color: cRedOpacity, borderRadius: BorderRadius.circular(10)),
                            child: Icon(FontAwesomeIcons.trashAlt,color: cRed,),
                            // child:
                            // SlidableAction(
                            //   // spacing: 5,
                            //   //   flex: 1,
                            //     onPressed: onClickUpdate, backgroundColor: cGreen, foregroundColor: cParrotOpacity, icon: FontAwesomeIcons.solidEdit),
                          ),
                        )),
                      ],
                    ),
                    child: GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoutes.paymentSuccessScreen);
                  },
                  child: Container(
                    height: h * 0.25,
                    padding: EdgeInsets.symmetric(horizontal: w * 0.06),
                    width: w,
                    decoration:
                    // index % 2 == 0 ? BoxDecoration(
                    //   borderRadius: BorderRadius.circular(10),
                    //   gradient:  LinearGradient(
                    //     begin: Alignment.topLeft,
                    //     end: Alignment.bottomRight,
                    //     colors: [cCardGradientColor1, cCardGradientColor2])) :
                    BoxDecoration(borderRadius: BorderRadius.circular(10), color: cBlack),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // SvgPicture.asset(Assets.imageVisaCard),
                        SizedBox(height: h * 0.03),
                        Text('**** **** **** 8630', style: AppStyle.textStyleRobotoBoldWhite20.copyWith(letterSpacing: 3),),
                        SizedBox(height: h * 0.03),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text('Expiry Date',style: AppStyle.textStyleRobotoMediumWhiteOpacity12,),
                                SizedBox(height: h * 0.005),
                                Text('11/2025',style: AppStyle.textStyleRobotoBoldWhite12,),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.only(right: w * 0.1),
                              child: Column(
                                children: [
                                  Text('Card holder name',style: AppStyle.textStyleRobotoMediumWhiteOpacity12,),
                                  SizedBox(height: h * 0.005),
                                  Text('John Wilamson',style: AppStyle.textStyleRobotoBoldWhite12,),
                                ],
                              ),
                            )
                            // SizedBox(width: w * 0.001),
                          ],
                        )
                      ],
                    ),
                  ),
                )
                );
              })
          ),
      ),
    );
  }

  void onClickDelete(BuildContext c) {
    debugPrint(" =====> ON CLICK DELETE <===== ");

    // Get.toNamed(AppRoutes.selectDispatcherScreen);
    // dialogWithDivider(c,
    //     'Are you sure to delete this product?',
    //     'Cancel', 'Delete', () {
    //       debugPrint(" =====> ON CLICK CANCEL <===== ");
    //       Get.back();
    //     }, () {
    //       debugPrint(" =====> ON CLICK DELETE <===== ");
    //     });
  }

  void onClickUpdate(BuildContext c) {
    debugPrint(" =====> ON CLICK UPDATE <===== ");
    Get.toNamed(AppRoutes.addEditCardScreen,parameters: {
      NavigationArgs.kEdit : 'true',
      NavigationArgs.kCardNo : '1234 4567 1233 5678',
      NavigationArgs.kCardName : 'John Wilamson',
      NavigationArgs.kCardDate: '11/2025'
    });
    // Get.toNamed(AppRoutes.selectDispatcherScreen);
    // dialogWithDivider(c,
    //     'Are you sure to delete this product?',
    //     'Cancel', 'Delete', () {
    //       debugPrint(" =====> ON CLICK CANCEL <===== ");
    //       Get.back();
    //     }, () {
    //       debugPrint(" =====> ON CLICK DELETE <===== ");
    //     });
  }

}
