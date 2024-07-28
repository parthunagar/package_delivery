import 'dart:async';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:package_delivery/AppRoute/NavigationArgs.dart';
import 'package:package_delivery/AppRoute/app_route.dart';
import 'package:package_delivery/Constant/app_constant.dart';
import 'package:package_delivery/Screen/basicdetail/basicdetail_provider.dart';
import 'package:package_delivery/widget/progress_dialog_utils.dart';

class BasicDetailsLogic extends GetxController with StateMixin<dynamic> {
  TextEditingController? cPickupLocation = TextEditingController();
  TextEditingController? cDestination = TextEditingController();
  RxBool? showDeliveryTypeItems = false.obs;
  RxBool? showTransportItems = false.obs;

  RxList<String> itemsDeliveryType = ['Fast Delivery','Standard Delivery'].obs;
  RxList<String> itemsModeOfTransportType = ['Land'].obs;
  RxString dropdownDeliveryTypeValue = 'Fast Delivery'.obs;
  RxString dropdownModeOfTransportValue = 'Land'.obs;

  Rx<CameraPosition> kGooglePlex =
      const CameraPosition(target: LatLng(0.0, 0.0)).obs;
  var latLang = LatLng(0.0, 0.0).obs;
  late GoogleMapController mGoogleMapController;

  @override
  void onInit() {
    // TODO: implement onInit
    getCurrantLocation();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    mGoogleMapController.dispose();
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
    mGoogleMapController
        .animateCamera(CameraUpdate.newLatLngZoom(latLang.value, 14));
  }

  void callCreateShipment() async {
    debugPrint('dropdownDeliveryTypeValue.value : ${dropdownDeliveryTypeValue.value}');
    debugPrint('dropdownModeOfTransportValue.value : ${dropdownModeOfTransportValue.value}');
    // print('NavigationArgs.imageUpload : ' +  image1!.value.path);
    // print('NavigationArgs.cPackageName : '  +   cPackageName!.text.toString());
    // print('NavigationArgs.cReceiverName : ' +  cReceiverName!.text.toString());
    // print('NavigationArgs.cReceiverPhone : '+ cReceiverPhone!.text.toString());
    // print('NavigationArgs.cPackageWeight : '+ cPackageWeight!.text.toString());
    // print('NavigationArgs.cPackageDetail : '+ cPackageDetail!.text.toString());
    // ProgressDialogUtils.showProgressDialog(Get.context);
    if (cPickupLocation!.text.isEmpty && cDestination!.text.isEmpty) {
      debugPrint('Please enter the email and password');
      Const().toast('Please enter all details');
      // ProgressDialogUtils.hideProgressDialog();
      return;
    } else if (cPickupLocation!.text.isEmpty) {
      debugPrint('Please enter the name');
      Const().toast('Please enter the pickup location.');
      // ProgressDialogUtils.hideProgressDialog();
      return;
    } else if (cDestination!.text.isEmpty) {
      debugPrint('Please enter the account no.');
      Const().toast('Please enter the receiver Destination.');
      // ProgressDialogUtils.hideProgressDialog();
      return;
    } else {

      LatLng? picupLatLang = await BasicDetailProvider().getLatLongFromAddress(cPickupLocation!.text);
      debugPrint('picupLatLang : $picupLatLang');
      LatLng? destinationLatLang = await BasicDetailProvider().getLatLongFromAddress(cDestination!.text);
      debugPrint('destinationLatLang : $destinationLatLang');


      // LatLng picupLatLang =  BasicDetailProvider().getLatLongFromAddress(cPickupLocation!.text);
      // debugPrint('picupLatLang : $picupLatLang');
      // LatLng destinationLatLang =  BasicDetailProvider().getLatLongFromAddress(cDestination!.text);
      // debugPrint('destinationLatLang : $destinationLatLang');
      if (picupLatLang == null) {
        Const().toast('Please enter the pickup location properly.');
        // ProgressDialogUtils.hideProgressDialog();
      } else if (destinationLatLang == null) {
        Const().toast('Please enter the destination location properly');
        // ProgressDialogUtils.hideProgressDialog();
      } else {
        print('picupLatLang : ' + picupLatLang.latitude.toString() + ' ; ' + picupLatLang.longitude.toString());
        print('destinationLatLang : ' + destinationLatLang.latitude.toString() + ' ; ' + destinationLatLang.longitude.toString());

        debugPrint('SAVE data DATA');
        // ProgressDialogUtils.hideProgressDialog();
        Get.toNamed(AppRoutes.packageDetailScreen, arguments: {
          NavigationArgs.cPickupLocation :   picupLatLang,
          NavigationArgs.cDestinationLocation :  destinationLatLang,
          NavigationArgs.cPickupLocationAddress :   cPickupLocation!.text,
          NavigationArgs.cDestinationLocationAddress :  cDestination!.text,
          NavigationArgs.cDeliveryType: dropdownDeliveryTypeValue.value,
          NavigationArgs.cModeOfTransport: dropdownModeOfTransportValue.value,
        });
      }
    }
  }
}
