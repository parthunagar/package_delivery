// To parse this JSON data, do
//
//     final shipmentStatus = shipmentStatusFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ShipmentStatus shipmentStatusFromJson(String str) => ShipmentStatus.fromJson(json.decode(str));

String shipmentStatusToJson(ShipmentStatus data) => json.encode(data.toJson());

class ShipmentStatus {
  ShipmentStatus({
    required this.status,
    required this.message,
    required this.data,
  });

  int status;
  String message;
  Data? data;

  factory ShipmentStatus.fromJson(Map<String, dynamic> json) => ShipmentStatus(
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
    required this.shipmentStatus,
  });

  int shipmentStatus;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    shipmentStatus: json["shipment_status"] == null ? null : json["shipment_status"],
  );

  Map<String, dynamic> toJson() => {
    "shipment_status": shipmentStatus == null ? null : shipmentStatus,
  };
}
