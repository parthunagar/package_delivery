// To parse this JSON data, do
//
//     final editProfile = editProfileFromJson(jsonString);

import 'dart:convert';

EditProfile editProfileFromJson(String str) => EditProfile.fromJson(json.decode(str));

String editProfileToJson(EditProfile data) => json.encode(data.toJson());

class EditProfile {
  EditProfile({
    this.status,
    this.message,
    this.editProfileData,
  });

  int? status;
  String? message;
  EditProfileData? editProfileData;

  factory EditProfile.fromJson(Map<String, dynamic> json) => EditProfile(
    status: json["status"],
    message: json["message"],
    editProfileData: json['data'] != null ? EditProfileData.fromJson(json["data"]) : null
    // editProfileData: EditProfileData.fromJson(json["EditProfileData"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": editProfileData!.toJson(),
  };
}

class EditProfileData {
  EditProfileData({
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
    this.driverPhoto,
    this.getRole,
  });

  int? id;
  int? role,isVerified,isDrivingVerified;
  String? gender,contactNumber,address,phoneCode,firstName,lastName,username,email;
  dynamic emailVerifiedAt;
  dynamic verificationCode;
  dynamic lastLoginDate;
  dynamic createdBy;
  dynamic isNotificaton;
  dynamic licenseNumber;
  dynamic vehicalNumber;
  dynamic currentLatitude;
  dynamic currentLongitude;
  dynamic accountNumber;
  dynamic ifscCode;
  dynamic branchCode;
  dynamic userImage;
  DateTime? createdAt,updatedAt;
  dynamic licensePhoto;
  dynamic vehicleName;
  dynamic driverPhoto;
  GetRole? getRole;

  factory EditProfileData.fromJson(Map<String, dynamic> json) => EditProfileData(
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
    driverPhoto: json["driver_photo"],
    getRole: GetRole.fromJson(json["get_role"]),
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
    "driver_photo": driverPhoto,
    "get_role": getRole!.toJson(),
  };
}

