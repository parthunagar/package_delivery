// To parse this JSON data, do
//
//     final updateDelivery = updateDeliveryFromJson(jsonString);

import 'dart:convert';

UpdateDelivery updateDeliveryFromJson(String str) => UpdateDelivery.fromJson(json.decode(str));

String updateDeliveryToJson(UpdateDelivery data) => json.encode(data.toJson());

class UpdateDelivery {
  UpdateDelivery({
    this.status,
    this.message,
    this.updateDeliveryData,
  });

  int? status;
  String? message;
  UpdateDeliveryData? updateDeliveryData;

  factory UpdateDelivery.fromJson(Map<String, dynamic> json) => UpdateDelivery(
    status: json["status"],
    message: json["message"],
    updateDeliveryData: json["data"] == null ? null : UpdateDeliveryData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": updateDeliveryData!.toJson(),
  };
}

class UpdateDeliveryData {
  UpdateDeliveryData({
    this.id,
    this.firstName,
    this.lastName,
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
    this.isNotificaton,
    this.licenseNumber,
    this.vehicalNumber,
    this.currentLatitude,
    this.currentLongitude,
    this.accountNumber,
    this.ifscCode,
    this.branchCode,
    this.userImage,
    this.isVerified,
    this.isDrivingVerified,
    this.createdAt,
    this.updatedAt,
    this.phoneCode,
    this.licensePhoto,
    this.vehicleName,
    this.vehicleColor,
    this.freeDelivery,
    this.totalEarning,
  });

  int? id,role,isVerified,isDrivingVerified,freeDelivery;
  String? firstName,lastName,username,email,contactNumber,verificationCode,gender,currentLatitude,currentLongitude;
  String? accountNumber,ifscCode,branchCode,userImage,address,phoneCode,licensePhoto,totalEarning;
  dynamic emailVerifiedAt,lastLoginDate,createdBy,isNotificaton,licenseNumber,vehicalNumber,vehicleName,vehicleColor;
  DateTime? createdAt,updatedAt;

  factory UpdateDeliveryData.fromJson(Map<String, dynamic> json) => UpdateDeliveryData(
    id: json["id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
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
    isNotificaton: json["is_notificaton"],
    licenseNumber: json["license_number"],
    vehicalNumber: json["vehical_number"],
    currentLatitude: json["current_latitude"],
    currentLongitude: json["current_longitude"],
    accountNumber: json["account_number"],
    ifscCode: json["ifsc_code"],
    branchCode: json["branch_code"],
    userImage: json["user_image"],
    isVerified: json["is_verified"],
    isDrivingVerified: json["is_driving_verified"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    phoneCode: json["phone_code"],
    licensePhoto: json["license_photo"],
    vehicleName: json["vehicle_name"],
    vehicleColor: json["vehicle_color"],
    freeDelivery: json["free_delivery"],
    totalEarning: json["total_earning"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "first_name": firstName,
    "last_name": lastName,
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
    "is_notificaton": isNotificaton,
    "license_number": licenseNumber,
    "vehical_number": vehicalNumber,
    "current_latitude": currentLatitude,
    "current_longitude": currentLongitude,
    "account_number": accountNumber,
    "ifsc_code": ifscCode,
    "branch_code": branchCode,
    "user_image": userImage,
    "is_verified": isVerified,
    "is_driving_verified": isDrivingVerified,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
    "phone_code": phoneCode,
    "license_photo": licensePhoto,
    "vehicle_name": vehicleName,
    "vehicle_color": vehicleColor,
    "free_delivery": freeDelivery,
    "total_earning": totalEarning,
  };
}
