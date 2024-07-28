import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:package_delivery/AppRoute/app_route.dart';
import 'package:package_delivery/Constant/app_constant.dart';
import 'package:package_delivery/Constant/app_image.dart';
import 'package:package_delivery/Constant/appstyle.dart';
import 'package:package_delivery/Constant/colors.dart';
import 'package:package_delivery/widget/customDialog.dart';
import 'package:package_delivery/widget/custom_appbar.dart';
import 'package:package_delivery/widget/custom_button.dart';
import 'package:package_delivery/widget/custom_new_appbar.dart';
import 'package:package_delivery/widget/text_input_filed.dart';

import 'driver_verification_logic.dart';

class DriverVerificationWidget extends GetView<DriverVerificationLogic> {
  const DriverVerificationWidget({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final logic = Get.find<DriverVerificationLogic>();
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    print('image1 : ${controller.image1!.value}');
    return Scaffold(
      backgroundColor: cDarkBlue,
      // appBar: CustomNewAppBar(
      //   title: 'Driver Verification',
      //   leading: Icons.arrow_back_ios_rounded,
      //   // leading: Icon(Icons.arrow_back_ios_rounded),
      //   onTap: () {
      //     debugPrint('ON CLICK BACK');
      //     Get.back();
      //   },
      // ),
      appBar: CustomAppBar(
        title: 'Driver Verification',
        leading: Container(
          decoration: BoxDecoration(
            color: cBlue,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(blurRadius: getHorizontalSize(5), color: Colors.black12, spreadRadius: 1)
            ],
          ),
          height: getHorizontalSize(30),
          width: getHorizontalSize(30),
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios_rounded),
            iconSize: getFontSize(15),
            color: cWhite,
            onPressed:() {
              print("onBackPressed");
              Get.back();
            },
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          ),
        ),
      ),

      body: Obx(() {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: w * 0.04),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: h * 0.02),
                Center(child: Text('Let’s get your licence details', textAlign: TextAlign.center, style: AppStyle.textStyleRobotoMediumWhite20),),

                SizedBox(height: h * 0.02),
               controller.image1!.value.path == "" ?
                GestureDetector(
                  onTap: () {
                    uploadPhoto(context,VerificationImageType.license);
                  },
                  child: Container(
                      padding: EdgeInsets.symmetric(horizontal: w * 0.1, vertical: h * 0.03),
                      decoration: BoxDecoration(
                        border: Border.all(color: cGreyLight, width: 2.0),
                        color: cWhite,
                        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                        // boxShadow: [
                        //   BoxShadow(
                        //     color: cGreyLight,
                        //     spreadRadius: 2,
                        //     blurRadius: 7,
                        //     offset: Offset(0, 3), // changes position of shadow
                        //   ),
                        // ],
                      ),
                      child: Column(
                        children: [
                          SvgPicture.asset(Assets.iconAdd),
                          SizedBox(height: h * 0.02),
                          Text('Add Photo', style: AppStyle.textStyleRobotoBoldGrey15),
                        ],
                      )
                  ),
                ) :
                GestureDetector(
                    onTap: () {
                      uploadPhoto(context,VerificationImageType.license);
                    },
                  child: Container(
                    // padding: EdgeInsets.symmetric(horizontal: w * 0.1,vertical: h * 0.03),
                    height: h * 0.19,
                    width: w * 0.4,
                    decoration: BoxDecoration(
                      border: Border.all(color: cBackground, width: 2.0),
                      image: DecorationImage(image: FileImage(controller.image1!.value,), fit: BoxFit.fill),
                      color: cWhite,//Colors.red,
                      // cWhite,
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      // boxShadow: [
                      //   BoxShadow(
                      //     color: cWhite,
                      //     blurRadius: 3.0,
                      //     offset: const Offset(0.0, 3.0),
                      //   ),
                      // ],
                    ),
                  ),
                ),

