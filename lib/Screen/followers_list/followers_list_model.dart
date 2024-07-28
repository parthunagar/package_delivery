// To parse this JSON data, do
//
//     final follows = followsFromJson(jsonString);

import 'dart:convert';

Follows followsFromJson(String str) => Follows.fromJson(json.decode(str));

String followsToJson(Follows data) => json.encode(data.toJson());

class Follows {
  Follows({this.status, this.message, this.followsDatum});

  int? status;
  String? message;
  List<FollowsDatum>? followsDatum;

  factory Follows.fromJson(Map<String, dynamic> json) => Follows(
    status: json["status"],
    message: json["message"],
    followsDatum: json['data'] != null ? List<FollowsDatum>.from(json["data"].map((x) => FollowsDatum.fromJson(x))) : null,
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(followsDatum!.map((x) => x.toJson())),
  };
}

class FollowsDatum {
  FollowsDatum({this.id, this.companyId, this.userId, this.isCompanyFollow, this.createdAt, this.updatedAt, this.getCompany, this.getRating, this.getDriverCustomer});

  int? id,companyId,userId,isCompanyFollow;
  DateTime? createdAt,updatedAt;
  GetCompany? getCompany;
  GetRating? getRating;
  GetDriverCustomer? getDriverCustomer;

  factory FollowsDatum.fromJson(Map<String, dynamic> json) => FollowsDatum(
    id: json["id"],
    companyId: json["company_id"],
    userId: json["user_id"],
    isCompanyFollow: json["is_company_follow"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    getCompany: json["get_company"] == null ? null : GetCompany.fromJson(json["get_company"]),
    getRating: json["get_rating"] == null ? null : GetRating.fromJson(json["get_rating"]),
    getDriverCustomer: json["get_driver_customer"] == null ? null : GetDriverCustomer.fromJson(json["get_driver_customer"]),
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
    "get_driver_customer": getDriverCustomer!.toJson(),
  };
}

class GetCompany {
  GetCompany({this.id, this.companyName, this.userImage, this.companyPhoto});

  int? id;
  String? companyName, companyPhoto;
  dynamic userImage;

  factory GetCompany.fromJson(Map<String, dynamic> json) => GetCompany(
    id: json["id"],
    companyName: json["company_name"],
    userImage: json["user_image"],
    companyPhoto: json["company_photo"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "company_name": companyName,
    "user_image": userImage,
    "company_photo": companyPhoto,
  };
}

class GetDriverCustomer {
  GetDriverCustomer({this.id, this.customerDriverName, this.driverCustImg, this.driverCustomerPhoto});

  int? id;
  String? customerDriverName,driverCustImg,driverCustomerPhoto;

  factory GetDriverCustomer.fromJson(Map<String, dynamic> json) => GetDriverCustomer(
    id: json["id"],
    customerDriverName: json["customer_driver_name"],
    driverCustImg: json["driver_cust_img"],
    driverCustomerPhoto: json["driver_customer_photo"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "customer_driver_name": customerDriverName,
    "driver_cust_img": driverCustImg,
    "driver_customer_photo": driverCustomerPhoto,
  };
}

class GetRating {
  GetRating({this.id, this.userId, this.ratingBy, this.ratingStar, this.ratingComment, this.createdAt, this.updatedAt});

  int? id,userId;
  String? ratingBy,ratingStar,ratingComment;
  DateTime? createdAt,updatedAt;

  factory GetRating.fromJson(Map<String, dynamic> json) => GetRating(
    id: json["id"],
    userId: json["user_id"],
    ratingBy: json["rating_by"],
    ratingStar: json["rating_star"],
    ratingComment: json["rating_comment"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "rating_by": ratingBy,
    "rating_star": ratingStar,
    "rating_comment": ratingComment,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
  };
}

//
// import 'dart:convert';
//
// Follows followsFromJson(String str) => Follows.fromJson(json.decode(str));
//
// String followsToJson(Follows data) => json.encode(data.toJson());
//
// class Follows {
//   Follows({
//     this.status,
//     this.message,
//     this.followsData,
//   });
//
//   int? status;
//   String? message;
//   List<FollowsDatum>? followsData;
//
//   factory Follows.fromJson(Map<String, dynamic> json) => Follows(
//     status: json["status"],
//     message: json["message"],
//     followsData: json['data'] != null ? List<FollowsDatum>.from(json["data"].map((x) => FollowsDatum.fromJson(x))) : null,
//     // followsData: List<FollowsDatum>.from(json["data"].map((x) => FollowsDatum.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "status": status,
//     "message": message,
//     "data": List<dynamic>.from(followsData!.map((x) => x.toJson())),
//   };
// }
//
// class FollowsDatum {
//   FollowsDatum({
//     this.id,
//     this.companyId,
//     this.userId,
//     this.isCompanyFollow,
//     this.createdAt,
//     this.updatedAt,
//     this.getCompany,
//     this.getRating,
//     this.getDriver,
//   });
//
//   int? id,companyId,userId,isCompanyFollow;
//   DateTime? createdAt,updatedAt;
//   GetCompany? getCompany;
//   GetRating? getRating;
//   dynamic getDriver;
//
//   factory FollowsDatum.fromJson(Map<String, dynamic> json) => FollowsDatum(
//     id: json["id"],
//     companyId: json["company_id"],
//     userId: json["user_id"],
//     isCompanyFollow: json["is_company_follow"],
//     createdAt: DateTime.parse(json["created_at"]),
//     updatedAt: DateTime.parse(json["updated_at"]),
//     getCompany: GetCompany.fromJson(json["get_company"]),
//     getRating: json["get_rating"] == null ? null : GetRating.fromJson(json["get_rating"]),
//     getDriver: json["get_driver"],
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
//     "get_rating": getRating == null ? null : getRating!.toJson(),
//     "get_driver": getDriver,
//   };
// }
//
// class GetCompany {
//   GetCompany({
//     this.id,
//     this.companyName,
//     this.companyPhoto,
//   });
//
//   int? id;
//   String? companyName,companyPhoto;
//
//   factory GetCompany.fromJson(Map<String, dynamic> json) => GetCompany(
//     id: json["id"],
//     companyName: json["company_name"],
//     companyPhoto: json["company_photo"] == null ? null : json["company_photo"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "company_name": companyName,
//     "company_photo": companyPhoto == null ? null : companyPhoto,
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
