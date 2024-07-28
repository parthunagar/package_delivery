// To parse this JSON data, do
//
//     final notification = notificationFromJson(jsonString);

import 'dart:convert';

MainNotification notificationFromJson(String str) => MainNotification.fromJson(json.decode(str));

String notificationToJson(MainNotification data) => json.encode(data.toJson());

class MainNotification {
  MainNotification({
    required this.status,
    required this.message,
    required this.notificationData,
  });

  int status;
  String message;
  List<NotificationDatum>? notificationData;

  factory MainNotification.fromJson(Map<String, dynamic> json) => MainNotification(
    status: json["status"],
    message: json["message"],
    notificationData:  json['data'] != null ? List<NotificationDatum>.from(json["data"].map((x) => NotificationDatum.fromJson(x))) : null
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(notificationData!.map((x) => x.toJson())),
  };
}

class NotificationDatum {
  NotificationDatum({
    required this.id,
    required this.userId,
    required this.shipmentId,
    required this.notificationDetails,
    required this.notificaionStatus,
    required this.orderId,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  int userId;
  int shipmentId;
  String notificationDetails;
  int notificaionStatus;
  String orderId;
  DateTime createdAt;
  DateTime updatedAt;

  factory NotificationDatum.fromJson(Map<String, dynamic> json) => NotificationDatum(
    id: json["id"],
    userId: json["user_id"],
    shipmentId: json["shipment_id"],
    notificationDetails: json["notification_details"],
    notificaionStatus: json["notificaion_status"],
    orderId: json["order_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "shipment_id": shipmentId,
    "notification_details": notificationDetails,
    "notificaion_status": notificaionStatus,
    "order_id": orderId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
