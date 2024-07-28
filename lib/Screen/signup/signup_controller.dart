import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_delivery/Screen/signup/signup_provider.dart';

class SignupLogic extends GetxController with StateMixin<dynamic> {


  ///SIGNUP
  TextEditingController? cName = TextEditingController();
  TextEditingController? cPhone = TextEditingController();
  TextEditingController? cEmail = TextEditingController();
  TextEditingController? cPassword = TextEditingController();
  TextEditingController? cConPassword = TextEditingController();
  TextEditingController? cAddress = TextEditingController();


  RxString? countryCode = ''.obs;




  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
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
}