class GetRole {
  GetRole({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  DateTime? createdAt,updatedAt;

  factory GetRole.fromJson(Map<String, dynamic> json) => GetRole(
    id: json["id"],
    name: json["name"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
  };
}

// // To parse this JSON data, do
// //
// //     final editProfile = editProfileFromJson(jsonString);
//
// import 'dart:convert';
//
// EditProfile editProfileFromJson(String str) => EditProfile.fromJson(json.decode(str));
//
// String editProfileToJson(EditProfile data) => json.encode(data.toJson());
//
// class EditProfile {
//   EditProfile({
//     required this.status,
//     required this.message,
//     required this.editProfileData,
//   });
//
//   int status;
//   String message;
//   EditProfileData? editProfileData;
//
//   factory EditProfile.fromJson(Map<String, dynamic> json) => EditProfile(
//     status: json["status"],
//     message: json["message"],
//     editProfileData: json['data'] != null ? EditProfileData.fromJson(json["data"]) : null
//     // editProfileData: EditProfileData.fromJson(json["data"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "status": status,
//     "message": message,
//     "data": editProfileData!.toJson(),
//   };
// }
//
// class EditProfileData {
//   EditProfileData({
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
//     required this.getRole,
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
//   // dynamic country;
//   // dynamic state;
//   // dynamic city;
//   // dynamic postalCode;
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
//   GetRole? getRole;
//
//   factory EditProfileData.fromJson(Map<String, dynamic> json) => EditProfileData(
//     id: json["id"],
//     name: json["name"] ?? '',
//     username: json["username"] ?? '',
//     email: json["email"] ?? '',
//     emailVerifiedAt: json["email_verified_at"] ?? '',
//     contactNumber: json["contact_number"] ?? '',
//     verificationCode: json["verification_code"] ?? '',
//     role: json["role"] ?? 6,
//     gender: json["gender"] ?? 2,
//     lastLoginDate: json["last_login_date"] ?? '',
//     createdBy: json["created_by"] ?? '',
//     address: json["address"]?? '',
//     country: json["country"]?? '',
//     state: json["state"]?? '',
//     city: json["city"]?? '',
//     postalCode: json["postal_code"]?? '',
//     isNotificaton: json["is_notificaton"] ?? '',
//     licenseNumber: json["license_number"] ?? '',
//     vehicalNumber: json["vehical_number"] ?? '',
//     currentLatitude: json["current_latitude"] ?? '',
//     currentLongitude: json["current_longitude"] ?? '',
//     isVerified: json["is_verified"],
//     isDrivingVerified: json["is_driving_verified"],
//     isCompanyFollow: json["is_company_follow"],
//     accountNumber: json["account_number"] ?? '',
//     ifscCode: json["ifsc_code"] ?? '',
//     branchCode: json["branch_code"] ?? '',
//     driverPhoto: json["driver_photo"] ?? '',
//     createdAt: DateTime.parse(json["created_at"]),
//     updatedAt: DateTime.parse(json["updated_at"]),
//     getRole: json['get_role'] != null ? GetRole.fromJson(json["get_role"]) : null ,//GetRole.fromJson(json["get_role"]),
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
//     "get_role": getRole!.toJson(),
//   };
// }
//
// class GetRole {
//   GetRole({
//     required this.id,
//     required this.name,
//     required this.createdAt,
//     required this.updatedAt,
//   });
//
//   int id;
//   String name;
//   DateTime createdAt;
//   DateTime updatedAt;
//
//   factory GetRole.fromJson(Map<String, dynamic> json) => GetRole(
//     id: json["id"],
//     name: json["name"],
//     createdAt: DateTime.parse(json["created_at"]),
//     updatedAt: DateTime.parse(json["updated_at"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "name": name,
//     "created_at": createdAt.toIso8601String(),
//     "updated_at": updatedAt.toIso8601String(),
//   };
// }
//
// //
// // // To parse this JSON data, do
// // //
// // //     final editProfile = editProfileFromJson(jsonString);
// //
// // import 'dart:convert';
// //
// // EditProfile editProfileFromJson(String str) => EditProfile.fromJson(json.decode(str));
// //
// // String editProfileToJson(EditProfile data) => json.encode(data.toJson());
// //
// // class EditProfile {
// //   EditProfile({
// //     required required this.status,
// //     required required this.message,
// //     required required this.editProfileData,
// //   });
// //
// //   int status;
// //   String message;
// //   EditProfileData? editProfileData;
// //
// //   factory EditProfile.fromJson(Map<String, dynamic> json) => EditProfile(
// //     status: json["status"],
// //     message: json["message"],
// //     editProfileData: json['data'] != null ? EditProfileData.fromJson(json["data"]) : null
// //   );
// //
// //   Map<String, dynamic> toJson() => {
// //     "status": status,
// //     "message": message,
// //     "EditProfileData": editProfileData!.toJson(),
// //   };
// // }
// //
// // class EditProfileData {
// //   EditProfileData({
// //     required required this.id, required required this.name, required required this.username, required required this.email, required required this.emailVerifiedAt, required required this.contactNumber, required required this.verificationCode,
// //     required required this.role, required required this.gender, required required this.lastLoginDate, required required this.createdBy, required required this.address, required required this.country, required required this.state,
// //     required required this.city, required required this.postalCode, required required this.isNotificaton, required required this.licenseNumber, required required this.vehicalNumber, required required this.currentLatitude,
// //     required required this.currentLongitude, required required this.isVerified, required required this.isDrivingVerified, required required this.isCompanyFollow, required required this.accountNumber, required required this.ifscCode,
// //     required required this.branchCode, required required this.driverPhoto, required required this.createdAt, required required this.updatedAt,
// //   });
// //
// //   int id,role,gender,isVerified,isDrivingVerified,isCompanyFollow;
// //   String name,username,email,contactNumber,verificationCode,address,currentLatitude,currentLongitude,accountNumber,ifscCode,branchCode,driverPhoto;
// //   DateTime createdAt,updatedAt;
// //   dynamic emailVerifiedAt,lastLoginDate,createdBy,country,state,city,postalCode,isNotificaton,licenseNumber,vehicalNumber;
// //
// //   factory EditProfileData.fromJson(Map<String, dynamic> json) => EditProfileData(
// //     id: json["id"],
// //     name: json["name"],
// //     username: json["username"],
// //     email: json["email"],
// //     emailVerifiedAt: json["email_verified_at"],
// //     contactNumber: json["contact_number"],
// //     verificationCode: json["verification_code"],
// //     role: json["role"],
// //     gender: json["gender"],
// //     lastLoginDate: json["last_login_date"],
// //     createdBy: json["created_by"],
// //     address: json["address"],
// //     country: json["country"],
// //     state: json["state"],
// //     city: json["city"],
// //     postalCode: json["postal_code"],
// //     isNotificaton: json["is_notificaton"],
// //     licenseNumber: json["license_number"],
// //     vehicalNumber: json["vehical_number"],
// //     currentLatitude: json["current_latitude"],
// //     currentLongitude: json["current_longitude"],
// //     isVerified: json["is_verified"],
// //     isDrivingVerified: json["is_driving_verified"],
// //     isCompanyFollow: json["is_company_follow"],
// //     accountNumber: json["account_number"],
// //     ifscCode: json["ifsc_code"],
// //     branchCode: json["branch_code"],
// //     driverPhoto: json["driver_photo"],
// //     createdAt: DateTime.parse(json["created_at"]),
// //     updatedAt: DateTime.parse(json["updated_at"]),
// //   );
// //
// //   Map<String, dynamic> toJson() => {
// //     "id": id,
// //     "name": name,
// //     "username": username,
// //     "email": email,
// //     "email_verified_at": emailVerifiedAt,
// //     "contact_number": contactNumber,
// //     "verification_code": verificationCode,
// //     "role": role,
// //     "gender": gender,
// //     "last_login_date": lastLoginDate,
// //     "created_by": createdBy,
// //     "address": address,
// //     "country": country,
// //     "state": state,
// //     "city": city,
// //     "postal_code": postalCode,
// //     "is_notificaton": isNotificaton,
// //     "license_number": licenseNumber,
// //     "vehical_number": vehicalNumber,
// //     "current_latitude": currentLatitude,
// //     "current_longitude": currentLongitude,
// //     "is_verified": isVerified,
// //     "is_driving_verified": isDrivingVerified,
// //     "is_company_follow": isCompanyFollow,
// //     "account_number": accountNumber,
// //     "ifsc_code": ifscCode,
// //     "branch_code": branchCode,
// //     "driver_photo": driverPhoto,
// //     "created_at": createdAt.toIso8601String(),
// //     "updated_at": updatedAt.toIso8601String(),
// //   };
// // }
// //
