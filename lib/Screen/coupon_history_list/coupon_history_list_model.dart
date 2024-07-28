// To parse this JSON data, do
//
//     final couponHistory = couponHistoryFromJson(jsonString);

import 'dart:convert';

CouponHistory couponHistoryFromJson(String str) => CouponHistory.fromJson(json.decode(str));

String couponHistoryToJson(CouponHistory data) => json.encode(data.toJson());

class CouponHistory {
  CouponHistory({
    this.status,
    this.message,
    this.couponHistoryData,
  });

  int? status;
  String? message;
  List<CouponHistoryDatum>? couponHistoryData;

  factory CouponHistory.fromJson(Map<String, dynamic> json) => CouponHistory(
    status: json["status"],
    message: json["message"],
    couponHistoryData: List<CouponHistoryDatum>.from(json["data"].map((x) => CouponHistoryDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(couponHistoryData!.map((x) => x.toJson())),
  };
}

class CouponHistoryDatum {
  CouponHistoryDatum({
    this.id,
    this.couponId,
    this.userId,
    this.shipmentId,
    this.applyStatus,
    this.usedAt,
    this.createdAt,
    this.updatedAt,
    this.getCouponDetail,
  });

  int? id,couponId,userId,shipmentId,applyStatus;
  DateTime? usedAt,createdAt,updatedAt;
  GetCouponDetail? getCouponDetail;

  factory CouponHistoryDatum.fromJson(Map<String, dynamic> json) => CouponHistoryDatum(
    id: json["id"],
    couponId: json["coupon_id"],
    userId: json["user_id"],
    shipmentId: json["shipment_id"],
    applyStatus: json["apply_status"],
    usedAt: DateTime.parse(json["used_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    getCouponDetail: GetCouponDetail.fromJson(json["get_coupon_detail"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "coupon_id": couponId,
    "user_id": userId,
    "shipment_id": shipmentId,
    "apply_status": applyStatus,
    "used_at": usedAt!.toIso8601String(),
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
    "get_coupon_detail": getCouponDetail!.toJson(),
  };
}

class GetCouponDetail {
  GetCouponDetail({
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

  factory GetCouponDetail.fromJson(Map<String, dynamic> json) => GetCouponDetail(
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
