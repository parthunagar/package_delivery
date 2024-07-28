// To parse this JSON data, do
//
//     final rateReview = rateReviewFromJson(jsonString);

import 'dart:convert';

RateReview rateReviewFromJson(String str) => RateReview.fromJson(json.decode(str));

String rateReviewToJson(RateReview data) => json.encode(data.toJson());

class RateReview {
  RateReview({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  RateReviewData? data;

  factory RateReview.fromJson(Map<String, dynamic> json) => RateReview(
    status: json["status"] == null ? null : json["status"],
    message: json["message"] == null ? null : json["message"],
    data: json["data"] == null ? null : RateReviewData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "message": message == null ? null : message,
    "RateReviewData": data == null ? null : data!.toJson(),
  };
}

class RateReviewData {
  RateReviewData({
    this.totalReview,
    this.averageReview,
    this.excellentAvg,
    this.goodAvg,
    this.avg,
    this.poorAvg,
    this.details,
  });

  int? totalReview;
  var averageReview;
  var excellentAvg;
  var  goodAvg;
  var avg;
  var poorAvg;
  List<Detail>? details;

  factory RateReviewData.fromJson(Map<String, dynamic> json) => RateReviewData(
    totalReview: json["total_review"] == null ? null : json["total_review"],
    averageReview: json["average_review"] == null ? null : json["average_review"].toDouble(),
    excellentAvg: json["excellent_avg"] == null ? null : json["excellent_avg"].toDouble(),
    goodAvg: json["good_avg"] == null ? null : json["good_avg"],
    avg: json["avg"] == null ? null : json["avg"].toDouble(),
    poorAvg: json["poor_avg"] == null ? null : json["poor_avg"],
    details: json["details"] == null ? null : List<Detail>.from(json["details"].map((x) => Detail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "total_review": totalReview == null ? null : totalReview,
    "average_review": averageReview == null ? null : averageReview,
    "excellent_avg": excellentAvg == null ? null : excellentAvg,
    "good_avg": goodAvg == null ? null : goodAvg,
    "avg": avg == null ? null : avg,
    "poor_avg": poorAvg == null ? null : poorAvg,
    "details": details == null ? null : List<dynamic>.from(details!.map((x) => x.toJson())),
  };
}

class Detail {
  Detail({
    this.id,
    this.trackingId,
    this.senderId,
    this.pickupLatitude,
    this.pickupLongitude,
    this.receiverName,
    this.receiverPhoneNumber,
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
    this.driverRatingStar,
    this.driverRatingComment,
    this.createdAt,
    this.updatedAt,
    this.finalAmount,
    this.transcationId,
    this.paymentType,
    this.packageId,
    this.packagePrice,
    this.distance,
    this.companyId,
    this.companyRatingStar,
    this.companyRatingComment,
    this.getSenderDetails,
  });

  int? id;
  String? trackingId;
  String? senderId;
  String? pickupLatitude;
  String? pickupLongitude;
  String? receiverName;
  String? receiverPhoneNumber;
  String? destinationLatitude;
  String? destinationLongitude;
  int? driverId;
  String? amount;
  String? deliveryType;
  String? transportType;
  String? sendingDetails;
  dynamic packageWeight;
  String? shipmentDate;
  String? pickupAddress;
  String? deliveryAddress;
  String? additionalDetails;
  int? shipmentStatus;
  dynamic deliveryDate;
  dynamic deliveryTime;
  String? shipmentCreatedBy;
  String? driverRatingStar;
  String? driverRatingComment;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? finalAmount;
  String? transcationId;
  String? paymentType;
  int? packageId;
  String? packagePrice;
  double? distance;
  dynamic companyId;
  dynamic companyRatingStar;
  dynamic companyRatingComment;
  GetSenderDetails? getSenderDetails;

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
    id: json["id"] == null ? null : json["id"],
    trackingId: json["tracking_id"] == null ? null : json["tracking_id"],
    senderId: json["sender_id"] == null ? null : json["sender_id"],
    pickupLatitude: json["pickup_latitude"] == null ? null : json["pickup_latitude"],
    pickupLongitude: json["pickup_longitude"] == null ? null : json["pickup_longitude"],
    receiverName: json["receiver_name"] == null ? null : json["receiver_name"],
    receiverPhoneNumber: json["receiver_phone_number"] == null ? null : json["receiver_phone_number"],
    destinationLatitude: json["destination_latitude"] == null ? null : json["destination_latitude"],
    destinationLongitude: json["destination_longitude"] == null ? null : json["destination_longitude"],
    driverId: json["driver_id"] == null ? null : json["driver_id"],
    amount: json["amount"] == null ? null : json["amount"],
    deliveryType: json["delivery_type"] == null ? null : json["delivery_type"],
    transportType: json["transport_type"] == null ? null : json["transport_type"],
    sendingDetails: json["sending_details"] == null ? null : json["sending_details"],
    packageWeight: json["package_weight"],
    shipmentDate: json["shipment_date"] == null ? null : json["shipment_date"],
    pickupAddress: json["pickup_address"] == null ? null : json["pickup_address"],
    deliveryAddress: json["delivery_address"] == null ? null : json["delivery_address"],
    additionalDetails: json["additional_details"] == null ? null : json["additional_details"],
    shipmentStatus: json["shipment_status"] == null ? null : json["shipment_status"],
    deliveryDate: json["delivery_date"],
    deliveryTime: json["delivery_time"],
    shipmentCreatedBy: json["shipment_created_by"] == null ? null : json["shipment_created_by"],
    driverRatingStar: json["driver_rating_star"] == null ? null : json["driver_rating_star"],
    driverRatingComment: json["driver_rating_comment"] == null ? null : json["driver_rating_comment"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    finalAmount: json["final_amount"] == null ? null : json["final_amount"],
    transcationId: json["transcation_id"] == null ? null : json["transcation_id"],
    paymentType: json["payment_type"] == null ? null : json["payment_type"],
    packageId: json["package_id"] == null ? null : json["package_id"],
    packagePrice: json["package_price"] == null ? null : json["package_price"],
    distance: json["distance"] == null ? null : json["distance"].toDouble(),
    companyId: json["company_id"],
    companyRatingStar: json["company_rating_star"],
    companyRatingComment: json["company_rating_comment"],
    getSenderDetails: json["get_sender_details"] == null ? null : GetSenderDetails.fromJson(json["get_sender_details"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "tracking_id": trackingId == null ? null : trackingId,
    "sender_id": senderId == null ? null : senderId,
    "pickup_latitude": pickupLatitude == null ? null : pickupLatitude,
    "pickup_longitude": pickupLongitude == null ? null : pickupLongitude,
    "receiver_name": receiverName == null ? null : receiverName,
    "receiver_phone_number": receiverPhoneNumber == null ? null : receiverPhoneNumber,
    "destination_latitude": destinationLatitude == null ? null : destinationLatitude,
    "destination_longitude": destinationLongitude == null ? null : destinationLongitude,
    "driver_id": driverId == null ? null : driverId,
    "amount": amount == null ? null : amount,
    "delivery_type": deliveryType == null ? null : deliveryType,
    "transport_type": transportType == null ? null : transportType,
    "sending_details": sendingDetails == null ? null : sendingDetails,
    "package_weight": packageWeight,
    "shipment_date": shipmentDate == null ? null : shipmentDate,
    "pickup_address": pickupAddress == null ? null : pickupAddress,
    "delivery_address": deliveryAddress == null ? null : deliveryAddress,
    "additional_details": additionalDetails == null ? null : additionalDetails,
    "shipment_status": shipmentStatus == null ? null : shipmentStatus,
    "delivery_date": deliveryDate,
    "delivery_time": deliveryTime,
    "shipment_created_by": shipmentCreatedBy == null ? null : shipmentCreatedBy,
    "driver_rating_star": driverRatingStar == null ? null : driverRatingStar,
    "driver_rating_comment": driverRatingComment == null ? null : driverRatingComment,
    "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
    "final_amount": finalAmount == null ? null : finalAmount,
    "transcation_id": transcationId == null ? null : transcationId,
    "payment_type": paymentType == null ? null : paymentType,
    "package_id": packageId == null ? null : packageId,
    "package_price": packagePrice == null ? null : packagePrice,
    "distance": distance == null ? null : distance,
    "company_id": companyId,
    "company_rating_star": companyRatingStar,
    "company_rating_comment": companyRatingComment,
    "get_sender_details": getSenderDetails == null ? null : getSenderDetails!.toJson(),
  };
}

class GetSenderDetails {
  GetSenderDetails({
    this.id,
    this.username,
    this.email,
    this.image,
    this.userImage,
  });

  int? id;
  String? username;
  String? email;
  String? image;
  String? userImage;

  factory GetSenderDetails.fromJson(Map<String, dynamic> json) => GetSenderDetails(
    id: json["id"] == null ? null : json["id"],
    username: json["username"] == null ? null : json["username"],
    email: json["email"] == null ? null : json["email"],
    image: json["image"] == null ? null : json["image"],
    userImage: json["user_image"] == null ? null : json["user_image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "username": username == null ? null : username,
    "email": email == null ? null : email,
    "image": image == null ? null : image,
    "user_image": userImage == null ? null : userImage,
  };
}




// To parse this JSON data, do
//
//     final rateReview = rateReviewFromJson(jsonString);

// import 'dart:convert';
//
// RateReview rateReviewFromJson(String str) => RateReview.fromJson(json.decode(str));
//
// String rateReviewToJson(RateReview data) => json.encode(data.toJson());
//
// class RateReview {
//   RateReview({this.status, this.message, this.data});
//
//   int? status;
//   String? message;
//   RateReviewData? data;
//
//   factory RateReview.fromJson(Map<String, dynamic> json) => RateReview(
//     status: json["status"],
//     message: json["message"],
//     data: json['data'] != null ? RateReviewData.fromJson(json["data"]) : null
//   );
//
//   Map<String, dynamic> toJson() => {
//     "status": status,
//     "message": message,
//     "data": data!.toJson(),
//   };
// }
//
// class RateReviewData {
//   RateReviewData({this.totalReview, this.averageReview, this.excellentAvg, this.goodAvg, this.avg, this.poorAvg, this.details});
//
//   var totalReview,poorAvg;
//   double? averageReview,excellentAvg,goodAvg,avg;
//   List<Detail>? details;
//
//   factory RateReviewData.fromJson(Map<String, dynamic> json) => RateReviewData(
//     totalReview: json["total_review"],
//     averageReview: json["average_review"].toDouble(),
//     excellentAvg: json["excellent_avg"].toDouble(),
//     goodAvg: json["good_avg"].toDouble(),
//     avg: json["avg"].toDouble(),
//     poorAvg: json["poor_avg"],
//     details: json['details'] != null ? List<Detail>.from(json["details"].map((x) => Detail.fromJson(x))) : null,
//   );
//
//   Map<String, dynamic> toJson() => {
//     "total_review": totalReview,
//     "average_review": averageReview,
//     "excellent_avg": excellentAvg,
//     "good_avg": goodAvg,
//     "avg": avg,
//     "poor_avg": poorAvg,
//     "details": List<dynamic>.from(details!.map((x) => x.toJson())),
//   };
// }
//
// class Detail {
//   Detail({this.id, this.username, this.email, this.role, this.getRatingBy,this.userImage});
//
//   int? id,role;
//   String? username,email,userImage;
//   GetRatingBy? getRatingBy;
//
//   factory Detail.fromJson(Map<String, dynamic> json) => Detail(
//     id: json["id"],
//     username: json["username"],
//     email: json["email"],
//     role: json["role"],
//     userImage: json["user_image"],
//     getRatingBy: json["get_rating_by"] == null ? null : GetRatingBy.fromJson(json["get_rating_by"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "username": username,
//     "email": email,
//     "role": role,
//     "user_image": userImage,
//     "get_rating_by": getRatingBy == null ? null : getRatingBy!.toJson(),
//   };
// }
//
// class GetRatingBy {
//   GetRatingBy({this.id, this.userId, this.ratingBy, this.ratingStar, this.ratingComment, this.createdAt, this.updatedAt});
//
//   int? id,userId;
//   String? ratingBy,ratingStar,ratingComment;
//   DateTime? createdAt,updatedAt;
//
//   factory GetRatingBy.fromJson(Map<String, dynamic> json) => GetRatingBy(
//     id: json["id"],
//     userId: json["user_id"],
//     ratingBy: json["rating_by"],
//     ratingStar: json["rating_star"],
//     ratingComment: json["rating_comment"],
//     createdAt: DateTime.parse(json["created_at"]),
//     updatedAt: DateTime.parse(json["updated_at"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "user_id": userId,
//     "rating_by": ratingBy,
//     "rating_star": ratingStar,
//     "rating_comment": ratingComment,
//     "created_at": createdAt!.toIso8601String(),
//     "updated_at": updatedAt!.toIso8601String(),
//   };
// }
