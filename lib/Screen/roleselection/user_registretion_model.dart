// To parse this JSON data, do
//
//     final userRegistretion = userRegistretionFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

UserRegistretion userRegistretionFromJson(String str) => UserRegistretion.fromJson(json.decode(str));

String userRegistretionToJson(UserRegistretion data) => json.encode(data.toJson());

class UserRegistretion {
  UserRegistretion({
     this.status,
     this.message,
     this.data,
  });

  int? status;
  String? message;
  Data? data;

  //  UserRegistretion.fromJson(Map<String, dynamic> json) {
  //   status = json["status"];
  //   message = json["message"];
  //   data = json['data'] != null? new Data.fromJson(json["data"]):null;
  // }
  factory UserRegistretion.fromJson(Map<String, dynamic> json) => UserRegistretion(
    status: json["status"],
    message: json["message"],
    data: json['data'] != null? new Data.fromJson(json["data"]):null
  );
  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data!.toJson(),
  };
}

class Data {
  Data({
     this.id,
     this.username,
     this.email,
     this.role,
     this.address,
     this.currentLatitude,
     this.currentLongitude,
     this.createdAt,
     this.updatedAt,
     this.verificationCode,
     this.getRole,
     this.phoneCode,
     this.contactNumber,
  });

  int? id,role;
  String? username,email,phoneCode,contactNumber,verificationCode,address,currentLatitude,currentLongitude;
  DateTime? createdAt,updatedAt;
  GetRole? getRole;


  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    username: json["username"],
    email: json["email"],
    role: json["role"],
    address: json["address"],
    currentLatitude: json["current_latitude"],
    currentLongitude: json["current_longitude"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    verificationCode: json["verification_code"],
    phoneCode: json["phone_code"],
    contactNumber: json["contact_number"],
    getRole: GetRole.fromJson(json["get_role"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "email": email,
    "role": role,
    "address": address,
    "current_latitude": currentLatitude,
    "current_longitude": currentLongitude,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
    "verification_code": verificationCode,
    "phone_code": phoneCode,
    "contact_number": contactNumber,
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
