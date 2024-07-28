// To parse this JSON data, do
//
//     final driver = driverFromJson(jsonString);

import 'dart:convert';

Driver driverFromJson(String str) => Driver.fromJson(json.decode(str));

String driverToJson(Driver data) => json.encode(data.toJson());

class Driver {
  Driver({
    this.status,
    this.message,
    this.driverDatum,
  });

  int? status;
  String? message;
  List<DriverDatum>? driverDatum;

  factory Driver.fromJson(Map<String, dynamic> json) => Driver(
    status: json["status"],
    message: json["message"],
    driverDatum: json['data'] != null ? List<DriverDatum>.from(json["data"].map((x) => DriverDatum.fromJson(x))) : null,
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(driverDatum!.map((x) => x.toJson())),
  };
}

class DriverDatum {
  DriverDatum({
    this.id,
    this.name,
    this.username,
    this.email,
    this.emailVerifiedAt,
    this.contactNumber,
    this.verificationCode,
    this.role,
    this.gender,
    this.lastLoginDate,
    this.createdBy,
    this.address,
    this.country,
    this.state,
    this.city,
    this.postalCode,
    this.isNotificaton,
    this.licenseNumber,
    this.vehicleNumber,
    this.currentLatitude,
    this.currentLongitude,
    this.isVerified,
    this.isDrivingVerified,
    this.isCompanyFollow,
    this.accountNumber,
    this.ifscCode,
    this.branchCode,
    this.driverPhoto,
    this.createdAt,
    this.updatedAt,
    this.phoneCode,
    this.licensePhoto,
    this.vehicleName,
    this.getCompanyDriver,
  });

  int? id,role,isVerified,isDrivingVerified,isCompanyFollow;
  String? name,username,gender,email,vehicleName,currentLatitude,currentLongitude, accountNumber,ifscCode,branchCode,driverPhoto,phoneCode,contactNumber,verificationCode,address;
  dynamic emailVerifiedAt,lastLoginDate,createdBy,country,state,city,postalCode,isNotificaton,licenseNumber,vehicleNumber,licensePhoto;
  DateTime? createdAt,updatedAt;
  GetCompanyDriver? getCompanyDriver;

  factory DriverDatum.fromJson(Map<String, dynamic> json) => DriverDatum(
    id: json["id"],
    name: json["name"],
    username: json["username"],
    email: json["email"],
    emailVerifiedAt: json["email_verified_at"],
    contactNumber: json["contact_number"],
    verificationCode: json["verification_code"],
    role: json["role"],
    gender: json["gender"],
    lastLoginDate: json["last_login_date"],
    createdBy: json["created_by"],
    address: json["address"],
    country: json["country"],
    state: json["state"],
    city: json["city"],
    postalCode: json["postal_code"],
    isNotificaton: json["is_notificaton"],
    licenseNumber: json["license_number"],
    vehicleNumber: json["vehical_number"],
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
    phoneCode: json["phone_code"],
    licensePhoto: json["license_photo"],
    vehicleName: json["vehicle_name"],
    getCompanyDriver: json["get_company_driver"] == null ? null : GetCompanyDriver.fromJson(json["get_company_driver"]),
    // getCompanyDriver: GetCompanyDriver.fromJson(json["get_company_driver"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "username": username,
    "email": email,
    "email_verified_at": emailVerifiedAt,
    "contact_number": contactNumber,
    "verification_code": verificationCode,
    "role": role,
    "gender": gender,
    "last_login_date": lastLoginDate,
    "created_by": createdBy,
    "address": address,
    "country": country,
    "state": state,
    "city": city,
    "postal_code": postalCode,
    "is_notificaton": isNotificaton,
    "license_number": licenseNumber,
    "vehical_number": vehicleNumber,
    "current_latitude": currentLatitude,
    "current_longitude": currentLongitude,
    "is_verified": isVerified,
    "is_driving_verified": isDrivingVerified,
    "is_company_follow": isCompanyFollow,
    "account_number": accountNumber,
    "ifsc_code": ifscCode,
    "branch_code": branchCode,
    "driver_photo": driverPhoto,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
    "phone_code": phoneCode,
    "license_photo": licensePhoto,
    "vehicle_name": vehicleName,
    "get_company_driver": getCompanyDriver!.toJson(),
  };
}

class GetCompanyDriver {
  GetCompanyDriver({
    this.id,
    this.companyId,
    this.driverId,
    this.isAvailble,
    this.createdAt,
    this.updatedAt,
  });

  int? id,companyId,driverId,isAvailble;
  dynamic createdAt,updatedAt;

  factory GetCompanyDriver.fromJson(Map<String, dynamic> json) => GetCompanyDriver(
    id: json["id"],
    companyId: json["company_id"],
    driverId: json["driver_id"],
    isAvailble: json["is_availble"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "company_id": companyId,
    "driver_id": driverId,
    "is_availble": isAvailble,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}
