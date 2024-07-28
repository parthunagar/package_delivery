import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:package_delivery/AppRoute/NavigationArgs.dart';
import 'package:package_delivery/AppRoute/app_route.dart';
import 'package:package_delivery/Constant/app_constant.dart';
import 'package:package_delivery/Constant/app_image.dart';
import 'package:package_delivery/Constant/appstyle.dart';
import 'package:package_delivery/Constant/colors.dart';
import 'package:package_delivery/Screen/profile/profile_controller.dart';
import 'package:package_delivery/widget/customDialog.dart';
import 'package:package_delivery/widget/custom_button.dart';
import 'package:package_delivery/widget/custom_dropdown.dart';
import 'package:package_delivery/widget/custom_new_appbar.dart';
import 'package:package_delivery/widget/custom_progress_bar.dart';
import 'package:package_delivery/widget/text_input_filed.dart';

import 'edit_profile_logic.dart';

class EditProfileWidget extends GetView<EditProfileLogic> {
   EditProfileWidget({Key? key}) : super(key: key);

  var cCode = Get.arguments[NavigationArgs.kCountryCode].toString();

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<EditProfileLogic>();
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    debugPrint('controller.countryCode!.value : ${controller.countryCode!.value}');
    debugPrint('logic.countryCode!.value : ${logic.countryCode!.value}');
    debugPrint('logic.countryCode!.value : ${cCode}');

