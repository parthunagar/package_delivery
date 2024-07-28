import 'package:clippy_flutter/clippy_flutter.dart';
import 'package:custom_clippers/MessageClippers/lower_nip_message_clipper.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:package_delivery/Constant/app_constant.dart';
import 'package:package_delivery/Constant/app_image.dart';
import 'package:package_delivery/Constant/appstyle.dart';
import 'package:package_delivery/Constant/colors.dart';
import 'package:package_delivery/Screen/home/home_provider.dart';
import 'package:package_delivery/Screen/home/shipmet_list_model.dart';
import 'package:package_delivery/Utils/preference.dart';
import 'package:package_delivery/widget/clip.dart';
import 'package:package_delivery/widget/progress_dialog_utils.dart';

class TrakingLogic extends GetxController with StateMixin<dynamic> {
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
  Rx<LatLng> pinDestinationPosition = const LatLng(0.0, 0.0).obs;
  Rx<LatLng> pinPickupPosition = const LatLng(0.0, 0.0).obs;
  Rx<CustomInfoWindowController> customInfoWindowController  =  CustomInfoWindowController().obs;

  @override
  void onInit() async {
    // TODO: implement onInit
    userId = await Preference().readInt(Const.prefUserId);
    userToken = await Preference().read(Const.prefAPIToken);
    setCustomMapPin();
    getCurrantLocation();
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
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  callTrackingList({String? trackId}) async {
    if( customInfoWindowController.value.hideInfoWindow != null){
      customInfoWindowController.value.hideInfoWindow!();
    }

    ProgressDialogUtils.showProgressDialog(Get.context);
    userId = await Preference().readInt(Const.prefUserId);
    userToken = await Preference().read(Const.prefAPIToken);
    debugPrint('callTrackingList => userId 1111111: $userId');

    Map<String, dynamic> queryRequest = {
      'tracking_id': trackId,
      'user_id': userId,
    };
    debugPrint('callTrackingList => queryRequest : $queryRequest');
    Map<String, String> headers = {"authorization": "Bearer $userToken"};
    //   // Get.toNamed(AppRoutes.driverVerification);
    HomeProvider()
        .callShowShipment(queryRequest: queryRequest, headers: headers)
        .then((shipmentList)  {
      debugPrint('callShipmentList 112: ' + shipmentList.toString());
      shipmentItemList.value.clear();
      if(shipmentList['status']!=0 && trackId != null){
        print('trackId callShipmentList : $trackId');
        final shipmentListData = ShipmentList.fromJson(shipmentList);
        shipmentItemList.value.addAll(shipmentListData.data!.shipmentlist!);
      }

      if (shipmentItemList.value.isEmpty) {
        allMarkers.clear();
        isShipmentItemLoad.value = true;
      } else {
        isShipmentItemLoad.value = false;
        print('shipmentItemList.value.length : '+ shipmentItemList.value.length.toString());
        shipment item = shipmentItemList.value[0];
          pinDestinationPosition.value = LatLng(
              double.parse(item.destinationLatitude!),
              double.parse(item.destinationLongitude!));
          pinPickupPosition.value = LatLng(double.parse(item.pickupLatitude!),
              double.parse(item.pickupLongitude!));

          // destinationMarker.value = Marker(
          //     markerId: const MarkerId('Destination'),
          //     position: pinDestinationPosition.value,
          //     icon: pinDestinationIcon);
         destinationMarker.value = const Marker(markerId: MarkerId('Destination'));
         pickupMarker.value = const Marker(markerId: MarkerId('Pickup'));
          destinationMarker.value = Marker(
            markerId: const MarkerId("Destination"), //unique
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
                                item.trackingId!,
                                style: AppStyle.textStyleRobotoMediumBlue12,
                              ),
                              Text(
                                item.shipmentStatus == PackageDeliveryStatus.InProgress ? 'InProgress'
                                    :item.shipmentStatus == PackageDeliveryStatus.Shipped?'Shipped'
                                    :item.shipmentStatus == PackageDeliveryStatus.Packed?'Packed'
                                    :item.shipmentStatus == PackageDeliveryStatus.Failed?'Failed'
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
          update();
          mGoogleMapController.animateCamera(
              CameraUpdate.newLatLngZoom(pinDestinationPosition.value, 14));
        cTrackId!.clear();
        print('shipmentItemList : ' + destinationMarker.value.toString());
        print('shipmentItemList : ' + pickupMarker.value.toString());

      }
      change(shipmentList, status: RxStatus.success());
      // Const().toast(shipmentListData.message);
      ProgressDialogUtils.hideProgressDialog();
      // Get.offAllNamed(AppRoutes.signInScreen);
    }, onError: (error) {
      debugPrint('registerApi 112: ' + error.toString());
      // Const().toast(error['message']);
      Const().toast(error.toString());
      ProgressDialogUtils.hideProgressDialog();
      change(null, status: RxStatus.error(error.toString()));
    });
  }


}
