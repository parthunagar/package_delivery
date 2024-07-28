import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:package_delivery/Constant/app_constant.dart';
import 'package:package_delivery/Constant/app_image.dart';
import 'package:package_delivery/Constant/appstyle.dart';
import 'package:package_delivery/Constant/colors.dart';
import 'package:geocoding/geocoding.dart';
import 'package:package_delivery/Screen/home/shipmet_list_model.dart';
import 'package:package_delivery/Screen/shipmentsummary/shipmentsummary_model.dart';

class MyPackageDriverTraking extends StatelessWidget {
  const MyPackageDriverTraking({
    Key? key,
    this.shipmentItem,
    this.date,
    this.orderid,
    this.customername,
    this.location,
    this.drivername,
    this.packageDeleveryStatus,
  }) : super(key: key);

  final String? date, orderid, customername, location, drivername;

  final Datum? shipmentItem;
  final int? packageDeleveryStatus;

  @override
  Widget build(BuildContext context) {
    // DateTime tempDate = new DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(shipmentItem.createdAt);



    // String name = address.;
    // String subLocality = placeMark.subLocality;
    // String locality = placeMark.locality;
    // String administrativeArea = placeMark.administrativeArea;
    // String postalCode = placeMark.postalCode;
    // String country = placeMark.country;
    // String address = "${name}, ${subLocality}, ${locality}, ${administrativeArea} ${postalCode}, ${country}";


    // final String addressString = "${}, ${subLocality}, ${locality}, ${administrativeArea} ${postalCode}, ${country}";

    // var first = addresses.first;
    // print(' ${first.locality}, ${first.adminArea},${first.subLocality}, ${first.subAdminArea},${first.addressLine}, ${first.featureName},${first.thoroughfare}, ${first.subThoroughfare}');

    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
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
            // padding: const EdgeInsets.all(8.0),
            padding: EdgeInsets.symmetric(horizontal: w * 0.02,vertical: h * 0.01),
            child: Row(
              // Row + (Text+downicon)
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Order Id', style: AppStyle.textStyleRobotoMediumBlue15),
                const Spacer(),
                Text('${shipmentItem!.trackingId}', style: AppStyle.textStyleRobotoBoldBlue15),
                SizedBox(width: w * 0.02),
                shipmentItem!.shipmentStatus == PackageDeliveryStatus.Delivered
                    ? IntrinsicWidth(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: w * 0.01,vertical: h * 0.005),
                          decoration: BoxDecoration(color: cParrotOpacity, borderRadius: BorderRadius.circular(5)),
                          child: Text('Delivered',style: AppStyle.textStyleRobotoMediumParrot15),
                        ),
                      )
                    : shipmentItem!.shipmentStatus ==
                            PackageDeliveryStatus.Shipped
                        ? IntrinsicWidth(
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: w * 0.01,vertical: h * 0.005),
                              decoration: BoxDecoration(color: cYellowOpacity, borderRadius: BorderRadius.circular(5)),
                              child: Text('Shipped', style: AppStyle.textStyleRobotoMediumYellowt15),
                            ),
                          )
                        : shipmentItem!.shipmentStatus == PackageDeliveryStatus.Packed
                            ? IntrinsicWidth(
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: w * 0.01,vertical: h * 0.005),
                                  decoration: BoxDecoration(color: cYellowOpacity, borderRadius: BorderRadius.circular(5)),
                                    child: Text('Packed', style: AppStyle.textStyleRobotoMediumYellowt15)),
                              )
                            : shipmentItem!.shipmentStatus == PackageDeliveryStatus.Failed
                                ? IntrinsicWidth(
                                    child: Container(
                                      padding: EdgeInsets.symmetric(horizontal: w * 0.01,vertical: h * 0.005),
                                      decoration: BoxDecoration(color: cYellowOpacity, borderRadius: BorderRadius.circular(5)),
                                      child: Text('Failed', style: AppStyle.textStyleRobotoMediumYellowt15),
                                    ),
                                  )
                                : IntrinsicWidth(
                                    child: Container(
                                      padding: EdgeInsets.symmetric(horizontal: w * 0.01,vertical: h * 0.005),
                                      decoration: BoxDecoration(color: cRedOpacity, borderRadius: BorderRadius.circular(5)),
                                      child: Text('InProgress', style: AppStyle.textStyleRobotoMediumRed15),
                                    ),
                                  )
              ],
            ),
          ),
          Container(height: h * 0.001, color: cGreyLight),
          Container(
            // color: Colors.red[100],
            // padding: const EdgeInsets.all(8.0),
            padding: EdgeInsets.symmetric(horizontal: w * 0.02,vertical: h * 0.01),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  // color: Colors.orange[100],
                  width: w * 0.2,
                  height: h * 0.1,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child:shipmentItem!.getShipmentImage!.isEmpty?
                    const SizedBox.shrink(): Image.network(shipmentItem!.getShipmentImage![0].shipmentImage, fit: BoxFit.fill),
                  ),
                ),
                SizedBox(width: w * 0.02,),
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: w * 0.06,
                            height: h * 0.028,
                            child: SvgPicture.asset(
                              Assets.iconPeople,
                              fit: BoxFit.contain,
                              color: cBlue,
                            ),
                          ),
                          SizedBox(width: w * 0.02),
                          Text(shipmentItem!.receiverName!, style: AppStyle.textStyleRobotoMediumBlue15),
                        ],
                      ),
                      SizedBox(height: h * 0.01),
                      Row(
                        children: [
                          Container(
                            width: w * 0.06,
                            height: h * 0.028,
                            child: SvgPicture.asset(
                              Assets.iconLocationpin,
                              fit: BoxFit.contain,
                              color: cBlue,
                            ),
                          ),
                          SizedBox(width: w * 0.02),
                          Flexible(child: Text(shipmentItem!.deliveryAddress!, style: AppStyle.textStyleDarkRobotoMediumDarkGrey15)),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
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
