// To parse this JSON data, do
//
//     final shipmentList = shipmentListFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

// To parse this JSON data, do
//
//     final shipmentList = shipmentListFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ShipmentList shipmentListFromJson(String str) => ShipmentList.fromJson(json.decode(str));

String shipmentListToJson(ShipmentList data) => json.encode(data.toJson());

class ShipmentList {
  ShipmentList({
    required this.status,
    required this.message,
    required this.data,
  });

  int status;
  String message;
  Data? data;

  factory ShipmentList.fromJson(Map<String, dynamic> json) => ShipmentList(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data!.toJson(),
  };
}

class Data {
  Data({
    required this.currentPage,
    required this.shipmentlist,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    required this.links,
    required this.nextPageUrl,
    required this.path,
    required this.perPage,
    required this.prevPageUrl,
    required this.to,
    required this.total,

  });

  int currentPage;
  List<shipment>? shipmentlist;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;
  List<Link>? links;
  dynamic nextPageUrl;
  String path;
  int perPage;
  dynamic prevPageUrl;
  int to;
  int total;



  factory Data.fromJson(Map<String, dynamic> json) => Data(
    currentPage: json["current_page"],
    // shipmentlist: List<shipment>.from(json["data"].map((x) => shipment.fromJson(x))),
    shipmentlist: json['data'] != null ? List<shipment>.from(json["data"].map((x) => shipment.fromJson(x))) : null,
    firstPageUrl: json["first_page_url"],
    from: json["from"] ?? 0,
    lastPage: json["last_page"],
    lastPageUrl: json["last_page_url"],
    links: json['links'] != null ? List<Link>.from(json["links"].map((x) => Link.fromJson(x))) : null,
    nextPageUrl: json["next_page_url"],
    path: json["path"],
    perPage: json["per_page"],
    prevPageUrl: json["prev_page_url"],
    to: json["to"] ?? 0,
    total: json["total"] ?? 0,


  );

  Map<String, dynamic> toJson() => {
    "current_page": currentPage,
    "data": List<dynamic>.from(shipmentlist!.map((x) => x.toJson())),
    "first_page_url": firstPageUrl,
    "from": from,
    "last_page": lastPage,
    "last_page_url": lastPageUrl,
    "links": List<dynamic>.from(links!.map((x) => x.toJson())),
    "next_page_url": nextPageUrl,
    "path": path,
    "per_page": perPage,
    "prev_page_url": prevPageUrl,
    "to": to,
    "total": total,


  };
}

class shipment {
  shipment({
     this.id,
     this.trackingId,
     this.shipmentStatus,
     this.payment_status,
     this.pickupLatitude,
     this.pickupLongitude,
     this.receiverPhoneNumber,
     this.receiverName,
     this.destinationLatitude,
     this.destinationLongitude,
     this.userId,
     this.amount,
     this.deliveryType,
     this.transportType,
     this.sendingDetails,
     this.additionalDetails,
     this.createdAt,
     this.updatedAt,
     this.getDriver,
    this.getCompanyDetail,
     this.pickupAddress,
    this.deliveryAddress,
    this.driverRatingStar
  });
  var driverRatingStar;

  int? id;
  String? trackingId,pickupLatitude,pickupLongitude,receiverPhoneNumber,receiverName,destinationLatitude,destinationLongitude;

  String? amount,deliveryType,transportType,sendingDetails,additionalDetails;
  var userId;
  dynamic shipmentStatus;
  dynamic payment_status;
  DateTime? createdAt;
  DateTime? updatedAt;
  GetDriver? getDriver;
  GetCompanyDetail? getCompanyDetail;
  String? pickupAddress;
  String? deliveryAddress;

  factory shipment.fromJson(Map<String, dynamic> json) => shipment(
    id: json["id"],
    trackingId: json["tracking_id"],
    shipmentStatus: json["shipment_status"],
    payment_status: json["payment_status"],
    pickupLatitude: json["pickup_latitude"],
    pickupLongitude: json["pickup_longitude"],
    receiverPhoneNumber: json["receiver_phone_number"],
    receiverName: json["receiver_name"],
    destinationLatitude: json["destination_latitude"],
    destinationLongitude: json["destination_longitude"],
    userId: json["user_id"],
    amount: json["amount"] ?? '',
    deliveryType: json["delivery_type"],
    transportType: json["transport_type"],
    sendingDetails: json["sending_details"],
    additionalDetails: json["additional_details"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    getDriver: json["get_driver"] == null ? null : GetDriver.fromJson(json["get_driver"]),
    getCompanyDetail: json["get_company_detail"] == null ? null : GetCompanyDetail.fromJson(json["get_company_detail"]),
    pickupAddress: json["pickup_address"] == null ? '' : json["pickup_address"],
    deliveryAddress: json["delivery_address"] == null ? '' : json["delivery_address"],
    driverRatingStar: json["driver_rating_star"] == null ? '' : json["driver_rating_star"],

  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "tracking_id": trackingId,
    "shipment_status": shipmentStatus,
    "payment_status": payment_status,
    "pickup_latitude": pickupLatitude,
    "pickup_longitude": pickupLongitude,
    "receiver_phone_number": receiverPhoneNumber,
    "receiver_name": receiverName,
    "destination_latitude": destinationLatitude,
    "destination_longitude": destinationLongitude,
    "user_id": userId,
    "amount": amount,
    "delivery_type": deliveryType,
    "transport_type": transportType,
    "sending_details": sendingDetails,
    "additional_details": additionalDetails,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
    "get_driver": getDriver == null ? null : getDriver!.toJson(),
    "get_company_detail": getCompanyDetail == null ? null : getCompanyDetail!.toJson(),
    "pickup_address": pickupAddress == null ? null : pickupAddress,
    "delivery_address": deliveryAddress == null ? null : deliveryAddress,
    "driver_rating_star": driverRatingStar == null ? null : driverRatingStar,
  };
}

class GetCompanyDetail {
  GetCompanyDetail({
    this.id,
    this.name,
    this.userImage,
    this.companyPhoto,
  });

  int? id;
  String? name;
  String? userImage;
  String? companyPhoto;

  factory GetCompanyDetail.fromJson(Map<String, dynamic> json) => GetCompanyDetail(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    userImage:  json["user_image"] == null ? null : json["user_image"],
    companyPhoto:  json["company_photo"] == null ? null : json["company_photo"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "user_image": userImage,
    "company_photo": companyPhoto,
  };
}

class GetDriver {
  GetDriver({
    this.id,
    this.name,
    this.userImage,
    this.driverPhoto,
  });

  int? id;
  String? name;
  String? userImage;
  String? driverPhoto;

  factory GetDriver.fromJson(Map<String, dynamic> json) => GetDriver(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    userImage: json["user_image"] == null ? null : json["user_image"],
    driverPhoto: json["driver_photo"] == null ? null : json["driver_photo"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "user_image": userImage == null ? null : userImage,
    "driver_photo": driverPhoto == null ? null : driverPhoto,
  };
}

class Link {
  Link({
    required this.url,
    required this.label,
    required this.active,
  });

  String url;
  String label;
  bool active;

  factory Link.fromJson(Map<String, dynamic> json) => Link(
    url: json["url"] == null ? '' : json["url"],
    label: json["label"],
    active: json["active"],
  );

  Map<String, dynamic> toJson() => {
    "url": url == null ? null : url,
    "label": label,
    "active": active,
  };
}
