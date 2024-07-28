// To parse this JSON data, do
//
//     final statusOfItem = statusOfItemFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

StatusOfItem statusOfItemFromJson(String str) => StatusOfItem.fromJson(json.decode(str));

String statusOfItemToJson(StatusOfItem data) => json.encode(data.toJson());

class StatusOfItem {
  StatusOfItem({
    required this.status,
    required this.message,
    required this.shipmentItem,
  });

  int status;
  String message;
  List<ShipmentItem>? shipmentItem;

  factory StatusOfItem.fromJson(Map<String, dynamic> json) => StatusOfItem(
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
    required this.id,
    required this.trackingId,
    required this.senderId,
    required this.senderAddress,
    required this.pickupLatitude,
    required this.pickupLongitude,
    required this.receiverName,
    required this.receiverPhoneNumber,
    required this.destinaionAddress,
    required this.destinationLatitude,
    required this.destinationLongitude,
    required this.driverId,
    required this.amount,
    required this.deliveryType,
    required this.transportType,
    required this.sendingDetails,
    required this.packageWeight,
    required this.shipmentDate,
    required this.pickupAddress,
    required this.deliveryAddress,
    required this.additionalDetails,
    required this.shipmentStatus,
    required this.payment_status,
    required this.deliveryDate,
    required this.deliveryTime,
    required this.shipmentCreatedBy,
    required this.ratingStar,
    required this.ratingComment,
    required this.createdAt,
    required this.updatedAt,
    required this.finalAmount,
    required this.transcationId,
    required this.paymentType,
    required this.packageId,
    required this.distance,
    required this.getCompany,
    required this.getDeliveredShipment,
  });

  int? id;
  String? trackingId;
  String? senderId;
  String? senderAddress;
  String? pickupLatitude;
  String? pickupLongitude;
  String? receiverName;
  String? receiverPhoneNumber;
  String? destinaionAddress;
  String? destinationLatitude;
  String? destinationLongitude;
  int? driverId;
  String? amount;
  String? deliveryType;
  String? transportType;
  String? sendingDetails;
  String? packageWeight;
  DateTime? shipmentDate;
  String? pickupAddress;
  String? deliveryAddress;
  String? additionalDetails;
  int? shipmentStatus;
  int? payment_status;
  dynamic deliveryDate;
  dynamic deliveryTime;
  String? shipmentCreatedBy;
  dynamic ratingStar;
  dynamic ratingComment;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? finalAmount;
  String? transcationId;
  String? paymentType;
  int? packageId;
  var distance;
  GetCompany? getCompany;
  List<GetDeliveredShipment>? getDeliveredShipment;

  factory ShipmentItem.fromJson(Map<String, dynamic> json) => ShipmentItem(
    id: json["id"] == null ? null : json["id"],
    trackingId: json["tracking_id"] == null ? null : json["tracking_id"],
    senderId: json["sender_id"] == null ? null : json["sender_id"],
    senderAddress: json["sender_address"],
    pickupLatitude: json["pickup_latitude"] == null ? null : json["pickup_latitude"],
    pickupLongitude: json["pickup_longitude"] == null ? null : json["pickup_longitude"],
    receiverName: json["receiver_name"] == null ? null : json["receiver_name"],
    receiverPhoneNumber: json["receiver_phone_number"] == null ? null : json["receiver_phone_number"],
    destinaionAddress: json["destinaion_address"],
    destinationLatitude: json["destination_latitude"] == null ? null : json["destination_latitude"],
    destinationLongitude: json["destination_longitude"] == null ? null : json["destination_longitude"],
    driverId: json["driver_id"] == null ? null : json["driver_id"],
    amount: json["amount"] == null ? null : json["amount"],
    deliveryType: json["delivery_type"] == null ? null : json["delivery_type"],
    transportType: json["transport_type"] == null ? null : json["transport_type"],
    sendingDetails: json["sending_details"] == null ? null : json["sending_details"],
    packageWeight: json["package_weight"] == null ? null : json["package_weight"],
    shipmentDate: json["shipment_date"] == null ? null : DateTime.parse(json["shipment_date"]),
    pickupAddress: json["pickup_address"] == null ? null : json["pickup_address"],
    deliveryAddress: json["delivery_address"] == null ? null : json["delivery_address"],
    additionalDetails: json["additional_details"] == null ? null : json["additional_details"],
    shipmentStatus: json["shipment_status"] == null ? null : json["shipment_status"],
    payment_status: json["payment_status"] == null ? null : json["payment_status"],
    deliveryDate: json["delivery_date"],
    deliveryTime: json["delivery_time"],
    shipmentCreatedBy: json["shipment_created_by"] == null ? null : json["shipment_created_by"],
    ratingStar: json["rating_star"],
    ratingComment: json["rating_comment"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    finalAmount: json["final_amount"] == null ? null : json["final_amount"],
    transcationId: json["transcation_id"] == null ? null : json["transcation_id"],
    paymentType: json["payment_type"] == null ? null : json["payment_type"],
    packageId: json["package_id"] == null ? null : json["package_id"],
    distance: json["distance"] == null ? null : json["distance"],
    getCompany: json["get_company"] == null ? null : GetCompany.fromJson(json["get_company"]),
    getDeliveredShipment: json["get_delivered_shipment"] == [] ? null : List<GetDeliveredShipment>.from(json["get_delivered_shipment"].map((x) => GetDeliveredShipment.fromJson(x))),

  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "tracking_id": trackingId == null ? null : trackingId,
    "sender_id": senderId == null ? null : senderId,
    "sender_address": senderAddress,
    "pickup_latitude": pickupLatitude == null ? null : pickupLatitude,
    "pickup_longitude": pickupLongitude == null ? null : pickupLongitude,
    "receiver_name": receiverName == null ? null : receiverName,
    "receiver_phone_number": receiverPhoneNumber == null ? null : receiverPhoneNumber,
    "destinaion_address": destinaionAddress,
    "destination_latitude": destinationLatitude == null ? null : destinationLatitude,
    "destination_longitude": destinationLongitude == null ? null : destinationLongitude,
    "driver_id": driverId == null ? null : driverId,
    "amount": amount == null ? null : amount,
    "delivery_type": deliveryType == null ? null : deliveryType,
    "transport_type": transportType == null ? null : transportType,
    "sending_details": sendingDetails == null ? null : sendingDetails,
    "package_weight": packageWeight == null ? null : packageWeight,
    "shipment_date": shipmentDate == null ? null : shipmentDate!.toIso8601String(),
    "pickup_address": pickupAddress == null ? null : pickupAddress,
    "delivery_address": deliveryAddress == null ? null : deliveryAddress,
    "additional_details": additionalDetails == null ? null : additionalDetails,
    "shipment_status": shipmentStatus == null ? null : shipmentStatus,
    "payment_status": payment_status == null ? null : payment_status,
    "delivery_date": deliveryDate,
    "delivery_time": deliveryTime,
    "shipment_created_by": shipmentCreatedBy == null ? null : shipmentCreatedBy,
    "rating_star": ratingStar,
    "rating_comment": ratingComment,
    "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
    "final_amount": finalAmount == null ? null : finalAmount,
    "transcation_id": transcationId == null ? null : transcationId,
    "payment_type": paymentType == null ? null : paymentType,
    "package_id": packageId == null ? null : packageId,
    "distance": distance == null ? null : distance,
    "get_company": getCompany == null ? null : getCompany!.toJson(),
    "get_delivered_shipment": getDeliveredShipment == [] ? null : List<dynamic>.from(getDeliveredShipment!.map((x) => x.toJson())),
  };
}

class GetCompany {
  GetCompany({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory GetCompany.fromJson(Map<String, dynamic> json) => GetCompany(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
  };
}
class GetDeliveredShipment {
  GetDeliveredShipment({
    required this.id,
    required this.userId,
    required this.shipmentId,
    required this.deliveredShipmentImage,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  int userId;
  int shipmentId;
  String deliveredShipmentImage;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory GetDeliveredShipment.fromJson(Map<String, dynamic> json) => GetDeliveredShipment(
    id: json["id"] == null ? null : json["id"],
    userId: json["user_id"] == null ? null : json["user_id"],
    shipmentId: json["shipment_id"] == null ? null : json["shipment_id"],
    deliveredShipmentImage: json["delivered_shipment_image"] == null ? null : json["delivered_shipment_image"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "user_id": userId == null ? null : userId,
    "shipment_id": shipmentId == null ? null : shipmentId,
    "delivered_shipment_image": deliveredShipmentImage == null ? null : deliveredShipmentImage,
    "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
  };
}

