

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:developer' as logger;

class Const {


  /// SAVE PREFERENCE KEY ///
  static const prefEmail = 'email';
  static const prefPass = 'password';
  static const prefFCMToken = 'fcmToken';

  static const prefName = 'name';
  static const prefPhone = 'phone';
  static const prefPhoneCode = 'phonecode';
  static const prefAddress = 'address';
  static const prefGender = 'gender';
  static const prefRememberMe = 'rememberMe';
  static const prefUserRoleId = 'userroleid';
  static const prefUserId = 'userid';
  static const prefUserRoleName = 'userrolename';
  static const prefUserProfileImage = 'userProfileImage';
  static const prefNotificationRoutesSet = 'prefNotificationRoutesSet';


  static const prefAPIToken = 'apiToken';
  static const prefIsLoggedIn = 'isLogin';

  static const lblSelect = 'Select';
  static const lblGenderMale = 'Male';
  static const lblGenderFemale = 'Female';
  static const lblGenderOther = 'Other';
  static const lblRoleCustomer = 'Customer';
  static const lblRoleDriver = 'Driver';
  static const lblRoleCompany = 'Company';



  static const currySymbol = "₦";
  static const countries = ['NG','GH','UG','ZA','KE','SL','CM','US','CA','GB'];


  /// REGULAR EXPRESSION VALIDATION PATTERN ///
  static const emailPattern =  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  static const nameWithSpecialCharacterPattern = r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$";
  static const nameWithNumericPattern = r'[0-9]+';
  // final _amountValidator = RegExInputFormatter.withRegex('^\$|^(0|([1-9][0-9]{0,}))(\\.[0-9]{0,})?\$');

  static const cardNumber = r'[0-9]';
  static const alfaNumeric = r'^[A-Za-z]{4}\d{7}$';



  ///PAYSTACK PAYMENT ///
  static const payStackPublicKey = 'pk_test_cd96036b22d400ff7b3d855f9d2d783bbc997ec3';
  static const payStackSecretKey = 'sk_test_6a966fe01c1a3fc76fe162d1984c72ac80f6d2b9';

  ///GOOGLE MAP KEY///
  static const googleAPIKey = 'AIzaSyCDuY9UO9SqQ4MCPh8e3Uiv_gBVfUzHqSI';

  // static const googleAPIKey = 'AIzaSyAfYJsR7w2uhJP5xqEa-sukwmcn-ohCUxk';
//AIzaSyAfYJsR7w2uhJP5xqEa-sukwmcn-ohCUxk
  /// Toast for default time
  void toast(
      String? value, {
        ToastGravity? gravity,
        length = Toast.LENGTH_SHORT,
        Color? bgColor,
        Color? textColor,
        bool print = false,
      }) {
    if (value!.isEmpty) {
      logger.log(value);
    } else {
      Fluttertoast.showToast(
        msg: value.toString(),
        gravity: gravity,
        toastLength: length,
        backgroundColor: bgColor,
        textColor: textColor,
      );
      if (print) logger.log(value);
    }
  }

}


///App Roles
class UserRoles {
  static const int comapany = 3;
  static const int driver = 4;
  static const int customer = 5;
}

///Verification Image Type
class VerificationImageType {
  static const int license = 1;
  static const int vehicle = 2;
}

///Shipment Status Roles
class PackageDeliveryStatus {
  // static const int Pending = 0;
  // static const int InTransit = 1;
  // static const int Delivered = 2;
  //
  static const int InProgress = 1;
  static const int Packed = 2;
  static const int Shipped = 3;
  static const int Delivered = 4;
  static const int Failed = 5;

}

///Shipment Paymant Status
class ShipmentPaymantStatus {
  // static const int Pending = 0;
  // static const int InTransit = 1;
  // static const int Delivered = 2;
  //
  static const int paid = 1;
  static const int notPaid = 0;
}

class Gender {
  static const int male = 0;
  static const int feMale = 1;
  static const int others = 2;
}