
// To parse this JSON data, do
//
//     final driver = driverFromJson(jsonString);

import 'dart:convert';

Driver driverFromJson(String str) => Driver.fromJson(json.decode(str));

String driverToJson(Driver data) => json.encode(data.toJson());

class Driver {
  Driver({
    required this.status,
    required this.message,
    required this.driverData,
  });

  int status;
  String message;
  List<DriverDatum>? driverData;

  factory Driver.fromJson(Map<String, dynamic> json) => Driver(
    status: json["status"],
    message: json["message"],
    driverData: json['data'] != null ? List<DriverDatum>.from(json["data"].map((x) => DriverDatum.fromJson(x))) : null,
    // driverData: List<DriverDatum>.from(json["data"].map((x) => DriverDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(driverData!.map((x) => x.toJson())),
  };
}

class DriverDatum {
  DriverDatum({
    required this.id,
    required this.name,
    required this.lastname,
    required this.username,
    required this.email,
    required this.emailVerifiedAt,
    required this.contactNumber,
    required this.verificationCode,
    required this.role,
    required this.lastLoginDate,
    required this.createdBy,
    required this.address,
    required this.country,
    required this.state,
    required this.city,
    required this.postalCode,
    required this.isNotificaton,
    required this.licenseNumber,
    required this.vehicalNumber,
    required this.currentLatitude,
    required this.currentLongitude,
    required this.isVerified,
    required this.isDrivingVerified,
    required this.isCompanyFollow,
    required this.accountNumber,
    required this.ifscCode,
    required this.branchCode,
    required this.driverPhoto,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  dynamic lastname;
  String username;
  String email;
  dynamic emailVerifiedAt;
  String contactNumber;
  String verificationCode;
  int role;
  dynamic lastLoginDate;
  dynamic createdBy;
  String address;
  dynamic country;
  dynamic state;
  dynamic city;
  dynamic postalCode;
  dynamic isNotificaton;
  dynamic licenseNumber;
  dynamic vehicalNumber;
  String currentLatitude;
  String currentLongitude;
  int isVerified;
  int isDrivingVerified;
  int isCompanyFollow;
  String accountNumber;
  String ifscCode;
  String branchCode;
  String driverPhoto;
  DateTime createdAt;
  DateTime updatedAt;

  factory DriverDatum.fromJson(Map<String, dynamic> json) => DriverDatum(
    id: json["id"],
    name: json["name"],
    lastname: json["lastname"],
    username: json["username"],
    email: json["email"],
    emailVerifiedAt: json["email_verified_at"],
    contactNumber: json["contact_number"],
    verificationCode: json["verification_code"],
    role: json["role"],
    lastLoginDate: json["last_login_date"],
    createdBy: json["created_by"],
    address: json["address"],
    country: json["country"],
    state: json["state"],
    city: json["city"],
    postalCode: json["postal_code"],
    isNotificaton: json["is_notificaton"],
    licenseNumber: json["license_number"],
    vehicalNumber: json["vehical_number"],
    currentLatitude: json["current_latitude"],
    currentLongitude: json["current_longitude"],
    isVerified: json["is_verified"],
    isDrivingVerified: json["is_driving_verified"],
    isCompanyFollow: json["is_company_follow"],
    accountNumber: json["account_number"],
    ifscCode: json["ifsc_code"],
    branchCode: json["branch_code"],
    driverPhoto: json["driver_photo"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "lastname": lastname,
    "username": username,
    "email": email,
    "email_verified_at": emailVerifiedAt,
    "contact_number": contactNumber,
    "verification_code": verificationCode,
    "role": role,
    "last_login_date": lastLoginDate,
    "created_by": createdBy,
    "address": address,
    "country": country,
    "state": state,
    "city": city,
    "postal_code": postalCode,
    "is_notificaton": isNotificaton,
    "license_number": licenseNumber,
    "vehical_number": vehicalNumber,
    "current_latitude": currentLatitude,
    "current_longitude": currentLongitude,
    "is_verified": isVerified,
    "is_driving_verified": isDrivingVerified,
    "is_company_follow": isCompanyFollow,
    "account_number": accountNumber,
    "ifsc_code": ifscCode,
    "branch_code": branchCode,
    "driver_photo": driverPhoto,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