                SizedBox(height: h * 0.03),
                Text('Add Bank Details', style: AppStyle.textStyleRobotoMediumWhite20),
                SizedBox(height: h * 0.03),
                TextInputFindOut(
                    controller: controller.cName,
                    label: 'Name',
                    textInputType: TextInputType.name),
                SizedBox(height: h * 0.03),
                TextInputFindOut(
                    controller: controller.cAccNo,
                    label: 'Account No.',
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    textInputType: TextInputType.number),
                SizedBox(height: h * 0.03),
                TextInputFindOut(
                    controller: controller.cIFSCCode,
                    label: 'BVN Code',
                    inputFormatters: <TextInputFormatter>[
                      // FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      // FilteringTextInputFormatter.allow(RegExp(r'^[A-Za-z]{4}0[A-Z0-9a-z]{6}$'),)
                      FilteringTextInputFormatter.allow(RegExp(r'[A-Z0-9a-z]'),)
                    ],
                    textInputType: TextInputType.name),
                SizedBox(height: h * 0.03),
                TextInputFindOut(
                    controller: controller.cBranchCode,
                    label: 'Branch Code',
                    inputFormatters: <TextInputFormatter>[
                      // FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      // FilteringTextInputFormatter.allow(RegExp(r'^[A-Za-z]{4}0[A-Z0-9a-z]{6}$'),)
                      FilteringTextInputFormatter.allow(RegExp(r'[A-Z0-9a-z]'),)
                    ],
                    textInputType: TextInputType.name),
                SizedBox(height: h * 0.03),
                IntlPhoneField(
                  autovalidateMode: AutovalidateMode.disabled,
                  countries: Const.countries,
                  // controller: controller.cPhone,
                  // initialValue: '12',
                  // initialValue: '9090909090',
                  // dropdownIconPosition: IconPosition.trailing,
                  // showDropdownIcon: false,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  flagsButtonPadding: EdgeInsets.only(left: w * 0.03),
                  dropdownIcon: Icon(Icons.arrow_drop_down_outlined, color: cDarkGrey),
                  showCountryFlag: false,
                  style: AppStyle.textStyleDarkRobotoMediumDarkGrey15,
                  // initialCountryCode: '+91',
                  // controller: controller.cPhone,
                  decoration: InputDecoration(
                    filled: true,
                    isDense: true,
                    labelText: 'Mobile No.',
                    errorBorder: InputBorder.none,
                    fillColor: cDarkBlue,
                    counterText: '',
                    contentPadding: EdgeInsets.only(left: w * 0.04, right: w * 0.04),
                    focusedErrorBorder: InputBorder.none,

                    labelStyle: AppStyle.textStyleDarkRobotoMediumWhite15,
                    // floatingLabelBehavior:FloatingLabelBehavior.always,
                    // alignLabelWithHint: true,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: cDarkGreyBorder, width: 2)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(color: cWhite)),
                  ),
                  onChanged: (phone) {
                    debugPrint('onChanged => phone : $phone');
                    debugPrint('onChanged => phone.completeNumber : ${phone.completeNumber}');
                    debugPrint('onChanged => phone.countryISOCode : ${phone.countryISOCode}');
                    debugPrint('onChanged => phone.countryCode : ${phone.countryCode}');
                    debugPrint('onChanged => phone.number : ${phone.number}');
                    controller.countryCode!.value = phone.countryCode;
                    controller.cMobileNo!.text = phone.number;
                  },
                  onCountryChanged: (country) {
                    debugPrint('onCountryChanged => country : $country');
                    debugPrint('onCountryChanged => country.name : ${country.name}');
                    debugPrint('onCountryChanged => country.flag : ${country.flag}');
                    debugPrint('onCountryChanged => country.code : ${country.code}');
                    debugPrint('onCountryChanged => country.dialCode : ${country.dialCode}');
                    debugPrint('onCountryChanged => country.minLength : ${country.minLength}');
                    debugPrint('onCountryChanged => country.maxLength : ${country.maxLength}');
                    controller.countryCode!.value = '+${country.dialCode}';
                  },
                ),
                SizedBox(height: h * 0.03),
                Text('Add Vehicle Details', style: AppStyle.textStyleRobotoMediumWhite20),
                SizedBox(height: h * 0.03),
                controller.image2!.value.path == "" ?
                GestureDetector(
                  onTap: () {
                    uploadPhoto(context,VerificationImageType.vehicle);
                  },
                  child: Container(
                      padding: EdgeInsets.symmetric(horizontal: w * 0.1, vertical: h * 0.03),
                      decoration: BoxDecoration(
                        border: Border.all(color: cGreyLight, width: 2.0),
                        color: cWhite,
                        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                        // boxShadow: [
                        //   BoxShadow(
                        //     color: cGreyLight,
                        //     spreadRadius: 2,
                        //     blurRadius: 7,
                        //     offset: Offset(0, 3), // changes position of shadow
                        //   ),
                        // ],
                      ),
                      child: Column(
                        children: [
                          SvgPicture.asset(Assets.iconAdd),
                          SizedBox(height: h * 0.02),
                          Text('Add Photo', style: AppStyle.textStyleRobotoBoldGrey15),
                        ],
                      )
                  ),
                ) :
                GestureDetector(
                  onTap: () {
                    uploadPhoto(context,VerificationImageType.vehicle);
                  },
                  child: Container(
                    // padding: EdgeInsets.symmetric(horizontal: w * 0.1,vertical: h * 0.03),
                    height: h * 0.19,
                    width: w * 0.4,
                    decoration: BoxDecoration(
                      border: Border.all(color: cBackground, width: 2.0),
                      image: DecorationImage(image: FileImage(controller.image2!.value,), fit: BoxFit.fill),
                      color: cWhite,//Colors.red,
                      // cWhite,
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      // boxShadow: [
                      //   BoxShadow(
                      //     color: cWhite,
                      //     blurRadius: 3.0,
                      //     offset: const Offset(0.0, 3.0),
                      //   ),
                      // ],
                    ),
                  ),
                ),