    return Scaffold(
      backgroundColor: cDarkBlue,
      appBar: CustomNewAppBar(
        title: "Edit Profile",
        leading: Icons.arrow_back_ios_rounded,
        onTap: () {
          // Get.delete<ProfileLogic>();
          // Get.put<ProfileLogic>(ProfileLogic());
          // Get.lazyPut(() => ProfileLogic(),fenix: true);

          final authService = Get.find<ProfileLogic>();
          debugPrint('authService : $authService');
          authService.getProfileData();
          Get.back();
        },
      ),
      body: Obx(() {
        debugPrint('controller.image!.value.path : ${controller.image!.value.path.toString()}');
        return Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: w * 0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: h * 0.03),

                    (controller.userProfile!.value == 'null' ||
                        controller.userProfile!.value == '')
                        && controller.image!.value.path == ''
                        ? GestureDetector(
                      onTap: () {
                        uploadPhoto(context);
                      },
                      child: Center(
                        child: Container(
                          width: w * 0.3,
                          height: h * 0.16,
                          decoration: BoxDecoration(
                              color: cGreyDivider, shape: BoxShape.circle),
                          child: Center(
                              child: SvgPicture.asset(Assets.iconCamera)),
                        ),
                      ),
                    ) :
                    GestureDetector(
                      onTap: () {
                        uploadPhoto(context);
                      },
                      child: Center(
                        child: Container(
                          width: w * 0.3,
                          height: h * 0.16,
                          decoration: controller.image!.value.path != ""
                              ? BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: FileImage(controller.image!.value),
                                  colorFilter: ColorFilter.mode(
                                      cBlackOpacity, BlendMode.srcOver),
                                  fit: BoxFit.cover)
                          ) : controller.userProfile!.value != null ||
                              controller.userProfile!.value != ''
                              ? BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: NetworkImage(
                                      controller.userProfile!.value),
                                  colorFilter: ColorFilter.mode(
                                      cBlackOpacity, BlendMode.srcOver),
                                  fit: BoxFit.cover))
                              : BoxDecoration(
                              color: cGreyDivider, shape: BoxShape.circle),
                          child: Center(
                              child: SvgPicture.asset(Assets.iconCamera)),

                        ),
                      ),
                    ),
                    SizedBox(height: h * 0.03),
                    Container(
                      decoration: BoxDecoration(
                        color: cWhite,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: w * 0.04, vertical: h * 0.02),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: h * 0.01),
                          Text('Name', style: AppStyle
                              .textStyleDarkRobotoMediumDarkGrey15),
                          SizedBox(height: h * 0.01),
                          TextInputFindOut(
                              controller: controller.cName,
                              label: 'Name',
                              labelStyle: AppStyle.textStyleDarkRobotoMediumDarkGrey15,
                              enbleBorderColor: cWhite,
                              floatingLabelBehavior: FloatingLabelBehavior.never,
                              fillColor: cGreyDivider,
                              style: AppStyle.textStyleDarkRobotoMediumBlack15,
                              textInputType: TextInputType.emailAddress),
                          SizedBox(height: h * 0.01),
                          Text('Email', style: AppStyle
                              .textStyleDarkRobotoMediumDarkGrey15),
                          SizedBox(height: h * 0.01),
                          TextInputFindOut(
                              controller: controller.cEmail,
                              label: 'Email',
                              labelStyle: AppStyle
                                  .textStyleDarkRobotoMediumDarkGrey15,
                              enbleBorderColor: cWhite,
                              floatingLabelBehavior: FloatingLabelBehavior
                                  .never,
                              fillColor: cGreyDivider,
                              style: AppStyle.textStyleDarkRobotoMediumBlack15,
                              textInputType: TextInputType.emailAddress),
                          SizedBox(height: h * 0.01),
                          Text('Phone Number', style: AppStyle.textStyleDarkRobotoMediumDarkGrey15),
                          SizedBox(height: h * 0.01),
                          IntlPhoneField(
                            controller: controller.cPhone,
                            countries: Const.countries,
                            autovalidateMode: AutovalidateMode.disabled,
                            // initialCountryCode: controller.countryCode!.value,
                            initialCountryCode: countries.firstWhere((country) => country.dialCode == cCode.substring(1)).code,
                            // initialValue: controller.countryCode!.value,
                            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                            flagsButtonPadding: EdgeInsets.only(
                                left: w * 0.03),
                            dropdownIcon: Icon(
                                Icons.arrow_drop_down_outlined,
                                color: cDarkGrey),
                            showCountryFlag: false,
                            style: AppStyle
                                .textStyleDarkRobotoMediumBlack15,
                            dropdownTextStyle: AppStyle
                                .textStyleDarkRobotoMediumBlack15,
                            decoration: InputDecoration(
                              filled: true,
                              isDense: true,
                              labelText: 'Phone Number',
                              errorBorder: InputBorder.none,
                              fillColor: cGreyDivider,
                              counterText: '',
                              contentPadding: EdgeInsets.only(
                                  left: w * 0.04, right: w * 0.04),
                              focusedErrorBorder: InputBorder.none,
                              floatingLabelBehavior: FloatingLabelBehavior
                                  .never,
                              labelStyle: AppStyle
                                  .textStyleDarkRobotoMediumDarkGrey15,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(
                                      color: cGreyDivider, width: 2)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                  borderSide: BorderSide(
                                      color: cGreyDivider)),
                            ),
                            onChanged: (phone) {
                              debugPrint('onChanged => phone : $phone');
                              debugPrint(
                                  'onChanged => phone.completeNumber : ${phone
                                      .completeNumber}');
                              debugPrint(
                                  'onChanged => phone.countryISOCode : ${phone
                                      .countryISOCode}');
                              debugPrint(
                                  'onChanged => phone.countryCode : ${phone
                                      .countryCode}');
                              debugPrint(
                                  'onChanged => phone.number : ${phone
                                      .number}');
                              controller.countryCode!.value =
                                  phone.countryCode;
                              controller.cPhone!.text = phone.number;
                              controller.cPhone!.selection =
                                  TextSelection.collapsed(
                                      offset: controller.cPhone!.text
                                          .length);
                            },
                            onCountryChanged: (country) {
                              debugPrint(
                                  'onCountryChanged => country : $country');
                              debugPrint(
                                  'onCountryChanged => country.name : ${country
                                      .name}');
                              debugPrint(
                                  'onCountryChanged => country.flag : ${country
                                      .flag}');
                              debugPrint(
                                  'onCountryChanged => country.code : ${country
                                      .code}');
                              debugPrint(
                                  'onCountryChanged => country.dialCode : ${country
                                      .dialCode}');
                              debugPrint(
                                  'onCountryChanged => country.minLength : ${country
                                      .minLength}');
                              debugPrint(
                                  'onCountryChanged => country.maxLength : ${country
                                      .maxLength}');
                              controller.countryCode!.value =
                              '+${country.dialCode}';
                            },
                          ),

                          SizedBox(height: h * 0.01),
                          Text('Gender', style: AppStyle
                              .textStyleDarkRobotoMediumDarkGrey15),
                          SizedBox(height: h * 0.01),
                          Obx(() {
                            return CustomDropDownWidget(
                              hintText: Const.lblSelect,
                              items: controller.genderItems,
                              // validator: (val) => checkEmpty(controller.selectedHardDiskType.value,Const.hHardDiskTypeWithAsterisk),
                              showBorder: controller.showGenderBorder.value,
                              onTap: () {
                                controller.onGenderTypeTap(RxBool(true));
                              },
                              selectedValue: controller.dropdownGenderValue.value,

                              onChanged: (value) {
                                debugPrint('CustomDropDownWidget => value 1 : $value');
                                try {
                                  controller.onGenderDropDownChanged(RxString(value.toString()));
                                  debugPrint('CustomDropDownWidget => value 2 : $value');
                                }
                                catch (e) {
                                  debugPrint('CustomDropDownWidget => ERROR : $e');
                                }
                                controller.onGenderTypeTap(RxBool(false));
                              },
                            );
                          }),
                          SizedBox(height: h * 0.01),
                          Text('Address', style: AppStyle.textStyleDarkRobotoMediumDarkGrey15),
                          SizedBox(height: h * 0.01),
                          TextInputFindOut(
                              controller: controller.cAddress,
                              label: 'Address',
                              labelStyle: AppStyle.textStyleDarkRobotoMediumDarkGrey15,
                              enbleBorderColor: cWhite,
                              floatingLabelBehavior: FloatingLabelBehavior.never,
                              style: AppStyle.textStyleDarkRobotoMediumBlack15,
                              fillColor: cGreyDivider,
                              textInputType: TextInputType.emailAddress),
                          SizedBox(height: h * 0.01),
                          Text('Select Your Role', style: AppStyle.textStyleDarkRobotoMediumDarkGrey15),
                          SizedBox(height: h * 0.01),
                          Obx(() {
                            return CustomDropDownWidget(
                              hintText: Const.lblSelect,
                              items: controller.roleItems,
                              // validator: (val) => checkEmpty(controller.selectedHardDiskType.value,Const.hHardDiskTypeWithAsterisk),
                              showBorder: controller.showRoleBorder.value,
                              onTap: () {
                                controller.onRoleTypeTap(RxBool(true));
                              },
                              selectedValue: controller.dropdownRoleValue,
                              onChanged: (value) {
                                debugPrint(
                                    'CustomDropDownWidget => value : $value');
                                try {
                                  controller.onRoleDropDownChanged(
                                      RxString(value.toString()));
                                }
                                catch (e) {
                                  debugPrint(
                                      'CustomDropDownWidget => ERROR : $e');
                                }
                                controller.onRoleTypeTap(RxBool(false));
                              },
                            );
                          }),
                        ],
                      ),
                    ),
                    SizedBox(height: h * 0.15),

                  ],
                ),
              ),
            ),
            CustomButton(
              title: 'Save',
              onPressed: () async {
                RegExp numericValueNotAllow = RegExp(
                    Const.nameWithNumericPattern);
                RegExp specialCharacterNotAllow = RegExp(
                    Const.nameWithSpecialCharacterPattern);
                RegExp emailAllow = RegExp(Const.emailPattern);
                debugPrint('controller.userProfile!.value : ${controller.userProfile!.value}');
                if (controller.cName!.text.isNotEmpty
                    && controller.cEmail!.text.isNotEmpty
                    && controller.cPhone!.text.isNotEmpty
                    && controller.cAddress!.text.isNotEmpty
                    && controller.dropdownGenderValue.value != Const.lblSelect
                    && controller.dropdownRoleValue.value != Const.lblSelect
                    && (controller.userProfile!.value != "" || controller.userProfile!.value != null)
                ) {
                  controller.saveEditProfileData();
                }
                else {
                  if (controller.cName!.text.isEmpty
                      && controller.cEmail!.text.isEmpty
                      && controller.cPhone!.text.isEmpty
                      && controller.cAddress!.text.isEmpty
                      && controller.dropdownGenderValue.value == Const.lblSelect
                      && controller.dropdownRoleValue.value == Const.lblSelect
                  ) {
                    Const().toast('Please enter all details');
                  }
                  else if(controller.dropdownGenderValue.value == Const.lblSelect){
                    Const().toast('Please select gender');
                  }
                  else if (controller.image!.value.path == "") {
                    debugPrint('Please upload image == = = = =');
                    Const().toast('Please upload image');
                  }
                  else if (controller.cName!.text.isEmpty) {
                    debugPrint('Please enter the name');
                    Const().toast('Please enter the name');
                  }
                  else if (numericValueNotAllow.hasMatch(controller.cName!.text)) {
                    Const().toast('Please enter only characters in name field');
                  }
                  else if (!specialCharacterNotAllow.hasMatch(controller.cName!.text)) {
                    Const().toast("Name field Must not contain special character in last position");
                  }
                  else if (controller.cEmail!.text.isEmpty) {
                    Const().toast('Please enter the email');
                  }
                  else if (!emailAllow.hasMatch(controller.cEmail!.text)) {
                    Const().toast('Please enter valid email');
                  }
                  else if (controller.cPhone!.text.isEmpty) {
                    Const().toast('Please enter the phone number');
                  }
                  else if (controller.dropdownGenderValue.value == Const.lblSelect) {
                    Const().toast('Please select gender');
                  }
                  else if (controller.cAddress!.text.isEmpty) {
                    Const().toast('Please enter the address');
                  }
                  else if (controller.dropdownRoleValue.value == Const.lblSelect) {
                    Const().toast('Please select role');
                  }
                  else {
                    controller.saveEditProfileData();
                  }
                }
              },
            )
          ],
        );
      }),
    );
  }


  onSelection(BuildContext context, var type) async {
    XFile? image = await controller.picker.value.pickImage(source: type,
        imageQuality:60,maxHeight: 250,maxWidth: 250);
    try {
      controller.image!.value = File(image!.path);
    }
    catch (e) {
      debugPrint('_handleURLButtonPress => ERROR : $e');
    }
    Get.back();
    debugPrint(
        '_handleURLButtonPress => controller.image1.value : ${controller.image!
            .value}');
  }


  void uploadPhoto(BuildContext c) {
    dialogWithDivider(c,
        'You can upload image directly through Camera or Gallery',
        'Cancel', 'Delete', () {
          onSelection(c, ImageSource.camera);
          debugPrint(" =====> ON CLICK CAMERA <===== ");
          // Get.back();
        }, () {
          onSelection(c, ImageSource.gallery);
          debugPrint(" =====> ON CLICK GALLERY <===== ");
        });
  }
}
