// To parse this JSON data, do
//
//     final coupon = couponFromJson(jsonString);

import 'dart:convert';

Coupon couponFromJson(String str) => Coupon.fromJson(json.decode(str));

String couponToJson(Coupon data) => json.encode(data.toJson());

class Coupon {
  Coupon({
    this.status,
    this.message,
    this.couponList,
  });

  int? status;
  String? message;
  List<CouponList>? couponList;

  factory Coupon.fromJson(Map<String, dynamic> json) => Coupon(
    status: json["status"],
    message: json["message"],
    couponList: json['data'] != null ? List<CouponList>.from(json["data"].map((x) => CouponList.fromJson(x))) : null
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(couponList!.map((x) => x.toJson())),
  };
}

class CouponList {
  CouponList({
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
    this.couponStatus,
  });

  int? id,status;
  String? couponTitle,couponCode,description,couponType,amount,couponStatus;
  DateTime? startDate,endDate,createdAt,updatedAt;


  factory CouponList.fromJson(Map<String, dynamic> json) => CouponList(
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
    couponStatus: json["coupon_status"],
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
    "coupon_status": couponStatus,
  };
}
