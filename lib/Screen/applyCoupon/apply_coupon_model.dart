// To parse this JSON data, do
//
//     final applyCoupon = applyCouponFromJson(jsonString);

import 'dart:convert';

ApplyCoupon applyCouponFromJson(String str) => ApplyCoupon.fromJson(json.decode(str));

String applyCouponToJson(ApplyCoupon data) => json.encode(data.toJson());

class ApplyCoupon {
  ApplyCoupon({
    this.status,
    this.message,
    this.applyCouponData,
  });

  int? status;
  String? message;
  ApplyCouponData? applyCouponData;

  factory ApplyCoupon.fromJson(Map<String, dynamic> json) => ApplyCoupon(
    status: json["status"],
    message: json["message"],
    applyCouponData: json['data'] != null ? ApplyCouponData.fromJson(json["data"]) : null  ,
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": applyCouponData!.toJson(),
  };
}

class ApplyCouponData {
  ApplyCouponData({
    this.id,
    this.couponTitle,
    this.couponCode,
    this.description,
    this.couponType,
    this.amount,
    this.startDate,
    this.endDate,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? couponTitle,couponCode,description,couponType,amount,status;
  DateTime? startDate,endDate,createdAt,updatedAt;

  factory ApplyCouponData.fromJson(Map<String, dynamic> json) => ApplyCouponData(
    id: json["id"],
    couponTitle: json["coupon_title"],
    couponCode: json["coupon_code"],
    description: json["description"],
    couponType: json["coupon_type"],
    amount: json["amount"],
    startDate: DateTime.parse(json["start_date"]),
    endDate: DateTime.parse(json["end_date"]),
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "coupon_title": couponTitle,
    "coupon_code": couponCode,
    "description": description,
    "coupon_type": couponType,
    "amount": amount,
    "start_date": startDate!.toIso8601String(),
    "end_date": endDate!.toIso8601String(),
    "status": status,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
  };
}
