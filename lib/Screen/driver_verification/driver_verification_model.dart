// To parse this JSON data, do
//
//     final driverVerification = driverVerificationFromJson(jsonString);

import 'dart:convert';

DriverVerification driverVerificationFromJson(String str) => DriverVerification.fromJson(json.decode(str));

String driverVerificationToJson(DriverVerification data) => json.encode(data.toJson());

class DriverVerification {
  DriverVerification({
    required this.status,
    required this.message,
    required this.driverVerification,
  });

  int status;
  String message;
  DriverVerificationClass driverVerification;

  factory DriverVerification.fromJson(Map<String, dynamic> json) => DriverVerification(
    status: json["status"],
    message: json["message"],
    driverVerification: DriverVerificationClass.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": driverVerification.toJson(),
  };
}

class DriverVerificationClass {
  DriverVerificationClass({
    required this.id,
    required this.username,
    required this.isDrivingVerified,
    required this.email,
    required this.role,
    required this.address,
    required this.currentLatitude,
    required this.currentLongitude,
    required this.createdAt,
    required this.updatedAt,
    required this.licensePhoto,
    required this.accountNumber,
    required this.ifscCode,
    required this.branchCode,
    required this.name,
    required this.contactNumber,
    required this.getRole,
  });

  int id, isDrivingVerified,role;
  DateTime createdAt,updatedAt;
  String username,email,licensePhoto,accountNumber,ifscCode,branchCode,name,contactNumber;
  dynamic address,currentLatitude,currentLongitude;
  GetRole getRole;

  factory DriverVerificationClass.fromJson(Map<String, dynamic> json) => DriverVerificationClass(
    id: json["id"],
    username: json["username"],
    isDrivingVerified: json["is_driving_verified"],
    email: json["email"],
    role: json["role"],
    address: json["address"],
    currentLatitude: json["current_latitude"],
    currentLongitude: json["current_longitude"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    licensePhoto: json["license_photo"],
    accountNumber: json["account_number"],
    ifscCode: json["ifsc_code"],
    branchCode: json["branch_code"],
    name: json["name"],
    contactNumber: json["contact_number"],
    getRole: GetRole.fromJson(json["get_role"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "is_driving_verified": isDrivingVerified,
    "email": email,
    "role": role,
    "address": address,
    "current_latitude": currentLatitude,
    "current_longitude": currentLongitude,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "license_photo": licensePhoto,
    "account_number": accountNumber,
    "ifsc_code": ifscCode,
    "branch_code": branchCode,
    "name": name,
    "contact_number": contactNumber,
    "get_role": getRole.toJson(),
  };
}

class GetRole {
  GetRole({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  DateTime createdAt,updatedAt;

  factory GetRole.fromJson(Map<String, dynamic> json) => GetRole(
    id: json["id"],
    name: json["name"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
