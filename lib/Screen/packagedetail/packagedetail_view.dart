import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:package_delivery/AppRoute/NavigationArgs.dart';
import 'package:package_delivery/AppRoute/app_route.dart';
import 'package:package_delivery/Constant/app_constant.dart';
import 'package:package_delivery/Constant/app_image.dart';
import 'package:package_delivery/Constant/appstyle.dart';
import 'package:package_delivery/Constant/colors.dart';
import 'package:package_delivery/widget/customDialog.dart';
import 'package:package_delivery/widget/custom_appbar.dart';
import 'package:package_delivery/widget/custom_button.dart';
import 'package:package_delivery/widget/custom_dropdown.dart';
import 'package:package_delivery/widget/custom_dropdown_size.dart';
import 'package:package_delivery/widget/custom_new_appbar.dart';
import 'package:package_delivery/widget/text_input_filed_serch.dart';

import 'packagedetail_logic.dart';

class PackagedetailWidget extends GetView<PackagedetailLogic> {
  const PackagedetailWidget({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final logic = Get.find<PackagedetailLogic>();
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: cDarkBlue,
      appBar: CustomAppBar(
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Container(
            width: w / 14,
            height: w / 14,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: cBlue, // Colors.red,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                    blurRadius: getHorizontalSize(5),
                    color: Colors.black12,
                    spreadRadius: 1)
              ],
            ),
            child: Icon(Icons.arrow_back_ios_rounded,
                size: getFontSize(15), color: cWhite),
          ),
        ),
        title: 'Package Details',
        titleStyle: AppStyle.textStyleRobotoBoldWhite25,
        action: [],
      ),
      body: Obx(() {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(w * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('What are you sending?',
                    textAlign: TextAlign.center,
                    style: AppStyle.textStyleDarkRobotoMediumWhite15),
                SizedBox(height: h * 0.01),
                Container(
                  decoration: const BoxDecoration(
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10.0,
                          offset: Offset(0.0, 0.75))
                    ],
                  ),
                  child: TextInputFindOutSerch(
                      controller: controller.cPackageName,
                      label: 'eg "Box of Shoes"',
                      textInputType: TextInputType.text),
                ),
                SizedBox(height: h * 0.03),
                Text('Name of Receiver',
                    textAlign: TextAlign.center,
                    style: AppStyle.textStyleDarkRobotoMediumWhite15),
                SizedBox(height: h * 0.01),
                Container(
                  decoration: const BoxDecoration(
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10.0,
                          offset: Offset(0.0, 0.75))
                    ],
                  ),
                  child: TextInputFindOutSerch(
                      controller: controller.cReceiverName,
                      label: 'Enter Receiver Name',
                      textInputType: TextInputType.text),
                ),
                SizedBox(height: h * 0.03),
                Text('Receiver’s Phone Number',
                    textAlign: TextAlign.center,
                    style: AppStyle.textStyleDarkRobotoMediumWhite15),
                SizedBox(height: h * 0.01),
                Container(
                  decoration: const BoxDecoration(
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10.0,
                          offset: Offset(0.0, 0.75))
                    ],
                  ),
                  child: IntlPhoneField(
                    autovalidateMode: AutovalidateMode.disabled,
                    countries: Const.countries,
                    // controller: controller.cPhone,
                    // initialValue: '12',
                    // initialValue: '9090909090',
                    // dropdownIconPosition: IconPosition.trailing,
                    // showDropdownIcon: false,
                    flagsButtonPadding: EdgeInsets.only(left: w * 0.03),
                    dropdownIcon: Icon(Icons.arrow_drop_down_outlined, color: cBlack),
                    showCountryFlag: false,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    dropdownTextStyle:  AppStyle.textStyleDarkRobotoMediumBlack15,

                    // initialCountryCode: '+91',
                    // controller: controller.cPhone,
                    style: AppStyle.textStyleRobotoMediumBlack15,

                    decoration: InputDecoration(
                      // prefixStyle:  AppStyle.textStyleDarkRobotoMediumDarkGrey15,
                      // hintStyle:  AppStyle.textStyleDarkRobotoMediumDarkGrey15,
                      // helperStyle:  AppStyle.textStyleDarkRobotoMediumDarkGrey15,

                      filled: true,
                      isDense: true,
                      // labelText: 'Phone Number',
                      errorBorder: InputBorder.none,
                      fillColor: cWhite,
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
                      controller.cReceiverPhone!.text = phone.number;
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
                ),
                SizedBox(height: h * 0.03),
                Text('Package Size',
                    textAlign: TextAlign.center,
                    style: AppStyle.textStyleDarkRobotoMediumWhite15),
                SizedBox(height: h * 0.01),
                Obx(() {
                  return CustomDropDownSizeWidget(
                    hintText: Const.lblSelect,
                    items: controller.packageSizeList,
                    images: controller.images,
                    // validator: (val) => checkEmpty(controller.selectedHardDiskType.value,Const.hHardDiskTypeWithAsterisk),
                    showBorder: false,
                    onTap: () {
                      // controller.onpackageSizeTypeTap(RxBool(false));
                    },
                    selectedValue: controller.packageSizeValue!.value,

                    onChanged: (value) {
                      debugPrint('CustomDropDownWidget => value 1 : $value');
                      try {
                        controller.onGenderDropDownChanged(value);
                        debugPrint('CustomDropDownWidget => value 2 : $value');
                      }
                      catch (e) {
                        debugPrint('CustomDropDownWidget => ERROR : $e');
                      }
                      // controller.onpackageSizeTypeTap(RxBool(true));
                    },
                  );
                }),
                // Container(
                //   decoration: const BoxDecoration(
                //     boxShadow: <BoxShadow>[
                //       BoxShadow(
                //           color: Colors.black26,
                //           blurRadius: 10.0,
                //           offset: Offset(0.0, 0.75))
                //     ],
                //   ),
                //   child: TextInputFindOutSerch(
                //       controller: controller.cPackageWeight,
                //       label: 'Estimated package weight',
                //       inputFormatters: [
                //         // FilteringTextInputFormatter.digitsOnly
                //         FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))
                //
                //       ],
                //       textInputType: TextInputType.number),
                // ),
                SizedBox(height: h * 0.03),
                Text('Additional Details',
                    textAlign: TextAlign.center,
                    style: AppStyle.textStyleDarkRobotoMediumWhite15),
                SizedBox(height: h * 0.01),
                Container(
                  decoration: const BoxDecoration(
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10.0,
                          offset: Offset(0.0, 0.75))
                    ],
                  ),
                  child: TextInputFindOutSerch(
                    controller: controller.cPackageDetail,
                    maxLines: 7,
                      label: 'Include any other information/instructions about your package',
                      textInputType: TextInputType.text),
                ),
                SizedBox(height: h * 0.03),
                Text('Add Photos Of the Package',
                    textAlign: TextAlign.center,
                    style: AppStyle.textStyleDarkRobotoMediumWhite15),
                SizedBox(height: h * 0.01),
                controller.image1!.value.path == ""
                    ? GestureDetector(
                        onTap: () {
                          uploadPhoto(context);
                        },
                        child: Container(
                            height: h * 0.14,
                            width: w * 0.27,
                            decoration: BoxDecoration(
                              border: Border.all(color: cGreyLight, width: 2.0),
                              color: cWhite,
                              borderRadius:
                              const BorderRadius.all(Radius.circular(10.0)),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                SvgPicture.asset(Assets.iconAdd),
                                SizedBox(height: h * 0.01),
                                Text('Add Photo', style: AppStyle.textStyleRobotoBold15),
                              ],
                            )),
                      )
                    : GestureDetector(
                        onTap: () {
                          uploadPhoto(context);
                        },
                        child: Container(
                          height: h * 0.14,
                          width: w * 0.27,
                          decoration: BoxDecoration(
                            border: Border.all(color: cBackground, width: 2.0),
                            image: DecorationImage(image: FileImage(controller.image1!.value), fit: BoxFit.fill),
                            color: cWhite,
                            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                          ),
                        ),
                      ),
                CustomButton(
                  title: 'Continue to Select Dispatcher',
                  padding: EdgeInsets.symmetric(
                      horizontal: w * 0.04, vertical: h * 0.02),
                  onPressed: (){

                    controller.callCreateShipment();
                  } ,
                )
              ],
            ),
          ),
        );
      }),
    );
  }

  void uploadPhoto(BuildContext c) {
    dialogWithDivider(
        c,
        'You can upload image directly through Camera or Gallery',
        'Cancel',
        'Delete', () {
      _handleURLButtonPress(c, ImageSource.camera);
      debugPrint(" =====> ON CLICK CAMERA <===== ");
      // Get.back();
    }, () {
      _handleURLButtonPress(c, ImageSource.gallery);
      debugPrint(" =====> ON CLICK GALLERY <===== ");
    });
  }

  _handleURLButtonPress(BuildContext context, var type) async {
    XFile? image = await controller.picker.value.pickImage(source: type,imageQuality:60,maxHeight: 250,maxWidth: 250);
    try {
      controller.image1!.value = File(image!.path);
    } catch (e) {
      debugPrint('_handleURLButtonPress => ERROR : $e');
    }
    Get.back();
    print(
        '_handleURLButtonPress => controller.image1.value : ${controller.image1!.value}');
  }
}
