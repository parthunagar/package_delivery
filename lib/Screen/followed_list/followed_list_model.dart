// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

FollowedCompany FollowedCompanyFromJson(String str) => FollowedCompany.fromJson(json.decode(str));

String followedCompanyToJson(FollowedCompany data) => json.encode(data.toJson());

class FollowedCompany {
  FollowedCompany({
    this.status,
    this.message,
    this.followedCompanyData,
  });

  int? status;
  String? message;
  List<FollowedCompanyDatum>? followedCompanyData;

  factory FollowedCompany.fromJson(Map<String, dynamic> json) => FollowedCompany(
    status: json["status"],
    message: json["message"],
    followedCompanyData: json['data'] != null ? List<FollowedCompanyDatum>.from(json["data"].map((x) => FollowedCompanyDatum.fromJson(x))) : null,
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(followedCompanyData!.map((x) => x.toJson())),
  };
}

class FollowedCompanyDatum {
  FollowedCompanyDatum({
    this.id,
    this.companyId,
    this.userId,
    this.isCompanyFollow,
    this.createdAt,
    this.updatedAt,
    this.getCompany,
    this.getRating,
  });

  int? id;
  int? companyId;
  int? userId;
  int? isCompanyFollow;
  DateTime? createdAt;
  DateTime? updatedAt;
  GetCompany? getCompany;
  GetRating? getRating;

  factory FollowedCompanyDatum.fromJson(Map<String, dynamic> json) => FollowedCompanyDatum(
    id: json["id"],
    companyId: json["company_id"],
    userId: json["user_id"],
    isCompanyFollow: json["is_company_follow"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    getCompany: json['get_company'] != null ? GetCompany.fromJson(json["get_company"]) : null,
    // getCompany: GetCompany.fromJson(json["get_company"]),
    getRating: json['get_rating'] != null ? GetRating.fromJson(json["get_rating"]) : null
    // getRating: GetRating.fromJson(json["get_rating"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "company_id": companyId,
    "user_id": userId,
    "is_company_follow": isCompanyFollow,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
    "get_company": getCompany!.toJson(),
    "get_rating": getRating!.toJson(),
  };
}

class GetCompany {
  GetCompany({
    this.id,
    this.name,
    this.companyName,
    this.userImage,
    this.companyPhoto,
  });

  int? id;
  String? name;
  String? companyName;
  dynamic userImage;
  dynamic companyPhoto;

