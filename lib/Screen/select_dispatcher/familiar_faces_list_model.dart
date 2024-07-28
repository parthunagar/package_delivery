// To parse this JSON data, do
//
//     final familiarFaces = familiarFacesFromJson(jsonString);

import 'dart:convert';

FamiliarFaces familiarFacesFromJson(String str) => FamiliarFaces.fromJson(json.decode(str));

String familiarFacesToJson(FamiliarFaces data) => json.encode(data.toJson());

class FamiliarFaces {
  FamiliarFaces({
    this.status,
    this.message,
    this.familiarFacesData,
  });

  int? status;
  String? message;
  List<FamiliarFacesDatum>? familiarFacesData;

  factory FamiliarFaces.fromJson(Map<String, dynamic> json) => FamiliarFaces(
    status: json["status"],
    message: json["message"],
    familiarFacesData: json['data'] != null ? List<FamiliarFacesDatum>.from(json["data"].map((x) => FamiliarFacesDatum.fromJson(x))) : null,
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "FamiliarFacesData": List<dynamic>.from(familiarFacesData!.map((x) => x.toJson())),
  };
}

class FamiliarFacesDatum {
  FamiliarFacesDatum({
    this.id, this.firstName, this.username, this.email, this.emailVerifiedAt, this.contactNumber, this.verificationCode,
    this.role, this.gender, this.lastLoginDate, this.createdBy, this.address, this.country, this.state,
    this.city, this.postalCode, this.isNotificaton, this.licenseNumber, this.vehicalNumber, this.currentLatitude,
    this.currentLongitude, this.isVerified, this.isDrivingVerified, this.isCompanyFollow, this.accountNumber, this.ifscCode,
    this.branchCode, this.driverPhoto, this.createdAt, this.updatedAt, this.distance,
  });

  dynamic emailVerifiedAt,lastLoginDate,createdBy,country,state,city,postalCode,isNotificaton,licenseNumber,vehicalNumber;
  String? firstName,gender,username,email,contactNumber,verificationCode,address,currentLatitude,currentLongitude,accountNumber,ifscCode,branchCode,driverPhoto;
  int? id,role,isVerified,isDrivingVerified,isCompanyFollow;
  DateTime? createdAt,updatedAt;
  double? distance;

  factory FamiliarFacesDatum.fromJson(Map<String, dynamic> json) => FamiliarFacesDatum(
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
    driverPhoto: json["driver_photo"] ?? "",
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    distance: json["distance"].toDouble(),
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
    "driver_photo": driverPhoto,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
    "distance": distance,
  };
}
