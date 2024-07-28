// To parse this JSON data, do
//
//     final withdraw = withdrawFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Withdraw withdrawFromJson(String str) => Withdraw.fromJson(json.decode(str));

String withdrawToJson(Withdraw data) => json.encode(data.toJson());

class Withdraw {
  Withdraw({
    required this.status,
    required this.message,
    required this.data,
  });

  int status;
  String message;
  Data? data;

  factory Withdraw.fromJson(Map<String, dynamic> json) => Withdraw(
    status: json["status"] == null ? null : json["status"],
    message: json["message"] == null ? null : json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "message": message == null ? null : message,
    "data": data == null ? null : data!.toJson(),
  };
}

class Data {
  Data({
    required this.userId,
    required this.amount,
    required this.status,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  int userId;
  var amount;
  int status;
  DateTime? updatedAt;
  DateTime? createdAt;
  int id;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    userId: json["user_id"] == null ? null : json["user_id"],
    amount: json["amount"] == null ? null : json["amount"],
    status: json["status"] == null ? null : json["status"],
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    id: json["id"] == null ? null : json["id"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId == null ? null : userId,
    "amount": amount == null ? null : amount,
    "status": status == null ? null : status,
    "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
    "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
    "id": id == null ? null : id,
  };
}
