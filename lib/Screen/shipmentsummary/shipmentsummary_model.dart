// To parse this JSON data, do
//
//     final shipmentSummary = shipmentSummaryFromJson(jsonString);

import 'dart:convert';

ShipmentSummary shipmentSummaryFromJson(String str) => ShipmentSummary.fromJson(json.decode(str));

String shipmentSummaryToJson(ShipmentSummary data) => json.encode(data.toJson());

class ShipmentSummary {
    ShipmentSummary({
        this.status,
        this.message,
        this.datum,
    });

    int? status;
    String? message;
    List<Datum>? datum;

    factory ShipmentSummary.fromJson(Map<String, dynamic> json) => ShipmentSummary(
        status: json["status"],
        message: json["message"],
        datum: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        // datum: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(datum!.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        this.id,
        this.trackingId,
        this.senderId,
        this.senderAddress,
        this.pickupLatitude,
        this.pickupLongitude,
        this.receiverName,
        this.receiverPhoneNumber,
        this.destinaionAddress,
        this.destinationLatitude,
        this.destinationLongitude,
        this.driverId,
        this.amount,
        this.deliveryType,
        this.transportType,
        this.sendingDetails,
        this.packageWeight,
        this.shipmentDate,
        this.pickupAddress,
        this.deliveryAddress,
        this.additionalDetails,
        this.shipmentStatus,
        this.deliveryDate,
        this.deliveryTime,
        this.shipmentCreatedBy,
        this.ratingStar,
        this.ratingComment,
        this.createdAt,
        this.updatedAt,
        this.finalAmount,
        this.transcationId,
        this.paymentType,
        this.getShipmentImage,
    });

    int? id,driverId,shipmentStatus;
    String? trackingId,senderId, pickupLatitude,pickupLongitude,receiverName,receiverPhoneNumber,destinationLatitude,destinationLongitude,amount,deliveryType,transportType,sendingDetails,packageWeight,pickupAddress,deliveryAddress,additionalDetails,paymentType,shipmentCreatedBy;
    dynamic senderAddress,destinaionAddress,deliveryDate,deliveryTime,ratingStar,ratingComment,finalAmount,transcationId;
    DateTime? createdAt,updatedAt,shipmentDate;
    List<GetShipmentImage>? getShipmentImage;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        trackingId: json["tracking_id"],
        senderId: json["sender_id"],
        senderAddress: json["sender_address"],
        pickupLatitude: json["pickup_latitude"],
        pickupLongitude: json["pickup_longitude"],
        receiverName: json["receiver_name"],
        receiverPhoneNumber: json["receiver_phone_number"],
        destinaionAddress: json["destinaion_address"],
        destinationLatitude: json["destination_latitude"],
        destinationLongitude: json["destination_longitude"],
        driverId: json["driver_id"],
        amount: json["amount"] ?? '0',
        deliveryType: json["delivery_type"],
        transportType: json["transport_type"],
        sendingDetails: json["sending_details"],
        packageWeight: json["package_weight"],
        shipmentDate: DateTime.parse(json["shipment_date"]),
        pickupAddress: json["pickup_address"],
        deliveryAddress: json["delivery_address"],
        additionalDetails: json["additional_details"],
        shipmentStatus: json["shipment_status"],
        deliveryDate: json["delivery_date"],
        deliveryTime: json["delivery_time"],
        shipmentCreatedBy: json["shipment_created_by"],
        ratingStar: json["rating_star"],
        ratingComment: json["rating_comment"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        finalAmount: json["final_amount"],
        transcationId: json["transcation_id"],
        paymentType: json["payment_type"],
        getShipmentImage: json["get_shipment_image"] == null ? null : List<GetShipmentImage>.from(json["get_shipment_image"].map((x) => GetShipmentImage.fromJson(x))),
        // getShipmentImage: List<dynamic>.from(json["get_shipment_image"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "tracking_id": trackingId,
        "sender_id": senderId,
        "sender_address": senderAddress,
        "pickup_latitude": pickupLatitude,
        "pickup_longitude": pickupLongitude,
        "receiver_name": receiverName,
        "receiver_phone_number": receiverPhoneNumber,
        "destinaion_address": destinaionAddress,
        "destination_latitude": destinationLatitude,
        "destination_longitude": destinationLongitude,
        "driver_id": driverId,
        "amount": amount,
        "delivery_type": deliveryType,
        "transport_type": transportType,
        "sending_details": sendingDetails,
        "package_weight": packageWeight,
        "shipment_date": shipmentDate!.toIso8601String(),
        "pickup_address": pickupAddress,
        "delivery_address": deliveryAddress,
        "additional_details": additionalDetails,
        "shipment_status": shipmentStatus,
        "delivery_date": deliveryDate,
        "delivery_time": deliveryTime,
        "shipment_created_by": shipmentCreatedBy,
        "rating_star": ratingStar,
        "rating_comment": ratingComment,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "final_amount": finalAmount,
        "transcation_id": transcationId,
        "payment_type": paymentType,
        "get_shipment_image": getShipmentImage == null ? null : List<GetShipmentImage>.from(getShipmentImage!.map((x) => x.toJson())),
        // "get_shipment_image": List<dynamic>.from(getShipmentImage!.map((x) => x)),
    };
}