                SizedBox(height: h * 0.03),
                TextInputFindOut(
                    controller: controller.cVehicleName,
                    label: 'Vehicle Name',
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[A-Z0-9a-z]'),)
                    ],
                    textInputType: TextInputType.name),
                SizedBox(height: h * 0.03),
                TextInputFindOut(
                    controller: controller.cLicenseNumber,
                    label: 'Licence Number',
                    inputFormatters: <TextInputFormatter>[
                      // FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      // FilteringTextInputFormatter.allow(RegExp(r'^[A-Za-z]{4}0[A-Z0-9a-z]{6}$'),)
                      // FilteringTextInputFormatter.allow(RegExp(r'[A-Za-z]'),)
                      FilteringTextInputFormatter.allow(RegExp(r'[A-Z0-9a-z]'),)
                    ],
                    textInputType: TextInputType.name),
                SizedBox(height: h * 0.03),
                TextInputFindOut(
                    controller: controller.cVehicleColor,
                    label: 'Vehicle Color',
                    inputFormatters: <TextInputFormatter>[
                      // FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      // FilteringTextInputFormatter.allow(RegExp(r'^[A-Za-z]{4}0[A-Z0-9a-z]{6}$'),)
                      FilteringTextInputFormatter.allow(RegExp(r'[A-Za-z]'),)
                    ],
                    textInputType: TextInputType.name),
                SizedBox(height: h * 0.03),
                CustomButton(
                  title: 'Save',
                  onPressed: () async {
                    if (controller.cName!.text.isEmpty &&
                        controller.cAccNo!.text.isEmpty &&
                        controller.cIFSCCode!.text.isEmpty &&
                        controller.cVehicleName!.text.isEmpty &&
                        controller.cLicenseNumber!.text.isEmpty &&
                        controller.cVehicleColor!.text.isEmpty &&
                        controller.cBranchCode!.text.isEmpty &&
                        controller.cMobileNo!.text.isEmpty) {
                      debugPrint('Please enter the email and password');
                      Const().toast('Please enter all details');
                    }
                    else if (controller.image1!.value.path == "" ){
                      debugPrint('Please Upload image');
                      Const().toast('Please Upload image');
                    }
                    else if (controller.cName!.text.isEmpty) {
                      debugPrint('Please enter the name');
                      Const().toast('Please enter the name');
                    }

                    else if (controller.cAccNo!.text.isEmpty) {
                      debugPrint('Please enter the account no.');
                      Const().toast('Please enter the account no.');
                    }

                    else if (controller.cIFSCCode!.text.isEmpty) {
                      debugPrint('Please enter the IFSC code');
                      Const().toast('Please enter the IFSC code');
                    }
                    else if (controller.cBranchCode!.text.isEmpty) {
                      debugPrint('Please enter the branch code');
                      Const().toast('Please enter the branch code');
                    }
                    else if (controller.cMobileNo!.text.isEmpty) {
                      debugPrint('Please enter the mobile no.');
                      Const().toast('Please enter the mobile no.');
                    }
                    else if (controller.image2!.value.path == "" ){
                      debugPrint('Please Upload Vehicle image');
                      Const().toast('Please Upload vehicle image');
                    }
                    else if (controller.cVehicleName!.text.isEmpty) {
                      debugPrint('Please enter the Vehicle name');
                      Const().toast('Please enter the vehicle name');
                    }

                    else if (controller.cLicenseNumber!.text.isEmpty) {
                      debugPrint('Please enter the license no.');
                      Const().toast('Please enter the license no.');
                    }

                    else if (controller.cVehicleColor!.text.isEmpty) {
                      debugPrint('Please enter the Vehicle');
                      Const().toast('Please enter the vehicle color');
                    }
                    else {
                      debugPrint('SAVE LOGIN DATA');
                      controller.saveDriverVerificationData();
                    }
                  },
                )
              ],
            ),

          ),
        );
      }),
    );
  }


  _handleURLButtonPress(BuildContext context, var type, int verificationImageType) async {
    if(verificationImageType == VerificationImageType.license){
      XFile? image = await controller.picker.value.pickImage(source: type,imageQuality:60,maxHeight: 250,maxWidth: 250);
      try{
        controller.image1!.value = File(image!.path);
      }
      catch(e){
        debugPrint('_handleURLButtonPress => ERROR : $e');
      }
    }else if(verificationImageType == VerificationImageType.vehicle){
      XFile? image = await controller.picker2.value.pickImage(source: type,imageQuality:60,maxHeight: 250,maxWidth: 250);
      try{
        controller.image2!.value = File(image!.path);
      }
      catch(e){
        debugPrint('_handleURLButtonPress => ERROR : $e');
      }
    }
      Get.back();
      print('_handleURLButtonPress => controller.image1.value : ${controller.image1!.value}');
  }


  void uploadPhoto(BuildContext c, int verificationImageType) {
    dialogWithDivider(c,
      'You can upload image directly through Camera or Gallery',
      'Cancel', 'Delete', () {
        _handleURLButtonPress(c, ImageSource.camera,verificationImageType);
        debugPrint(" =====> ON CLICK CAMERA <===== ");
        // Get.back();
      }, () {
        _handleURLButtonPress(c, ImageSource.gallery,verificationImageType);
        debugPrint(" =====> ON CLICK GALLERY <===== ");
      });
  }

}
