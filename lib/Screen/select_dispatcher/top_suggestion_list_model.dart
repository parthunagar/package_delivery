// To parse this JSON data, do
//
//     final topSuggestion = topSuggestionFromJson(jsonString);

import 'dart:convert';

TopSuggestion topSuggestionFromJson(String str) => TopSuggestion.fromJson(json.decode(str));

String topSuggestionToJson(TopSuggestion data) => json.encode(data.toJson());

class TopSuggestion {
  TopSuggestion({
    this.status,
    this.message,
    this.topSuggestionData,
  });

  int? status;
  String? message;
  List<TopSuggestionDatum>? topSuggestionData;

  factory TopSuggestion.fromJson(Map<String, dynamic> json) => TopSuggestion(
    status: json["status"],
    message: json["message"],
    topSuggestionData: json['data'] != null ? List<TopSuggestionDatum>.from(json["data"].map((x) => TopSuggestionDatum.fromJson(x))) : null,
    // topSuggestionData: List<TopSuggestionDatum>.from(json["data"].map((x) => TopSuggestionDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(topSuggestionData!.map((x) => x.toJson())),
  };
}

class TopSuggestionDatum {
  TopSuggestionDatum({
    this.id,
    this.firstName,
    this.username,
    this.email,
    this.emailVerifiedAt,
    this.contactNumber,
    this.verificationCode,
    this.role,
    this.gender,
    this.lastLoginDate,
    this.createdBy,
    this.address,
    // this.country,
    // this.state,
    // this.city,
    // this.postalCode,
    this.isNotificaton,
    this.licenseNumber,
    this.vehicalNumber,
    this.currentLatitude,
    this.currentLongitude,
    this.isVerified,
    this.isDrivingVerified,
    // this.isCompanyFollow,
    this.accountNumber,
    this.ifscCode,
    this.branchCode,
    this.userImage,
    this.phoneCode,
    this.licensePhoto,
    this.driverPhoto,
    this.createdAt,
    this.updatedAt,
    this.distance,
    this.companyName,
    this.getRating,
    this.getCompanyDriver,
    this.licencePhoto
  });

  int? id,role,isVerified,isDrivingVerified,isCompanyFollow;
  dynamic accountNumber,ifscCode,branchCode,driverPhoto,emailVerifiedAt,lastLoginDate,createdBy,country,state,city,postalCode,isNotificaton,licenseNumber,vehicalNumber;
  String? firstName,gender,username,email,address,contactNumber,verificationCode,currentLatitude,currentLongitude,userImage,phoneCode,licensePhoto,licencePhoto;
  CompanyNameClass? companyName;
  DateTime? createdAt,updatedAt;
  double? distance;
  GetRating? getRating;
  GetCompanyDriver? getCompanyDriver;

