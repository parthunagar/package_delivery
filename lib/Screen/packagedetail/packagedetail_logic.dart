import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:package_delivery/AppRoute/NavigationArgs.dart';
import 'package:package_delivery/AppRoute/app_route.dart';
import 'package:package_delivery/Constant/app_constant.dart';
import 'package:package_delivery/Constant/app_image.dart';
import 'package:package_delivery/Screen/packagedetail/package_size_list_model.dart';
import 'package:package_delivery/Screen/packagedetail/package_size_list_model.dart';
import 'package:package_delivery/Screen/packagedetail/package_sizelist_provider.dart';
import 'package:package_delivery/Utils/preference.dart';
import 'package:package_delivery/widget/progress_dialog_utils.dart';

class PackagedetailLogic extends GetxController {
  TextEditingController? cPackageName = TextEditingController();
  TextEditingController? cReceiverName = TextEditingController();
  RxString? countryCode = ''.obs;
  TextEditingController? cReceiverPhone = TextEditingController();
  TextEditingController? cPackageWeight = TextEditingController();
  TextEditingController? cPackageDetail = TextEditingController();
  final Rx<ImagePicker> picker = ImagePicker().obs as Rx<ImagePicker>;

  Rx<File>? image1 = File('').obs;
  LatLng? picupLatLang, destinationLatLang;
  String? deliveryType,
      modeOfTransport,
      cPickupLocationAddress,
      cDestinationLocationAddress;
  Rx<RxList<PackageSize>> packageSizeList = RxList<PackageSize>.empty().obs;
  RxBool packageSizeBorder = false.obs;
  Rx<PackageSize>? packageSizeValue  = PackageSize().obs;
List<String> images = [
  Assets.iconEnvelope,
  Assets.iconSmallBox,
  Assets.iconMediunBox,
  Assets.iconLargBox,
  Assets.iconExtraLargeBox,
];
  void onGenderDropDownChanged(var val) {
    packageSizeValue!.value = val;
    debugPrint('onGenderDropDownChanged => dropdownGenderValue.value : ${packageSizeValue!.value}');
  }

  void onpackageSizeTypeTap(RxBool val) {
    packageSizeBorder.value = val.value;
  }

