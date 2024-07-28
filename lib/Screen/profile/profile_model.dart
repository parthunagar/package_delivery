// To parse this JSON data, do
//
//     final getProfile = getProfileFromJson(jsonString);

import 'dart:convert';

GetProfile getProfileFromJson(String str) => GetProfile.fromJson(json.decode(str));

String getProfileToJson(GetProfile data) => json.encode(data.toJson());

class GetProfile {
  GetProfile({
     this.status,
     this.message,
     this.getProfileData,
  });

  int? status;
  String? message;
  GetProfileData? getProfileData;

  factory GetProfile.fromJson(Map<String, dynamic> json) => GetProfile(
    status: json["status"],
    message: json["message"],
    getProfileData: json['data'] != null ? GetProfileData.fromJson(json["data"]) : null
    // getProfileData: GetProfileData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": getProfileData!.toJson(),
  };
}

class GetProfileData {
  GetProfileData({
     this.id,
     this.name,
     this.username,
     this.email,
     this.contactNumber,
     this.address,
     this.gender,
     this.driverPhoto,
     this.role,
     this.getRole,
     this.userImage,
    this.freeDelivery,
    this.driver_total_earning
  });

  int? id,role,freeDelivery;
  String? gender,name,username,email,contactNumber,address,driverPhoto,userImage;
  GetRole? getRole;

  var driver_total_earning;

  factory GetProfileData.fromJson(Map<String, dynamic> json) => GetProfileData(
    id: json["id"]  ?? 0,
    name: json["name"] ?? '' ,
    username: json["username"]  ?? '',
    email: json["email"]  ?? '',
    freeDelivery: json["free_delivery"]  ?? 0,
    contactNumber: json["contact_number"]  ?? '',
    address: json["address"] ?? '',
    gender: json["gender"],
    driverPhoto: json["driver_photo"] ?? '',
    userImage: json["user_image"] ?? '',
    role: json["role"] ?? 6,
    driver_total_earning: json["total_earning"] ?? '0.0',
    getRole: json['get_role'] != null ? GetRole.fromJson(json["get_role"]) : null ,// GetRole.fromJson(json["get_role"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "username": username,
    "email": email,
    "free_delivery": freeDelivery,
    "contact_number": contactNumber,
    "address": address,
    "gender": gender,
    "driver_photo": driverPhoto,
    "user_image": userImage,
    "role": role,
    "total_earning": driver_total_earning,
    "get_role": getRole!.toJson(),
  };
}

class GetRole {
  GetRole({
     this.id,
     this.name,
     this.createdAt,
     this.updatedAt,
  });

  int? id;
  String? name;
  DateTime? createdAt,updatedAt;

  factory GetRole.fromJson(Map<String, dynamic> json) => GetRole(
    id: json["id"],
    name: json["name"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
  };
}
