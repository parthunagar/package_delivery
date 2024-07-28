// To parse this JSON data, do
//
//     final freeDelivery = freeDeliveryFromJson(jsonString);

import 'dart:convert';

FreeDelivery freeDeliveryFromJson(String str) => FreeDelivery.fromJson(json.decode(str));

String freeDeliveryToJson(FreeDelivery data) => json.encode(data.toJson());

class FreeDelivery {
  FreeDelivery({
    this.status,
    this.message,
    this.freeDeliveryData,
  });

  int? status;
  String? message;
  FreeDeliveryData? freeDeliveryData;

  factory FreeDelivery.fromJson(Map<String, dynamic> json) => FreeDelivery(
    status: json["status"],
    message: json["message"],
    freeDeliveryData: json["data"] == null ? null : FreeDeliveryData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": freeDeliveryData!.toJson(),
  };
}

class FreeDeliveryData {
  FreeDeliveryData({
    this.freeDelivery,
  });

  int? freeDelivery;

  factory FreeDeliveryData.fromJson(Map<String, dynamic> json) => FreeDeliveryData(
    freeDelivery: json["free_delivery"],
  );

  Map<String, dynamic> toJson() => {
    "free_delivery": freeDelivery,
  };
}
