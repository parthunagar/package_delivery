import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:package_delivery/Constant/app_image.dart';
import 'package:package_delivery/Constant/appstyle.dart';
import 'package:package_delivery/Constant/colors.dart';

enum PackageDeliveryStatuss { Delivered, InTransit, Pending }

class MyPackage extends StatelessWidget {
  const MyPackage({
    Key? key,
    required this.date,
    required this.orderid,
    required this.customername,
    required this.location,
    required this.drivername,
    required this.packageDeleveryStatuss,
  }) : super(key: key);

  final String date, orderid, customername, location, drivername;
  final PackageDeliveryStatuss packageDeleveryStatuss;

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        border: Border.all(color: cGreyLight, width: 1.0),
        color: cWhite,
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
        boxShadow: <BoxShadow>[
          new BoxShadow(
            color: cGreyLight,
            blurRadius: 1.0,
            offset: new Offset(0.0, 0.0),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              // Row + (Text+downicon)
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  date,
                  style: AppStyle.textStyleRobotoMediumGrey15,
                ),
                Text(
                  'Order Id # $orderid',
                  style: AppStyle.textStyleRobotoMediumBlue15,
                ),
              ],
            ),
          ),
          Container(
            height: getVerticalSize(1),
            color: cGreyLight,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: getHorizontalSize(20),
                      height: getHorizontalSize(20),
                      child: SvgPicture.asset(
                        Assets.iconPeople,
                        fit: BoxFit.contain,
                        color: cBlue,
                      ),
                    ),
                    SizedBox(
                      width: getHorizontalSize(10),
                    ),
                    Text(
                      customername,
                      style: AppStyle.textStyleRobotoMediumBlue15,
                    ),
                  ],
                ),
                SizedBox(
                  height: getVerticalSize(10),
                ),
                Row(
                  children: [
                    Container(
                      width: getHorizontalSize(20),
                      height: getHorizontalSize(20),
                      child: SvgPicture.asset(
                        Assets.iconLocationpin,
                        fit: BoxFit.contain,
                        color: cBlue,
                      ),
                    ),
                    SizedBox(
                      width: getHorizontalSize(10),
                    ),
                    Flexible(
                      child: Text(
                        location,
                        style: AppStyle.textStyleRobotoMediumBlack15,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: getVerticalSize(10),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: getHorizontalSize(20),
                          height: getHorizontalSize(20),
                          child: SvgPicture.asset(
                            Assets.iconDriverfilloutblue,
                            fit: BoxFit.contain,
                            color: cBlue,
                          ),
                        ),
                        SizedBox(
                          width: getHorizontalSize(10),
                        ),
                        Text(
                          drivername,
                          style: AppStyle.textStyleRobotoMediumBlack15,
                        ),
                      ],
                    ),
                    packageDeleveryStatuss == PackageDeliveryStatuss.Delivered
                        ? IntrinsicWidth(
                            child: Container(
                              padding: EdgeInsets.all(getHorizontalSize(5)),
                              decoration: BoxDecoration(
                                  color: cParrotOpacity,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Text(
                                'Delivered',
                                style: AppStyle.textStyleRobotoMediumParrot15,
                              ),
                            ),
                          )
                        : packageDeleveryStatuss ==
                                PackageDeliveryStatuss.InTransit
                            ? IntrinsicWidth(
                                child: Container(
                                  padding: EdgeInsets.all(getHorizontalSize(5)),
                                  decoration: BoxDecoration(
                                      color: cYellowOpacity,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Text(
                                    'In Transit',
                                    style:
                                        AppStyle.textStyleRobotoMediumYellowt15,
                                  ),
                                ),
                              )
                            : IntrinsicWidth(
                                child: Container(
                                  padding: EdgeInsets.all(getHorizontalSize(5)),
                                  decoration: BoxDecoration(
                                      color: cRedOpacity,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Text(
                                    'Pending',
                                    style:
                                        AppStyle.textStyleRobotoMediumRed15,
                                  ),
                                ),
                              )
                  ],
                ),
                SizedBox(
                  height: getVerticalSize(10),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