  factory GetCompany.fromJson(Map<String, dynamic> json) => GetCompany(
    id: json["id"],
    name: json["name"],
    companyName: json["company_name"],
    userImage: json["user_image"],
    companyPhoto: json["company_photo"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "company_name": companyName,
    "user_image": userImage,
    "company_photo": companyPhoto,
  };
}

class GetRating {
  GetRating({
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
  DateTime? shipmentDate;
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
  dynamic finalAmount;
  dynamic transcationId;
  String? paymentType;
  int? packageId;
  String? packagePrice;
  double? distance;
  dynamic companyId;
  dynamic companyRatingStar;
  dynamic companyRatingComment;

  factory GetRating.fromJson(Map<String, dynamic> json) => GetRating(
    id: json["id"],
    trackingId: json["tracking_id"],
    senderId: json["sender_id"],
    pickupLatitude: json["pickup_latitude"],
    pickupLongitude: json["pickup_longitude"],
    receiverName: json["receiver_name"],
    receiverPhoneNumber: json["receiver_phone_number"],
    destinationLatitude: json["destination_latitude"],
    destinationLongitude: json["destination_longitude"],
    driverId: json["driver_id"],
    amount: json["amount"],
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
    driverRatingStar: json["driver_rating_star"],
    driverRatingComment: json["driver_rating_comment"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    finalAmount: json["final_amount"],
    transcationId: json["transcation_id"],
    paymentType: json["payment_type"],
    packageId: json["package_id"],
    packagePrice: json["package_price"],
    distance: json["distance"].toDouble(),
    companyId: json["company_id"],
    companyRatingStar: json["company_rating_star"],
    companyRatingComment: json["company_rating_comment"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "tracking_id": trackingId,
    "sender_id": senderId,
    "pickup_latitude": pickupLatitude,
    "pickup_longitude": pickupLongitude,
    "receiver_name": receiverName,
    "receiver_phone_number": receiverPhoneNumber,
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
    "driver_rating_star": driverRatingStar,
    "driver_rating_comment": driverRatingComment,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
    "final_amount": finalAmount,
    "transcation_id": transcationId,
    "payment_type": paymentType,
    "package_id": packageId,
    "package_price": packagePrice,
    "distance": distance,
    "company_id": companyId,
    "company_rating_star": companyRatingStar,
    "company_rating_comment": companyRatingComment,
  };
}






// To parse this JSON data, do
//
//     final followedCompany = followedCompanyFromJson(jsonString);

// import 'dart:convert';
//
// FollowedCompany followedCompanyFromJson(String str) => FollowedCompany.fromJson(json.decode(str));
//
// String followedCompanyToJson(FollowedCompany data) => json.encode(data.toJson());
//
// class FollowedCompany {
//   FollowedCompany({
//     this.status,
//     this.message,
//     this.followedCompanyData,
//   });
//
//   int? status;
//   String? message;
//   List<FollowedCompanyDatum>? followedCompanyData;
//
//   factory FollowedCompany.fromJson(Map<String, dynamic> json) => FollowedCompany(
//     status: json["status"],
//     message: json["message"],
//     followedCompanyData: json['data'] != null ? List<FollowedCompanyDatum>.from(json["data"].map((x) => FollowedCompanyDatum.fromJson(x))) : null,
//   );
//
//   Map<String, dynamic> toJson() => {
//     "status": status,
//     "message": message,
//     "data": List<dynamic>.from(followedCompanyData!.map((x) => x.toJson())),
//   };
// }
//
// class FollowedCompanyDatum {
//   FollowedCompanyDatum({
//     this.id,
//     this.companyId,
//     this.userId,
//     this.isCompanyFollow,
//     this.createdAt,
//     this.updatedAt,
//     this.getCompany,
//     this.getRating,
//   });
//
//   int? id,companyId,userId,isCompanyFollow;
//   DateTime? createdAt,updatedAt;
//   GetCompany? getCompany;
//   GetRating? getRating;
//
//   factory FollowedCompanyDatum.fromJson(Map<String, dynamic> json) => FollowedCompanyDatum(
//     id: json["id"],
//     companyId: json["company_id"],
//     userId: json["user_id"],
//     isCompanyFollow: json["is_company_follow"],
//     createdAt: DateTime.parse(json["created_at"]),
//     updatedAt: DateTime.parse(json["updated_at"]),
//     getCompany: json['get_company'] != null ? GetCompany.fromJson(json["get_company"]) : null,
//     // getCompany: GetCompany.fromJson(json["get_company"]),
//     getRating: json['get_rating'] != null ? GetRating.fromJson(json["get_rating"]) : null
//     // getRating: GetRating.fromJson(json["get_rating"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "company_id": companyId,
//     "user_id": userId,
//     "is_company_follow": isCompanyFollow,
//     "created_at": createdAt!.toIso8601String(),
//     "updated_at": updatedAt!.toIso8601String(),
//     "get_company": getCompany!.toJson(),
//     "get_rating": getRating!.toJson(),
//   };
// }
//
// class GetCompany {
//   GetCompany({
//     this.id,
//     this.name,
//     this.companyName,
//     this.userImage,
//     this.companyPhoto,
//   });
//
//   int? id;
//   String? name,companyName,userImage,companyPhoto;
//
//   factory GetCompany.fromJson(Map<String, dynamic> json) => GetCompany(
//     id: json["id"],
//     name: json["name"],
//     companyName: json["company_name"],
//     userImage: json["user_image"],
//     companyPhoto: json["company_photo"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "name": name,
//     "company_name": companyName,
//     "user_image": userImage,
//     "company_photo": companyPhoto,
//   };
// }
//
// class GetRating {
//   GetRating({
//     this.id,
//     this.userId,
//     this.ratingBy,
//     this.ratingStar,
//     this.ratingComment,
//     this.createdAt,
//     this.updatedAt,
//   });
//
//   int? id,userId;
//   String? ratingBy,ratingStar,ratingComment;
//   DateTime? createdAt,updatedAt;
//
//   factory GetRating.fromJson(Map<String, dynamic> json) => GetRating(
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