  @override
  void onReady() {
    // TODO: implement onReady
    print('NavigationArgs.cPickupLocation      : ' +
        Get.arguments[NavigationArgs.cPickupLocation].toString());
    print('NavigationArgs.cDestinationLocation : ' +
        Get.arguments[NavigationArgs.cDestinationLocation].toString());
    print('NavigationArgs.cPickupLocationAddress : ' +
        Get.arguments[NavigationArgs.cPickupLocationAddress].toString());
    print('NavigationArgs.cDestinationLocationAddress : ' +
        Get.arguments[NavigationArgs.cDestinationLocationAddress].toString());
    print('NavigationArgs.cDeliveryType        : ' +
        Get.arguments[NavigationArgs.cDeliveryType].toString());
    print('NavigationArgs.cModeOfTransport     : ' +
        Get.arguments[NavigationArgs.cModeOfTransport].toString());
    picupLatLang = Get.arguments[NavigationArgs.cPickupLocation];
    cPickupLocationAddress =
        Get.arguments[NavigationArgs.cPickupLocationAddress];
    cDestinationLocationAddress =
        Get.arguments[NavigationArgs.cDestinationLocationAddress];
    destinationLatLang = Get.arguments[NavigationArgs.cDestinationLocation];
    deliveryType = Get.arguments[NavigationArgs.cDeliveryType];
    modeOfTransport = Get.arguments[NavigationArgs.cModeOfTransport];
    callSizeList();
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void callCreateShipment() {
    print('NavigationArgs.imageUpload : ' + image1!.value.path);
    print('NavigationArgs.cPackageName : ' + cPackageName!.text.toString());
    print('NavigationArgs.cReceiverName : ' + cReceiverName!.text.toString());
    print('NavigationArgs.cReceiverPhone : ' + cReceiverPhone!.text.toString());
    print('NavigationArgs.cPackageWeight : ' + cPackageWeight!.text.toString());
    print('NavigationArgs.cPackageDetail : ' + cPackageDetail!.text.toString());

    if (cPackageName!.text.isEmpty &&
        cReceiverName!.text.isEmpty &&
        cReceiverPhone!.text.isEmpty &&
        // cPackageWeight!.text.isEmpty &&
        cPackageDetail!.text.isEmpty) {
      debugPrint('Please enter the email and password');
      Const().toast('Please enter all details');
      return;
    } else if (cPackageName!.text.isEmpty) {
      debugPrint('Please enter the name');
      Const().toast('Please enter the package name.');
    } else if (cReceiverName!.text.isEmpty) {
      debugPrint('Please enter the account no.');
      Const().toast('Please enter the receiver name.');
    } else if (cReceiverPhone!.text.isEmpty) {
      debugPrint('Please enter the IFSC code');
      Const().toast('Please enter the receiver\'s phone number.');
    }
    // else if (cPackageWeight!.text.isEmpty) {
    //   debugPrint('Please enter the branch code');
    //   Const().toast('Please enter the weight of package');
    // }
    else if (cPackageDetail!.text.isEmpty) {
      debugPrint('Please enter the branch code');
      Const().toast('Please enter the detail of package');
    } else if (image1!.value.path == "") {
      debugPrint('Please Upload image');
      Const().toast('Please upload image.');
      return;
    } else {
      debugPrint('SAVE data DATA');
      Get.toNamed(AppRoutes.selectDispatcherScreen, arguments: {
        NavigationArgs.imageUpload: image1,
        NavigationArgs.cPackageName: cPackageName!.text.toString(),
        NavigationArgs.cReceiverName: cReceiverName!.text.toString(),
        NavigationArgs.cReceiverPhone: countryCode!.value + cReceiverPhone!.text.toString(),
        // NavigationArgs.cPackageWeight: cPackageWeight!.text.toString(),
        NavigationArgs.cPackageWeight: packageSizeValue!.value.id,
        NavigationArgs.cPackageDetail: cPackageDetail!.text.toString(),
        NavigationArgs.cPickupLocation: picupLatLang,
        NavigationArgs.cDestinationLocation: destinationLatLang,
        NavigationArgs.cPickupLocationAddress: cPickupLocationAddress,
        NavigationArgs.cDestinationLocationAddress: cDestinationLocationAddress,
        NavigationArgs.cDeliveryType: deliveryType,
        NavigationArgs.cPackageSize: packageSizeValue!.value.id,
        NavigationArgs.cModeOfTransport: modeOfTransport,
      });
    }
  }

  void callSizeList() async {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      ProgressDialogUtils.showProgressDialog(Get.context);
    });
    var apiToken = await Preference().read(Const.prefAPIToken);
    var userId = await Preference().readInt(Const.prefUserId);
    // debugPrint('getDriverListData => userId : $userId');

    debugPrint('getFollowersListData => apiToken : $apiToken');
    Map<String, dynamic> queryRequest = {};
    debugPrint('getFollowersListData => userId : $userId');
    Map<String, String> headers = {"authorization": "Bearer $apiToken"};
    PackageSizeListProvider()
        .callPackageSizeList(queryRequest: queryRequest, headers: headers)
        .then((getFollowedCompanyListValue) async {
      debugPrint(
          'getPackageSizeListData => getPackageSizeListValue : $getFollowedCompanyListValue');
      final getPackageSizeListData =
          PackageSizeList.fromJson(getFollowedCompanyListValue);
      if (getPackageSizeListData.status == 1) {
        packageSizeList.value.clear();
        packageSizeList.value.addAll(getPackageSizeListData.packageSize!);
        packageSizeValue!.value = packageSizeList.value[0];
      }else{
        Const().toast(getPackageSizeListData.message.toString());
        WidgetsBinding.instance?.addPostFrameCallback((_) {
          ProgressDialogUtils.hideProgressDialog();
        });
      }
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        ProgressDialogUtils.hideProgressDialog();
      });
    }, onError: (error) {
      debugPrint('getFollowersListData ERROR : ' + error.toString());
      Const().toast(error.toString());
      ProgressDialogUtils.hideProgressDialog();
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        ProgressDialogUtils.hideProgressDialog();
      });
    });
  }
}
