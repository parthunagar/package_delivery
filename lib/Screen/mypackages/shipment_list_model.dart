// To parse this JSON data, do
//
//     final shipmentList = shipmentListFromJson(jsonString);

import 'dart:convert';

ShipmentList shipmentListFromJson(String str) => ShipmentList.fromJson(json.decode(str));

String shipmentListToJson(ShipmentList data) => json.encode(data.toJson());

class ShipmentList {
  ShipmentList({
    this.status,
    this.message,
    this.shipmentItem,
  });

  int? status;
  String? message;
  List<ShipmentItem>? shipmentItem;

  factory ShipmentList.fromJson(Map<String, dynamic> json) => ShipmentList(
    status: json["status"] == null ? null : json["status"],
    message: json["message"] == null ? null : json["message"],
    shipmentItem: json["data"] == null ? null : List<ShipmentItem>.from(json["data"].map((x) => ShipmentItem.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "message": message == null ? null : message,
    "data": shipmentItem == null ? null : List<dynamic>.from(shipmentItem!.map((x) => x.toJson())),
  };
}

class ShipmentItem {
  ShipmentItem({
    this.id,
    this.trackingId,
    this.userId,
    this.shipmentStatus,
    this.payment_status,
    this.pickupLatitude,
    this.pickupLongitude,
    this.pickupAddress,
    this.deliveryAddress,
    this.receiverPhoneNumber,
    this.receiverName,
    this.destinationLatitude,
    this.destinationLongitude,
    this.driverId,
    this.amount,
    this.deliveryType,
    this.transportType,
    this.sendingDetails,
    this.additionalDetails,
    this.createdAt,
    this.updatedAt,
    this.getDriver,
  });

  int?id;
  String? trackingId;
  String? userId;
  int? shipmentStatus;
  int? payment_status;
  String? pickupLatitude;
  String? pickupLongitude;
  String? pickupAddress;
  String? deliveryAddress;
  String? receiverPhoneNumber;
  String? receiverName;
  String? destinationLatitude;
  String? destinationLongitude;
  int? driverId;
  String? amount;
  String? deliveryType;
  String? transportType;
  String? sendingDetails;
  String? additionalDetails;
  DateTime? createdAt;
  DateTime? updatedAt;
  GetDriver? getDriver;

  factory ShipmentItem.fromJson(Map<String, dynamic> json) => ShipmentItem(
    id: json["id"] == null ? null : json["id"],
    trackingId: json["tracking_id"] == null ? null : json["tracking_id"],
    userId: json["user_id"] == null ? null : json["user_id"],
    shipmentStatus: json["shipment_status"] == null ? null : json["shipment_status"],
    payment_status: json["payment_status"] == null ? null : json["payment_status"],
    pickupLatitude: json["pickup_latitude"] == null ? null : json["pickup_latitude"],
    pickupLongitude: json["pickup_longitude"] == null ? null : json["pickup_longitude"],
    pickupAddress: json["pickup_address"] == null ? null : json["pickup_address"],
    deliveryAddress: json["delivery_address"] == null ? null : json["delivery_address"],
    receiverPhoneNumber: json["receiver_phone_number"] == null ? null : json["receiver_phone_number"],
    receiverName: json["receiver_name"] == null ? null : json["receiver_name"],
    destinationLatitude: json["destination_latitude"] == null ? null : json["destination_latitude"],
    destinationLongitude: json["destination_longitude"] == null ? null : json["destination_longitude"],
    driverId: json["driver_id"] == null ? null : json["driver_id"],
    amount: json["amount"] == null ? null : json["amount"],
    deliveryType: json["delivery_type"] == null ? null : json["delivery_type"],
    transportType: json["transport_type"] == null ? null : json["transport_type"],
    sendingDetails: json["sending_details"] == null ? null : json["sending_details"],
    additionalDetails: json["additional_details"] == null ? null : json["additional_details"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    getDriver: json["get_driver"] == null ? null : GetDriver.fromJson(json["get_driver"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "tracking_id": trackingId == null ? null : trackingId,
    "user_id": userId == null ? null : userId,
    "shipment_status": shipmentStatus == null ? null : shipmentStatus,
    "payment_status": payment_status == null ? null : payment_status,
    "pickup_latitude": pickupLatitude == null ? null : pickupLatitude,
    "pickup_longitude": pickupLongitude == null ? null : pickupLongitude,
    "pickup_address": pickupAddress == null ? null : pickupAddress,
    "delivery_address": deliveryAddress == null ? null : deliveryAddress,
    "receiver_phone_number": receiverPhoneNumber == null ? null : receiverPhoneNumber,
    "receiver_name": receiverName == null ? null : receiverName,
    "destination_latitude": destinationLatitude == null ? null : destinationLatitude,
    "destination_longitude": destinationLongitude == null ? null : destinationLongitude,
    "driver_id": driverId == null ? null : driverId,
    "amount": amount == null ? null : amount,
    "delivery_type": deliveryType == null ? null : deliveryType,
    "transport_type": transportType == null ? null : transportType,
    "sending_details": sendingDetails == null ? null : sendingDetails,
    "additional_details": additionalDetails == null ? null : additionalDetails,
    "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
    "get_driver": getDriver == null ? null : getDriver!.toJson(),
  };
}

class GetDriver {
  GetDriver({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory GetDriver.fromJson(Map<String, dynamic> json) => GetDriver(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
  };
}