  factory TopSuggestionDatum.fromJson(Map<String, dynamic> json) => TopSuggestionDatum(
    id: json["id"],
    firstName: json["first_name"],
    username: json["username"],
    email: json["email"],
    emailVerifiedAt: json["email_verified_at"],
    contactNumber: json["contact_number"],
    verificationCode: json["verification_code"],
    role: json["role"],
    gender: json["gender"],
    lastLoginDate: json["last_login_date"],
    createdBy: json["created_by"],
    address: json["address"],
    // country: json["country"],
    // state: json["state"],
    // city: json["city"],
    // postalCode: json["postal_code"],
    isNotificaton: json["is_notificaton"],
    licenseNumber: json["license_number"],
    vehicalNumber: json["vehical_number"],
    currentLatitude: json["current_latitude"],
    currentLongitude: json["current_longitude"],
    isVerified: json["is_verified"],
    isDrivingVerified: json["is_driving_verified"],
    // isCompanyFollow: json["is_company_follow"],
    accountNumber: json["account_number"],
    ifscCode: json["ifsc_code"],
    branchCode: json["branch_code"],
    userImage: json["user_image"] ?? "",
    phoneCode: json["phone_code"] ?? '',
    licensePhoto: json["license_photo"] ?? '',
    licencePhoto: json["licence_photo"] ?? '',
    driverPhoto: json["driver_photo"] ?? "",
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    distance: json["distance"].toDouble(),
    // companyName:  json["company_name"],
    companyName:   json["company_name"] == '' ? null : CompanyNameClass.fromJson(json["company_name"]),
    getRating: json["get_rating"] == null ? null : GetRating.fromJson(json["get_rating"]),
    getCompanyDriver: json["get_company_driver"] == null ? null : GetCompanyDriver.fromJson(json["get_company_driver"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "first_name": firstName,
    "username": username,
    "email": email,
    "email_verified_at": emailVerifiedAt,
    "contact_number": contactNumber,
    "verification_code": verificationCode,
    "role": role,
    "gender": gender,
    "last_login_date": lastLoginDate,
    "created_by": createdBy,
    "address": address,
    // "country": country,
    // "state": state,
    // "city": city,
    // "postal_code": postalCode,
    "is_notificaton": isNotificaton,
    "license_number": licenseNumber,
    "vehical_number": vehicalNumber,
    "current_latitude": currentLatitude,
    "current_longitude": currentLongitude,
    "is_verified": isVerified,
    "is_driving_verified": isDrivingVerified,
    // "is_company_follow": isCompanyFollow,
    "account_number": accountNumber,
    "ifsc_code": ifscCode,
    "branch_code": branchCode,
    "user_image": userImage,
    "phone_code": phoneCode,
    "license_photo": licensePhoto,
    "licence_photo": licencePhoto,
    "driver_photo": driverPhoto,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
    "distance": distance,
    "company_name": companyName != "" ? CompanyNameClass : '',
    "get_rating": getRating == null ? null : getRating!.toJson(),
    "get_company_driver": getCompanyDriver == null ? null : getCompanyDriver!.toJson(),
  };
}

class CompanyNameClass {
  CompanyNameClass({
    this.name,
  });

  String? name;

  factory CompanyNameClass.fromJson(Map<String, dynamic> json) => CompanyNameClass(
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
  };
}

class GetCompanyDriver {
  GetCompanyDriver({
    this.id,
    this.companyId,
    this.driverId,
    this.isAvailble,
    this.createdAt,
    this.updatedAt,
  });

  int? id,companyId,driverId,isAvailble;
  dynamic createdAt,updatedAt;

  factory GetCompanyDriver.fromJson(Map<String, dynamic> json) => GetCompanyDriver(
    id: json["id"],
    companyId: json["company_id"],
    driverId: json["driver_id"],
    isAvailble: json["is_availble"] ?? 3,
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "company_id": companyId,
    "driver_id": driverId,
    "is_availble": isAvailble,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}

class GetRating {
  GetRating({
    this.id,
    this.userId,
    this.ratingBy,
    this.ratingStar,
    this.ratingComment,
    this.createdAt,
    this.updatedAt,
  });

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


// // To parse this JSON data, do
// //
// //     final topSuggestion = topSuggestionFromJson(jsonString);
//
// import 'dart:convert';
//
// TopSuggestion topSuggestionFromJson(String str) => TopSuggestion.fromJson(json.decode(str));
//
// String topSuggestionToJson(TopSuggestion data) => json.encode(data.toJson());
//
// class TopSuggestion {
//   TopSuggestion({
//     required this.status,
//     required this.message,
//     required this.topSuggestionData,
//   });
//
//   int status;
//   String message;
//   List<TopSuggestionDatum>? topSuggestionData;
//
//   factory TopSuggestion.fromJson(Map<String, dynamic> json) => TopSuggestion(
//     status: json["status"],
//     message: json["message"],
//     topSuggestionData: json['data'] != null ? List<TopSuggestionDatum>.from(json["data"].map((x) => TopSuggestionDatum.fromJson(x))) : null,
//   );
//
//   Map<String, dynamic> toJson() => {
//     "status": status,
//     "message": message,
//     "data": List<dynamic>.from(topSuggestionData!.map((x) => x.toJson())),
//   };
// }
//
// class TopSuggestionDatum {
//   TopSuggestionDatum({
//     required this.id,
//     required this.name,
//     required this.username,
//     required this.email,
//     required this.emailVerifiedAt,
//     required this.contactNumber,
//     required this.verificationCode,
//     required this.role,
//     required this.gender,
//     required this.lastLoginDate,
//     required this.createdBy,
//     required this.address,
//     required this.country,
//     required this.state,
//     required this.city,
//     required this.postalCode,
//     required this.isNotificaton,
//     required this.licenseNumber,
//     required this.vehicalNumber,
//     required this.currentLatitude,
//     required this.currentLongitude,
//     required this.isVerified,
//     required this.isDrivingVerified,
//     required this.isCompanyFollow,
//     required this.accountNumber,
//     required this.ifscCode,
//     required this.branchCode,
//     required this.driverPhoto,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.distance,
//     required this.getRating,
//   });
//
//   int id;
//   String name;
//   String username;
//   String email;
//   dynamic emailVerifiedAt;
//   String contactNumber;
//   String verificationCode;
//   int role;
//   int gender;
//   dynamic lastLoginDate;
//   dynamic createdBy;
//   String address;
//   dynamic country;
//   dynamic state;
//   dynamic city;
//   dynamic postalCode;
//   dynamic isNotificaton;
//   dynamic licenseNumber;
//   dynamic vehicalNumber;
//   String currentLatitude;
//   String currentLongitude;
//   int isVerified;
//   int isDrivingVerified;
//   int isCompanyFollow;
//   String accountNumber;
//   String ifscCode;
//   String branchCode;
//   String driverPhoto;
//   DateTime createdAt;
//   DateTime updatedAt;
//   double distance;
//   GetRating? getRating;
//
//   factory TopSuggestionDatum.fromJson(Map<String, dynamic> json) => TopSuggestionDatum(
//     id: json["id"] ,
//     name: json["name"] ?? '',
//     username: json["username"] ?? '',
//     email: json["email"] ?? '',
//     emailVerifiedAt: json["email_verified_at"],
//     contactNumber: json["contact_number"],
//     verificationCode: json["verification_code"],
//     role: json["role"],
//     gender: json["gender"],
//     lastLoginDate: json["last_login_date"],
//     createdBy: json["created_by"],
//     address: json["address"],
//     country: json["country"],
//     state: json["state"],
//     city: json["city"],
//     postalCode: json["postal_code"],
//     isNotificaton: json["is_notificaton"],
//     licenseNumber: json["license_number"],
//     vehicalNumber: json["vehical_number"],
//     currentLatitude: json["current_latitude"],
//     currentLongitude: json["current_longitude"],
//     isVerified: json["is_verified"],
//     isDrivingVerified: json["is_driving_verified"],
//     isCompanyFollow: json["is_company_follow"],
//     accountNumber: json["account_number"],
//     ifscCode: json["ifsc_code"],
//     branchCode: json["branch_code"],
//     driverPhoto: json["driver_photo"],
//     createdAt: DateTime.parse(json["created_at"]),
//     updatedAt: DateTime.parse(json["updated_at"]),
//     distance: json["distance"].toDouble(),
//     getRating: json["get_rating"] == null ? null : GetRating.fromJson(json["get_rating"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "name": name,
//     "username": username,
//     "email": email,
//     "email_verified_at": emailVerifiedAt,
//     "contact_number": contactNumber,
//     "verification_code": verificationCode,
//     "role": role,
//     "gender": gender,
//     "last_login_date": lastLoginDate,
//     "created_by": createdBy,
//     "address": address,
//     "country": country,
//     "state": state,
//     "city": city,
//     "postal_code": postalCode,
//     "is_notificaton": isNotificaton,
//     "license_number": licenseNumber,
//     "vehical_number": vehicalNumber,
//     "current_latitude": currentLatitude,
//     "current_longitude": currentLongitude,
//     "is_verified": isVerified,
//     "is_driving_verified": isDrivingVerified,
//     "is_company_follow": isCompanyFollow,
//     "account_number": accountNumber,
//     "ifsc_code": ifscCode,
//     "branch_code": branchCode,
//     "driver_photo": driverPhoto,
//     "created_at": createdAt.toIso8601String(),
//     "updated_at": updatedAt.toIso8601String(),
//     "distance": distance,
//     "get_rating": getRating == null ? null : getRating!.toJson(),
//   };
// }
//
// class GetRating {
//   GetRating({
//     required this.id,
//     required this.userId,
//     required this.ratingBy,
//     required this.ratingStar,
//     required this.ratingComment,
//     required this.createdAt,
//     required this.updatedAt,
//   });
//
//   int id;
//   int userId;
//   String ratingBy;
//   String ratingStar;
//   String ratingComment;
//   DateTime createdAt;
//   DateTime updatedAt;
//
//   factory GetRating.fromJson(Map<String, dynamic> json) => GetRating(
//     id: json["id"],
//     userId: json["user_id"],
//     ratingBy: json["rating_by"],
//     ratingStar: json["rating_star"] ?? 0.0,
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
//     "created_at": createdAt.toIso8601String(),
//     "updated_at": updatedAt.toIso8601String(),
//   };
// }
