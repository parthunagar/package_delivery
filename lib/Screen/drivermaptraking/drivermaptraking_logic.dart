import 'package:clippy_flutter/clippy_flutter.dart';
import 'package:custom_clippers/MessageClippers/lower_nip_message_clipper.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:package_delivery/AppRoute/NavigationArgs.dart';
import 'package:package_delivery/Constant/app_constant.dart';
import 'package:package_delivery/Constant/app_image.dart';
import 'package:package_delivery/Constant/appstyle.dart';
import 'package:package_delivery/Constant/colors.dart';
import 'package:package_delivery/Screen/home/home_provider.dart';
import 'package:package_delivery/Screen/home/shipmet_list_model.dart';
import 'package:package_delivery/Screen/shipmentsummary/shipmentsummary_model.dart';
import 'package:package_delivery/Screen/shipmentsummary/shipmentsummary_provider.dart';
import 'package:package_delivery/Utils/preference.dart';
import 'package:package_delivery/widget/clip.dart';
import 'package:package_delivery/widget/progress_dialog_utils.dart';


class DrivermaptrakingLogic extends GetxController with StateMixin<dynamic>{
  Rx<CameraPosition> kGooglePlex =
      const CameraPosition(target: LatLng(0.0, 0.0)).obs;
  var latLang = LatLng(0.0, 0.0).obs;
  late GoogleMapController mGoogleMapController;
  TextEditingController? cTrackId = TextEditingController();
  Rx<RxList<shipment>> shipmentItemList = RxList<shipment>.empty().obs;
  var userId, userToken;
  RxBool isShipmentItemLoad = false.obs;
  late BitmapDescriptor pinDestinationIcon;
  late BitmapDescriptor pinPickupIcon;
  Rx<Marker> destinationMarker = const Marker(markerId: MarkerId('Destination')).obs;
  Rx<Marker> pickupMarker = const Marker(markerId: MarkerId('Destination')).obs;
  RxList<Marker> allMarkers = <Marker>[].obs;
  RxList<Polyline> allPolylines = <Polyline>[].obs;
  Rx<LatLng> pinDestinationPosition = const LatLng(0.0, 0.0).obs;
  Rx<LatLng> pinPickupPosition = const LatLng(0.0, 0.0).obs;
  Rx<CustomInfoWindowController> customInfoWindowController  =  CustomInfoWindowController().obs;
  Rx<Datum> shipmentItem = Datum().obs;
String? trackingId;
  Rx<RxList<Datum>> shipmentSummaryList = RxList<Datum>.empty().obs;
  RxBool isShipmentSummaryDataLoad = false.obs;
  PolylinePoints polylinePoints = PolylinePoints();
  @override
  void onInit() async{
    // TODO: implement onInit
    userId = await Preference().readInt(Const.prefUserId);
    userToken = await Preference().read(Const.prefAPIToken);

    super.onInit();
  }
  void setCustomMapPin() async {
    pinDestinationIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(devicePixelRatio: 2, size: Size(60.0, 60.0)),
        Assets.iconDestinationMarker);
    pinPickupIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2, size: Size(60.0, 60.0)),
        Assets.iconPickupMarker);
  }
  void getCurrantLocation() async {
    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;
    print('_locationData : ');
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    print('_locationData : ');
    _locationData = await location.getLocation();
    print('_locationData : ' +
        _locationData.latitude!.toString() +
        ' : ' +
        _locationData.longitude!.toString());
    kGooglePlex.value = CameraPosition(
      target: LatLng(_locationData.latitude!, _locationData.longitude!),
      zoom: 14.4746,
    );
    latLang.value = LatLng(_locationData.latitude!, _locationData.longitude!);
    print('controller.latLang.value :' +
        latLang.value.latitude.toString() +
        ' : ' +
        latLang.value.latitude.toString());


  }
  @override
  void onReady() {
    // TODO: implement onReady
    print('trackingId      : ' + Get.arguments[NavigationArgs.dShipmentItem].toString());
    trackingId = Get.arguments[NavigationArgs.dShipmentItem].toString();
    print('trackingId : '+trackingId!);
    setCustomMapPin();
    getCurrantLocation();
    getShipmentSummaryData(trackingId);
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  Future<ShipmentSummary?> getShipmentSummaryData(var shipmentId) async {
    customInfoWindowController.value.hideInfoWindow!();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      ProgressDialogUtils.showProgressDialog(Get.context);
    });
    Map<String, dynamic> queryRequest = {'user_id': userId, 'shipment_id': shipmentId};
    Map<String, String> headers = {"authorization": "Bearer $userToken"};
    print('queryRequest : $queryRequest');
    print('queryRequest : $headers');
    ShipmentSummaryProvider().callShipmentSummaryList(queryRequest: queryRequest, headers: headers).then((shipmentSummaryValue) {
      debugPrint('shipmentSummaryValue : $shipmentSummaryValue');
      final shipmentSummarys = ShipmentSummary.fromJson(shipmentSummaryValue);
      debugPrint('shipmentSummarys : $shipmentSummarys');
      shipmentSummaryList.value.clear();
      shipmentSummaryList.value.addAll(shipmentSummarys.datum!);
      if (shipmentSummaryList.value.isEmpty) {
        isShipmentSummaryDataLoad.value = false;
      } else {
        shipmentItem.value = shipmentSummaryList.value[0];
        pinDestinationPosition.value = LatLng(
            double.parse(shipmentItem.value.destinationLatitude!),
            double.parse(shipmentItem.value.destinationLongitude!));
        pinPickupPosition.value = LatLng(double.parse(shipmentItem.value.pickupLatitude!),
            double.parse(shipmentItem.value.pickupLongitude!));



        // destinationMarker.value = Marker(
        //     markerId: const MarkerId('Destination'),
        //     position: pinDestinationPosition.value,
        //     icon: pinDestinationIcon);
        destinationMarker.value = Marker(
          markerId: const MarkerId("marker_id"), //unique
          position: pinDestinationPosition.value,
          icon: pinDestinationIcon,
          onTap: () {
            print(' MarkerId("marker_id")');
            var h = MediaQuery
                .of(Get.context!)
                .size
                .height;
            var w = MediaQuery
                .of(Get.context!)
                .size
                .width;
            customInfoWindowController.value.addInfoWindow!(
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: Offset(3, 0), // changes position of shadow
                    ),
                  ],
                ),
                margin: EdgeInsets.only(left: w*0.38),
                child:///Lower Nip Message Clipper Receiver Side
                ClipPath(
                  clipper: LowerNipMessageClipper(MessageType.RECEIVE,bubbleRadius: 4),
                  child: Container(
                    color: cWhite,
                    padding: const EdgeInsets.only(left: 14,right: 8,top: 6,bottom: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children:  [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Order id ",
                              style: AppStyle.textStyleDarkRobotoRegularBlack12,
                            ),
                            Text(
                              "Status ",
                              style: AppStyle.textStyleDarkRobotoRegularBlack12,
                            ),

                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              shipmentItem.value.trackingId!,
                              style: AppStyle.textStyleRobotoMediumBlue12,
                            ),
                            Text(
                              shipmentItem.value.shipmentStatus == PackageDeliveryStatus.InProgress ? 'InProgress'
                                  :shipmentItem.value.shipmentStatus == PackageDeliveryStatus.Shipped?'Shipped'
                                  :shipmentItem.value.shipmentStatus == PackageDeliveryStatus.Packed?'Packed'
                                  :shipmentItem.value.shipmentStatus == PackageDeliveryStatus.Failed?'Failed'
                                  :'Delivered',
                              style: AppStyle.textStyleRobotoMediumYellow12,
                            ),
                          ],
                        )
                      ],
                    ),
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
              ), pinDestinationPosition.value,
            );
          },
        );
        pickupMarker.value=Marker(
            markerId: const MarkerId('Pickup'),
            position: pinPickupPosition.value,
            icon: pinPickupIcon);
        allMarkers.clear();
        allMarkers.add(destinationMarker.value);
        allMarkers.add(pickupMarker.value);
        setPolylines(pinPickupPosition,pinDestinationPosition);
        mGoogleMapController.animateCamera(
            CameraUpdate.newLatLngZoom(pinPickupPosition.value, 14));
        update();
        isShipmentSummaryDataLoad.value = true;
      }
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        ProgressDialogUtils.hideProgressDialog();
      });
    }, onError: (error) {
      debugPrint('getShipmentSummaryData ERROR : ' + error.toString());
      Const().toast(error);
      ProgressDialogUtils.hideProgressDialog();
      change(null, status: RxStatus.error(error.toString()));
    });
  }

  setPolylines(Rx<LatLng> pinPickupPosition, Rx<LatLng> pinDestinationPosition) async {
    List<LatLng> polylineCoordinates = [];
    PointLatLng origin = PointLatLng(pinPickupPosition.value.latitude,pinPickupPosition.value.longitude);
    PointLatLng destination = PointLatLng(pinDestinationPosition.value.latitude,pinDestinationPosition.value.longitude);
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        Const.googleAPIKey,
        origin,
        destination);
    print('result.points  '+ result.status.toString());
    print('result.points  '+ result.errorMessage.toString());
    print('result.points  '+ result.points.toString());
    if(result.points.isNotEmpty){
      // loop through all PointLatLng points and convert them
      // to a list of LatLng, required by the Polyline
      for (var point in result.points) {
        polylineCoordinates.add(
            LatLng(point.latitude, point.longitude));
      }
    }
    Polyline polyline = Polyline(
        width: 5,
        polylineId: PolylineId('Polly'),
        color: Color.fromARGB(255, 40, 122, 198),
        points: polylineCoordinates
    );
    allPolylines.add(polyline);

  }
}
