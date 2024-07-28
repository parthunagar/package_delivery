// To parse this JSON data, do
//
//     final shipmentImage = shipmentImageFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ShipmentImage shipmentImageFromJson(String str) => ShipmentImage.fromJson(json.decode(str));

String shipmentImageToJson(ShipmentImage data) => json.encode(data.toJson());

class ShipmentImage {
  ShipmentImage({
    required this.status,
    required this.message,
  });

  int status;
  String message;


  factory ShipmentImage.fromJson(Map<String, dynamic> json) => ShipmentImage(
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
  };
}

