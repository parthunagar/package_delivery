// To parse this JSON data, do
//
//     final addShipment = addShipmentFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

AddShipment addShipmentFromJson(String str) => AddShipment.fromJson(json.decode(str));

String addShipmentToJson(AddShipment data) => json.encode(data.toJson());

class AddShipment {
  AddShipment({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  Data? data;

  factory AddShipment.fromJson(Map<String, dynamic> json) => AddShipment(
    status: json["status"],
    message: json["message"],
    data: json['data'] != null ? Data.fromJson(json["data"]):null
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data!.toJson(),
  };
}

class Data {
  Data({
    this.shipmentId,
    this.trackingId,
    this.pickupLatitude,
    this.pickupLongitude,
    this.destinationLatitude,
    this.destinationLongitude,
    this.deliveryType,
    this.transportType,
    this.sendingDetails,
    this.additionalDetails,
    this.amount,
    this.receiverName,
    this.receiverPhoneNumber,
    this.userId,
  });

  int? shipmentId;
  String? trackingId,pickupLatitude,pickupLongitude,destinationLatitude,destinationLongitude,deliveryType,transportType,sendingDetails,additionalDetails,amount,receiverName,receiverPhoneNumber;
  var userId;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    shipmentId: json["shipment_id"],
    trackingId: json["tracking_id"],
    pickupLatitude: json["pickup_latitude"],
    pickupLongitude: json["pickup_longitude"],
    destinationLatitude: json["destination_latitude"],
    destinationLongitude: json["destination_longitude"],
    deliveryType: json["delivery_type"],
    transportType: json["transport_type"],
    sendingDetails: json["sending_details"],
    additionalDetails: json["additional_details"],
    amount: json["amount"]??'',
    receiverName: json["receiver_name"],
    receiverPhoneNumber: json["receiver_phone_number"],
    userId: json["user_id"],
  );

  Map<String, dynamic> toJson() => {
    "shipment_id": shipmentId,
    "tracking_id": trackingId,
    "pickup_latitude": pickupLatitude,
    "pickup_longitude": pickupLongitude,
    "destination_latitude": destinationLatitude,
    "destination_longitude": destinationLongitude,
    "delivery_type": deliveryType,
    "transport_type": transportType,
    "sending_details": sendingDetails,
    "additional_details": additionalDetails,
    "amount": amount,
    "receiver_name": receiverName,
    "receiver_phone_number": receiverPhoneNumber,
    "user_id": userId,
  };
}
