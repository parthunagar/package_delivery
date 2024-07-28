// To parse this JSON data, do
//
//     final shippingCompany = shippingCompanyFromJson(jsonString);

import 'dart:convert';

ShippingCompany shippingCompanyFromJson(String str) => ShippingCompany.fromJson(json.decode(str));

String shippingCompanyToJson(ShippingCompany data) => json.encode(data.toJson());

class ShippingCompany {
  ShippingCompany({
    this.status,
    this.message,
    this.shippingCompanyData,
  });

  int? status;
  String? message;
  List<ShippingCompanyDatum>? shippingCompanyData;

  factory ShippingCompany.fromJson(Map<String, dynamic> json) => ShippingCompany(
    status: json["status"],
    message: json["message"],
    shippingCompanyData: json['data'] != null ? List<ShippingCompanyDatum>.from(json["data"].map((x) => ShippingCompanyDatum.fromJson(x))) : null,
    // shippingCompanyDatum: List<ShippingCompanyDatum>.from(json["data"].map((x) => ShippingCompanyDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(shippingCompanyData!.map((x) => x.toJson())),
  };
}

class ShippingCompanyDatum {
  ShippingCompanyDatum({
    this.id,
    this.firstName,
    this.lastName,
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
    this.isNotificaton,
    this.licenseNumber,
    this.vehicalNumber,
    this.currentLatitude,
    this.currentLongitude,
    this.accountNumber,
    this.ifscCode,
    this.branchCode,
    this.userImage,
    this.isVerified,
    this.isDrivingVerified,
    this.createdAt,
    this.updatedAt,
    this.phoneCode,
    this.licensePhoto,
    this.vehicleName,
    this.name,
    this.isCompanyFollow,
    this.avaliable,
    this.driverPhoto,
    this.getCompany,
    this.getFollowCompany,
  });

  int? id,isCompanyFollow,isVerified,isDrivingVerified,role;
  String? firstName,lastName,username,email,contactNumber,verificationCode,gender,address,currentLatitude,currentLongitude,userImage,phoneCode,name,driverPhoto;
  dynamic emailVerifiedAt,lastLoginDate,createdBy,isNotificaton,licenseNumber,vehicalNumber,accountNumber,ifscCode,branchCode,licensePhoto,vehicleName,avaliable;
  DateTime? createdAt,updatedAt;
  GetCompany? getCompany;
  GetFollowCompany? getFollowCompany;

  factory ShippingCompanyDatum.fromJson(Map<String, dynamic> json) => ShippingCompanyDatum(
    id: json["id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
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
    isNotificaton: json["is_notificaton"],
    licenseNumber: json["license_number"],
    vehicalNumber: json["vehical_number"],
    currentLatitude: json["current_latitude"],
    currentLongitude: json["current_longitude"],
    accountNumber: json["account_number"],
    ifscCode: json["ifsc_code"],
    branchCode: json["branch_code"],
    userImage: json["user_image"],
    isVerified: json["is_verified"],
    isDrivingVerified: json["is_driving_verified"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    phoneCode: json["phone_code"],
    licensePhoto: json["license_photo"],
    vehicleName: json["vehicle_name"],
    name: json["name"],
    isCompanyFollow: json["is_company_follow"],
    avaliable: json["avaliable"],
    driverPhoto: json["driver_photo"],
    getCompany: json["get_company"] == null ? null : GetCompany.fromJson(json["get_company"]),
    getFollowCompany: json["get_follow_company"] == null ? null : GetFollowCompany.fromJson(json["get_follow_company"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "first_name": firstName,
    "last_name": lastName,
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
    "is_notificaton": isNotificaton,
    "license_number": licenseNumber,
    "vehical_number": vehicalNumber,
    "current_latitude": currentLatitude,
    "current_longitude": currentLongitude,
    "account_number": accountNumber,
    "ifsc_code": ifscCode,
    "branch_code": branchCode,
    "user_image": userImage,
    "is_verified": isVerified,
    "is_driving_verified": isDrivingVerified,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
    "phone_code": phoneCode,
    "license_photo": licensePhoto,
    "vehicle_name": vehicleName,
    "name": name,
    "is_company_follow": isCompanyFollow,
    "avaliable": avaliable,
    "driver_photo": driverPhoto,
    "get_company": getCompany == null ? null : getCompany!.toJson(),
    "get_follow_company": getFollowCompany!.toJson(),
  };
}

class GetCompany {
  GetCompany({this.id, this.companyId, this.driverId, this.isAvailble, this.createdAt, this.updatedAt});

  int? id,companyId,driverId,isAvailble;
  DateTime? createdAt,updatedAt;

  factory GetCompany.fromJson(Map<String, dynamic> json) => GetCompany(
    id: json["id"],
    companyId: json["company_id"],
    driverId: json["driver_id"],
    isAvailble: json["is_availble"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "company_id": companyId,
    "driver_id": driverId,
    "is_availble": isAvailble,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
  };
}

class GetFollowCompany {
  GetFollowCompany({this.id, this.companyId, this.userId, this.isCompanyFollow, this.createdAt, this.updatedAt});

  int? id,companyId,userId,isCompanyFollow;
  DateTime? createdAt,updatedAt;

  factory GetFollowCompany.fromJson(Map<String, dynamic> json) => GetFollowCompany(
    id: json["id"],
    companyId: json["company_id"],
    userId: json["user_id"],
    isCompanyFollow: json["is_company_follow"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "company_id": companyId,
    "user_id": userId,
    "is_company_follow": isCompanyFollow,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
  };
}
