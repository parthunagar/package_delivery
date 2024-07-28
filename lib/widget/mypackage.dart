import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:package_delivery/AppRoute/NavigationArgs.dart';
import 'package:package_delivery/AppRoute/app_route.dart';
import 'package:package_delivery/Constant/app_constant.dart';
import 'package:package_delivery/Constant/app_image.dart';
import 'package:package_delivery/Constant/appstyle.dart';
import 'package:package_delivery/Constant/colors.dart';
import 'package:geocoding/geocoding.dart';
import 'package:package_delivery/Screen/home/home_controller.dart';
import 'package:package_delivery/Screen/home/shipmet_list_model.dart';

class MyPackage extends StatelessWidget {
  const MyPackage({
    Key? key,
    this.shipmentItem,
    this.date,
    this.orderid,
    this.customername,
    this.location,
    this.drivername,
    this.packageDeleveryStatus,
    this.userRollId,
  }) : super(key: key);

  final String? date, orderid, customername, location, drivername;

  final shipment? shipmentItem;
  final int? packageDeleveryStatus;
  final int? userRollId;

  @override
  Widget build(BuildContext context) {
    // DateTime tempDate = new DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(shipmentItem.createdAt);
    final DateFormat formatter = DateFormat('MMM dd,yyyy');
    final String formatted = formatter.format(shipmentItem!.createdAt!);
    final Future<String> address = getAdresss(
        double.parse(shipmentItem!.destinationLatitude!),
        double.parse(shipmentItem!.destinationLatitude!));

    // String name = address.;
    // String subLocality = placeMark.subLocality;
    // String locality = placeMark.locality;
    // String administrativeArea = placeMark.administrativeArea;
    // String postalCode = placeMark.postalCode;
    // String country = placeMark.country;
    // String address = "${name}, ${subLocality}, ${locality}, ${administrativeArea} ${postalCode}, ${country}";

    print(address);
    // final String addressString = "${}, ${subLocality}, ${locality}, ${administrativeArea} ${postalCode}, ${country}";

    // var first = addresses.first;
    // print(' ${first.locality}, ${first.adminArea},${first.subLocality}, ${first.subAdminArea},${first.addressLine}, ${first.featureName},${first.thoroughfare}, ${first.subThoroughfare}');
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    final logic = Get.find<HomeLogic>();
    return Container(
      // margin: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        border: Border.all(color: cGreyLight, width: 1.0),
        color: cWhite,
        borderRadius: const BorderRadius.all(
          Radius.circular(10.0),
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: cGreyLight,
            blurRadius: 1.0,
            offset: const Offset(0.0, 0.0),
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
                  formatted,
                  style: AppStyle.textStyleRobotoMediumGrey15,
                ),
                Text(
                  'Order Id ${shipmentItem!.trackingId}',
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
                      shipmentItem!.receiverName!,
                      style: AppStyle.textStyleRobotoMediumBlue15,
                    ),
                  ],
                ),
                SizedBox(
                  height: getVerticalSize(15),
                ),
                userRollId == UserRoles.driver ?Row(
                  children: [
                    Container(
                      width: getHorizontalSize(20),
                      height: getHorizontalSize(20),
                      child: SvgPicture.asset(
                        Assets.iconCall2,
                        fit: BoxFit.contain,
                        color: cBlue,
                      ),
                    ),
                    SizedBox(
                      width: getHorizontalSize(10),
                    ),
                    Text(
                      shipmentItem!.receiverPhoneNumber!,
                      style: AppStyle.textStyleDarkRobotoMediumDarkGrey15,
                    ),
                  ],
                ):const SizedBox.shrink(),
                userRollId == UserRoles.driver ? SizedBox(height: getVerticalSize(15)):const SizedBox.shrink(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
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
                        Container(
                          width: getHorizontalSize(180),
                          child: Text(
                            shipmentItem!.deliveryAddress! ,
                            style: AppStyle.textStyleDarkRobotoMediumDarkGrey15,
                          ),
                        ),
                      ],
                    ),
                    shipmentItem!.payment_status ==
                        ShipmentPaymantStatus.paid
                        ? Container(
                      padding: EdgeInsets.all(getHorizontalSize(5)),
                      decoration: BoxDecoration(
                          color: cParrotOpacity,
                          borderRadius: BorderRadius.circular(5)),
                      child: Text(
                        'Paid',
                        style: AppStyle.textStyleRobotoMediumParrot15,
                      ),
                    ):Container(
                      padding: EdgeInsets.all(getHorizontalSize(5)),
                      decoration: BoxDecoration(
                          color: cRedOpacity,
                          borderRadius: BorderRadius.circular(5)),
                      child: Text(
                        'Not paid',
                        style: AppStyle.textStyleRobotoMediumRed15,
                      ),
                    )
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
                          shipmentItem!.getDriver !=null ?  shipmentItem!.getDriver!.name!
                              : shipmentItem!.getCompanyDetail !=null ?  shipmentItem!.getCompanyDetail!.name!
                              : '',
                          style: AppStyle.textStyleDarkRobotoMediumDarkGrey15,
                        ),
                      ],
                    ),
                    shipmentItem!.shipmentStatus ==
                            PackageDeliveryStatus.Delivered
                        ? Container(
                          padding: EdgeInsets.all(getHorizontalSize(5)),
                          decoration: BoxDecoration(
                              color: cParrotOpacity,
                              borderRadius: BorderRadius.circular(5)),
                          child: Text(
                            'Delivered',
                            style: AppStyle.textStyleRobotoMediumParrot15,
                          ),
                        )
                        : shipmentItem!.shipmentStatus ==
                                PackageDeliveryStatus.Shipped
                            ? Container(
                                padding: EdgeInsets.all(getHorizontalSize(5)),
                                decoration: BoxDecoration(
                                    color: cYellowOpacity,
                                    borderRadius: BorderRadius.circular(5)),
                                child: Text(
                                  'Shipped',
                                  style:
                                      AppStyle.textStyleRobotoMediumYellowt15,
                                ),
                              )
                            : shipmentItem!.shipmentStatus ==
                                    PackageDeliveryStatus.Packed
                                ? Container(
                                    padding:
                                        EdgeInsets.all(getHorizontalSize(5)),
                                    decoration: BoxDecoration(
                                        color: cYellowOpacity,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Text(
                                      'Packed',
                                      style: AppStyle
                                          .textStyleRobotoMediumYellowt15,
                                    ),
                                  )
                                : shipmentItem!.shipmentStatus ==
                                        PackageDeliveryStatus.Failed
                                    ? Container(
                                        padding: EdgeInsets.all(
                                            getHorizontalSize(5)),
                                        decoration: BoxDecoration(
                                            color: cRedOpacity,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Text(
                                          'Failed',
                                          style: AppStyle
                                              .textStyleRobotoMediumRed15,
                                        ),
                                      )
                                    : Container(
                                        padding: EdgeInsets.all(
                                            getHorizontalSize(5)),
                                        decoration: BoxDecoration(
                                            color: cYellowOpacity,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Text(
                                          'InProgress',
                                          style: AppStyle
                                              .textStyleRobotoMediumYellowt15,
                                        ),
                                      )
                  ],
                ),
                SizedBox(
                  height: getVerticalSize(10),
                ),
                shipmentItem!.shipmentStatus == PackageDeliveryStatus.Delivered && userRollId == UserRoles.customer
                    ? Padding(
                      padding: EdgeInsets.symmetric(horizontal: w * 0.03),
                      child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceAround,

                          children: [
                            // Text('${shipmentItem!.driverRatingStar}'),
                            callDriverRattingBtn(shipmentItem!, h, w),
                            // shipmentItem!.getDriver != null
                            //     // ? shipmentItem!.driverRatingStar == null
                            //     ? ElevatedButton(
                            //   style: ButtonStyle(
                            //     elevation: MaterialStateProperty.all(0),
                            //     shape: MaterialStateProperty.all(
                            //       RoundedRectangleBorder(
                            //           side: BorderSide(color: cBlue),
                            //           borderRadius: BorderRadius.circular(5)),
                            //     ),
                            //     overlayColor: MaterialStateProperty.all(cBlue),
                            //     backgroundColor: MaterialStateProperty.all(cWhite),
                            //     textStyle:MaterialStateProperty.all( AppStyle.textStyleRobotoMediumWhite15)
                            //   ),
                            //   onPressed: () {
                            //             Get.toNamed(AppRoutes.reviewScreen, arguments: {
                            //               NavigationArgs.kUserName : shipmentItem!.getDriver!.name.toString(),
                            //               NavigationArgs.cShipmentId : shipmentItem!.id.toString(),
                            //               NavigationArgs.cDriverId : shipmentItem!.getDriver!.id.toString(),
                            //               NavigationArgs.cDriverImage : shipmentItem!.getDriver!.driverPhoto.toString(),
                            //             });
                            //   },
                            //   child: Container(
                            //     width: w / 3.3,
                            //     height: h / 25,
                            //     alignment: Alignment.center,
                            //     child: Text("Driver Rating",
                            //         style: AppStyle.textStyleRobotoMediumBlue15),
                            //   ),
                            // )
                            //     : const SizedBox.shrink(),
                            const Spacer(),
                            shipmentItem!.getCompanyDetail != null ?  ElevatedButton(
                              style: ButtonStyle(
                                elevation: MaterialStateProperty.all(0),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      side: BorderSide(color: cBlue),
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                                overlayColor: MaterialStateProperty.all(cBlue),
                                backgroundColor: MaterialStateProperty.all(cWhite),
                                textStyle:MaterialStateProperty.all( AppStyle.textStyleRobotoMediumWhite15)
                              ),
                              onPressed: () {
                                        Get.toNamed(AppRoutes.reviewScreen, arguments: {
                                          NavigationArgs.kUserName : shipmentItem!.getCompanyDetail!.name.toString(),
                                          NavigationArgs.cShipmentId : shipmentItem!.id.toString(),
                                          NavigationArgs.cDriverId : shipmentItem!.getCompanyDetail!.id.toString(),
                                          NavigationArgs.cDriverImage : shipmentItem!.getCompanyDetail!.companyPhoto.toString(),
                                        });
                              },
                              child: Container(
                                width: w / 3.3,
                                height: h / 25,
                                alignment: Alignment.center,
                                child: Text("Company Rating",
                                    style: AppStyle.textStyleRobotoMediumBlue15),
                              ),
                            ): const SizedBox.shrink(),
                          ],
                        ),
                    )
                    : const SizedBox.shrink()
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget callDriverRattingBtn(shipment? shipmentItem,var h,var w) {
    debugPrint('getDriver : ${shipmentItem!.getDriver }');
    debugPrint('driverRatingStar : ${shipmentItem.driverRatingStar }');
    if( shipmentItem.getDriver != null){
      if(shipmentItem.driverRatingStar == null || shipmentItem.driverRatingStar == ''){
        return ElevatedButton(
          style: ButtonStyle(
              elevation: MaterialStateProperty.all(0),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                    side: BorderSide(color: cBlue),
                    borderRadius: BorderRadius.circular(5)),
              ),
              overlayColor: MaterialStateProperty.all(cBlue),
              backgroundColor: MaterialStateProperty.all(cWhite),
              textStyle:MaterialStateProperty.all( AppStyle.textStyleRobotoMediumWhite15)
          ),
          onPressed: () {
            Get.toNamed(AppRoutes.reviewScreen, arguments: {
              NavigationArgs.kUserName : shipmentItem.getDriver!.name.toString(),
              NavigationArgs.cShipmentId : shipmentItem.id.toString(),
              NavigationArgs.cDriverId : shipmentItem.getDriver!.id.toString(),
              NavigationArgs.cDriverImage : shipmentItem.getDriver!.driverPhoto.toString(),
            });
          },
          child: Container(
            width: w / 3.3,
            height: h / 25,
            alignment: Alignment.center,
            child: Text("Driver Rating",
                style: AppStyle.textStyleRobotoMediumBlue15),
          ),
        );
      }
      else{
        return SizedBox();
      }
    }
    else {
      return SizedBox();
    }

  }

  Future<String> getAdresss(double lat, double lang) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, lang);
    var first = placemarks.first;
    print(
        ' ${first.name},  ${first.street},  ${first.subLocality}, ${first.locality},  ${first.administrativeArea},  ${first.country} , ${first.postalCode}');
    String address =
        ' ${first.name},  ${first.street},  ${first.subLocality}, ${first.locality},  ${first.administrativeArea},  ${first.country} , ${first.postalCode}';
    return address;
  }
}