class GetShipmentImage {
    GetShipmentImage({
        required this.id,
        required this.shipmentId,
        required this.shipmentImage,
        required this.userId,
        required this.createdAt,
        required this.updatedAt,
    });

    int id;
    int shipmentId;
    String shipmentImage;
    int userId;
    String createdAt;
    String updatedAt;

    factory GetShipmentImage.fromJson(Map<String, dynamic> json) => GetShipmentImage(
        id: json["id"] == null ? null : json["id"],
        shipmentId: json["shipment_id"] == null ? null : json["shipment_id"],
        shipmentImage: json["shipment_image"] == null ? null : json["shipment_image"],
        userId: json["user_id"] == null ? null : json["user_id"],
        createdAt: json["created_at"] == null ? null : json["created_at"],
        updatedAt: json["updated_at"] == null ? null : json["updated_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "shipment_id": shipmentId == null ? null : shipmentId,
        "shipment_image": shipmentImage == null ? null : shipmentImage,
        "user_id": userId == null ? null : userId,
        "created_at": createdAt == null ? null : createdAt,
        "updated_at": updatedAt == null ? null : updatedAt,
    };
}

// import 'dart:convert';
//
// ShipmentSummary shipmentSummaryFromJson(String str) => ShipmentSummary.fromJson(json.decode(str));
//
// String shipmentSummaryToJson(ShipmentSummary data) => json.encode(data.toJson());
//
// class ShipmentSummary {
//     ShipmentSummary({
//         required this.status,
//         required this.message,
//         required this.data,
//     });
//
//     int status;
//     String message;
//     List<Datum>? data;
//
//     factory ShipmentSummary.fromJson(Map<String, dynamic> json) => ShipmentSummary(
//         status: json["status"] == null ? null : json["status"],
//         message: json["message"] == null ? null : json["message"],
//         data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
//     );
//
//     Map<String, dynamic> toJson() => {
//         "status": status == null ? null : status,
//         "message": message == null ? null : message,
//         "data": data == null ? null : List<dynamic>.from(data!.map((x) => x.toJson())),
//     };
// }
//
// class Datum {
//     Datum({
//         required this.id,
//         required this.trackingId,
//         required this.senderId,
//         required this.senderAddress,
//         required this.pickupLatitude,
//         required this.pickupLongitude,
//         required this.receiverName,
//         required this.receiverPhoneNumber,
//         required this.destinaionAddress,
//         required this.destinationLatitude,
//         required this.destinationLongitude,
//         // required this.userId,
//         required this.amount,
//         required this.deliveryType,
//         required this.transportType,
//         required this.sendingDetails,
//         required this.packageWeight,
//         required this.shipmentDate,
//         required this.pickupAddress,
//         required this.deliveryAddress,
//         required this.additionalDetails,
//         required this.shipmentStatus,
//         required this.deliveryDate,
//         required this.deliveryTime,
//         required this.shipmentCreatedBy,
//         required this.ratingStar,
//         required this.ratingComment,
//         required this.createdAt,
//         required this.updatedAt,
//         required this.getShipmentImage,
//     });
//
//     int id;
//     String trackingId;
//     dynamic senderId;
//     dynamic senderAddress;
//     String pickupLatitude;
//     String pickupLongitude;
//     String receiverName;
//     String receiverPhoneNumber;
//     dynamic destinaionAddress;
//     String destinationLatitude;
//     String destinationLongitude;
//     // var userId;
//     dynamic amount;
//     String deliveryType;
//     String transportType;
//     String sendingDetails;
//     dynamic packageWeight;
//     dynamic shipmentDate;
//     String pickupAddress;
//     String deliveryAddress;
//     String additionalDetails;
//     int shipmentStatus;
//     dynamic deliveryDate;
//     dynamic deliveryTime;
//     dynamic shipmentCreatedBy;
//     dynamic ratingStar;
//     dynamic ratingComment;
//     String createdAt;
//     String updatedAt;
//     List<GetShipmentImage>? getShipmentImage;
//
//     factory Datum.fromJson(Map<String, dynamic> json) => Datum(
//         id: json["id"] == null ? null : json["id"],
//         trackingId: json["tracking_id"] == null ? null : json["tracking_id"],
//         senderId: json["sender_id"],
//         senderAddress: json["sender_address"],
//         pickupLatitude: json["pickup_latitude"] == null ? null : json["pickup_latitude"],
//         pickupLongitude: json["pickup_longitude"] == null ? null : json["pickup_longitude"],
//         receiverName: json["receiver_name"] == null ? null : json["receiver_name"],
//         receiverPhoneNumber: json["receiver_phone_number"] == null ? null : json["receiver_phone_number"],
//         destinaionAddress: json["destinaion_address"],
//         destinationLatitude: json["destination_latitude"] == null ? null : json["destination_latitude"],
//         destinationLongitude: json["destination_longitude"] == null ? null : json["destination_longitude"],
//         // userId: json["user_id"] == null ? null : json["user_id"],
//         amount: json["amount"] == null ? '' : json["amount"],
//         deliveryType: json["delivery_type"] == null ? null : json["delivery_type"],
//         transportType: json["transport_type"] == null ? null : json["transport_type"],
//         sendingDetails: json["sending_details"] == null ? null : json["sending_details"],
//         packageWeight: json["package_weight"],
//         shipmentDate: json["shipment_date"],
//         pickupAddress: json["pickup_address"] == null ? null : json["pickup_address"],
//         deliveryAddress: json["delivery_address"] == null ? null : json["delivery_address"],
//         additionalDetails: json["additional_details"] == null ? null : json["additional_details"],
//         shipmentStatus: json["shipment_status"] == null ? null : json["shipment_status"],
//         deliveryDate: json["delivery_date"],
//         deliveryTime: json["delivery_time"],
//         shipmentCreatedBy: json["shipment_created_by"],
//         ratingStar: json["rating_star"],
//         ratingComment: json["rating_comment"],
//         createdAt: json["created_at"] == null ? null : json["created_at"],
//         updatedAt: json["updated_at"] == null ? null : json["updated_at"],
//         getShipmentImage: json["get_shipment_image"] == null ? null : List<GetShipmentImage>.from(json["get_shipment_image"].map((x) => GetShipmentImage.fromJson(x))),
//     );
//
//     Map<String, dynamic> toJson() => {
//         "id": id == null ? null : id,
//         "tracking_id": trackingId == null ? null : trackingId,
//         "sender_id": senderId,
//         "sender_address": senderAddress,
//         "pickup_latitude": pickupLatitude == null ? null : pickupLatitude,
//         "pickup_longitude": pickupLongitude == null ? null : pickupLongitude,
//         "receiver_name": receiverName == null ? null : receiverName,
//         "receiver_phone_number": receiverPhoneNumber == null ? null : receiverPhoneNumber,
//         "destinaion_address": destinaionAddress,
//         "destination_latitude": destinationLatitude == null ? null : destinationLatitude,
//         "destination_longitude": destinationLongitude == null ? null : destinationLongitude,
//         // "user_id": userId == null ? null : userId,
//         "amount": amount,
//         "delivery_type": deliveryType == null ? null : deliveryType,
//         "transport_type": transportType == null ? null : transportType,
//         "sending_details": sendingDetails == null ? null : sendingDetails,
//         "package_weight": packageWeight,
//         "shipment_date": shipmentDate,
//         "pickup_address": pickupAddress == null ? null : pickupAddress,
//         "delivery_address": deliveryAddress == null ? null : deliveryAddress,
//         "additional_details": additionalDetails == null ? null : additionalDetails,
//         "shipment_status": shipmentStatus == null ? null : shipmentStatus,
//         "delivery_date": deliveryDate,
//         "delivery_time": deliveryTime,
//         "shipment_created_by": shipmentCreatedBy,
//         "rating_star": ratingStar,
//         "rating_comment": ratingComment,
//         "created_at": createdAt == null ? null : createdAt,
//         "updated_at": updatedAt == null ? null : updatedAt,
//         "get_shipment_image": getShipmentImage == null ? null : List<dynamic>.from(getShipmentImage!.map((x) => x.toJson())),
//     };
// }
//

//
//
// // // To parse this JSON data, do
// // //
// // //     final shipmentSummary = shipmentSummaryFromJson(jsonString);
//
// // import 'package:meta/meta.dart';
// // import 'dart:convert';
//
// // ShipmentSummary shipmentSummaryFromJson(String str) => ShipmentSummary.fromJson(json.decode(str));
//
// // String shipmentSummaryToJson(ShipmentSummary data) => json.encode(data.toJson());
//
// // class ShipmentSummary {
// //     ShipmentSummary({
// //         required this.status,
// //         required this.message,
// //         required this.data,
// //     });
//
// //     int status;
// //     String message;
// //     List<ShipmentSummaryDatum>? data;
//
// //     factory ShipmentSummary.fromJson(Map<String, dynamic> json) => ShipmentSummary(
// //         status: json["status"],
// //         message: json["message"],
// //         data: json['data'] != null ? List<ShipmentSummaryDatum>.from(json["data"].map((x) => ShipmentSummaryDatum.fromJson(x))) : null,
// //     );
//
// //     Map<String, dynamic> toJson() => {
// //         "status": status,
// //         "message": message,
// //         "data": List<dynamic>.from(data!.map((x) => x.toJson())),
// //     };
// // }
//
// // class ShipmentSummaryDatum {
// //     ShipmentSummaryDatum({
// //         required this.id,
// //         required this.trackingId,
// //         required this.senderId,
// //         required this.senderAddress,
// //         required this.pickupLatitude,
// //         required this.pickupLongitude,
// //         required this.receiverName,
// //         required this.receiverPhoneNumber,
// //         required this.destinaionAddress,
// //         required this.destinationLatitude,
// //         required this.destinationLongitude,
// //         required this.userId,
// //         required this.amount,
// //         required this.deliveryType,
// //         required this.transportType,
// //         required this.sendingDetails,
// //         required this.packageWeight,
// //         required this.shipmentDate,
// //         required this.additionalDetails,
// //         required this.shipmentStatus,
// //         required this.deliveryDate,
// //         required this.deliveryTime,
// //         required this.shipmentCreatedBy,
// //         required this.ratingStar,
// //         required this.ratingComment,
// //         required this.createdAt,
// //         required this.updatedAt,
// //         required this.getShipmentImage,
// //     });
//
// //     int id;
// //     String trackingId;
// //     dynamic senderId;
// //     dynamic senderAddress;
// //     String pickupLatitude;
// //     String pickupLongitude;
// //     String receiverName;
// //     String receiverPhoneNumber;
// //     dynamic destinaionAddress;
// //     String destinationLatitude;
// //     String destinationLongitude;
// //     int userId;
// //     String amount;
// //     String deliveryType;
// //     String transportType;
// //     String sendingDetails;
// //     dynamic packageWeight;
// //     dynamic shipmentDate;
// //     String additionalDetails;
// //     int shipmentStatus;
// //     dynamic deliveryDate;
// //     dynamic deliveryTime;
// //     dynamic shipmentCreatedBy;
// //     dynamic ratingStar;
// //     dynamic ratingComment;
// //     DateTime createdAt;
// //     DateTime updatedAt;
// //     GetShipmentImage getShipmentImage;
//
// //     factory ShipmentSummaryDatum.fromJson(Map<String, dynamic> json) => ShipmentSummaryDatum(
// //         id: json["id"],
// //         trackingId: json["tracking_id"],
// //         senderId: json["sender_id"],
// //         senderAddress: json["sender_address"],
// //         pickupLatitude: json["pickup_latitude"],
// //         pickupLongitude: json["pickup_longitude"],
// //         receiverName: json["receiver_name"],
// //         receiverPhoneNumber: json["receiver_phone_number"],
// //         destinaionAddress: json["destinaion_address"],
// //         destinationLatitude: json["destination_latitude"],
// //         destinationLongitude: json["destination_longitude"],
// //         userId: json["user_id"],
// //         amount: json["amount"],
// //         deliveryType: json["delivery_type"],
// //         transportType: json["transport_type"],
// //         sendingDetails: json["sending_details"],
// //         packageWeight: json["package_weight"],
// //         shipmentDate: json["shipment_date"],
// //         additionalDetails: json["additional_details"],
// //         shipmentStatus: json["shipment_status"],
// //         deliveryDate: json["delivery_date"],
// //         deliveryTime: json["delivery_time"],
// //         shipmentCreatedBy: json["shipment_created_by"],
// //         ratingStar: json["rating_star"],
// //         ratingComment: json["rating_comment"],
// //         createdAt: DateTime.parse(json["created_at"]),
// //         updatedAt: DateTime.parse(json["updated_at"]),
// //         getShipmentImage: GetShipmentImage.fromJson(json["get_shipment_image"]),
// //     );
//
// //     Map<String, dynamic> toJson() => {
// //         "id": id,
// //         "tracking_id": trackingId,
// //         "sender_id": senderId,
// //         "sender_address": senderAddress,
// //         "pickup_latitude": pickupLatitude,
// //         "pickup_longitude": pickupLongitude,
// //         "receiver_name": receiverName,
// //         "receiver_phone_number": receiverPhoneNumber,
// //         "destinaion_address": destinaionAddress,
// //         "destination_latitude": destinationLatitude,
// //         "destination_longitude": destinationLongitude,
// //         "user_id": userId,
// //         "amount": amount,
// //         "delivery_type": deliveryType,
// //         "transport_type": transportType,
// //         "sending_details": sendingDetails,
// //         "package_weight": packageWeight,
// //         "shipment_date": shipmentDate,
// //         "additional_details": additionalDetails,
// //         "shipment_status": shipmentStatus,
// //         "delivery_date": deliveryDate,
// //         "delivery_time": deliveryTime,
// //         "shipment_created_by": shipmentCreatedBy,
// //         "rating_star": ratingStar,
// //         "rating_comment": ratingComment,
// //         "created_at": createdAt.toIso8601String(),
// //         "updated_at": updatedAt.toIso8601String(),
// //         "get_shipment_image": getShipmentImage.toJson(),
// //     };
// // }
//
// // class GetShipmentImage {
// //     GetShipmentImage({
// //         required this.id,
// //         required this.shipmentId,
// //         required this.shipmentImage,
// //         required this.userId,
// //         required this.createdAt,
// //         required this.updatedAt,
// //     });
//
// //     int id;
// //     int shipmentId;
// //     String shipmentImage;
// //     int userId;
// //     DateTime createdAt;
// //     DateTime updatedAt;
//
// //     factory GetShipmentImage.fromJson(Map<String, dynamic> json) => GetShipmentImage(
// //         id: json["id"],
// //         shipmentId: json["shipment_id"],
// //         shipmentImage: json["shipment_image"],
// //         userId: json["user_id"],
// //         createdAt: DateTime.parse(json["created_at"]),
// //         updatedAt: DateTime.parse(json["updated_at"]),
// //     );
//
// //     Map<String, dynamic> toJson() => {
// //         "id": id,
// //         "shipment_id": shipmentId,
// //         "shipment_image": shipmentImage,
// //         "user_id": userId,
// //         "created_at": createdAt.toIso8601String(),
// //         "updated_at": updatedAt.toIso8601String(),
// //     };
// // }
