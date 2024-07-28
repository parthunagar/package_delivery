
// To parse this JSON data, do
//
//     final signin = signinFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Signin signinFromJson(String str) => Signin.fromJson(json.decode(str));

String signinToJson(Signin data) => json.encode(data.toJson());

class Signin {
  Signin({
     this.status,
     this.message,
    this.signinData,
  });

  int? status;
  String? message;
  SigninData? signinData;

  factory Signin.fromJson(Map<String, dynamic> json) => Signin(
    status: json["status"],
    message: json["message"],
    // data: json["data"] != null ? SigninData.fromJson(json["data"]) : null,
      signinData: json['data'] != null ?  SigninData.fromJson(json["data"]) : null
    // signinData: json["data"] != null ? new SigninData.fromJson(json["data"]) : null
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": signinData!.toJson(),
  };
}

class SigninData {
  SigninData({
     this.id,
     this.username,
     this.isDrivingVerified,
     this.email,
     this.role,
     this.address,
     this.phoneCode,
     this.contactNumber,
     this.currentLatitude,
     this.currentLongitude,
     this.createdAt,
     this.updatedAt,
     this.verificationCode,
     this.token,
     this.getRole,
    this.gender
  });

  int? id, role, isDrivingVerified;
  String? username, email,token,gender;
  dynamic verificationCode,address,phoneCode,contactNumber,currentLatitude, currentLongitude;
  DateTime? createdAt,updatedAt;
  GetRole? getRole;

  factory SigninData.fromJson(Map<String, dynamic> json) => SigninData(
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
    verificationCode: json["verification_code"],
    phoneCode: json["phone_code"],
    contactNumber: json["contact_number"],
    token: json["token"],
    gender: json["gender"],
    //json['data'] != null ?  SigninData.fromJson(json["data"]) : null
    getRole:json['get_role'] != null ? GetRole.fromJson(json["get_role"]): null,
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
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
    "verification_code": verificationCode,
    "phone_code": phoneCode,
    "contact_number": contactNumber,
    "token": token,
    "gender":gender,
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
