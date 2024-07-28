// To parse this JSON data, do
//
//     final followUnfollow = followUnfollowFromJson(jsonString);

import 'dart:convert';

FollowUnfollow followUnfollowFromJson(String str) => FollowUnfollow.fromJson(json.decode(str));

String followUnfollowToJson(FollowUnfollow data) => json.encode(data.toJson());

class FollowUnfollow {
  FollowUnfollow({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  FollowUnfollowData? data;

  factory FollowUnfollow.fromJson(Map<String, dynamic> json) => FollowUnfollow(
    status: json["status"],
    message: json["message"],
    data: json['data'] != null ?  FollowUnfollowData.fromJson(json["data"]) : null
    // data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data!.toJson(),
  };
}

class FollowUnfollowData {
  FollowUnfollowData({
    this.id,
    this.companyId,
    this.userId,
    this.isCompanyFollow,
    this.createdAt,
    this.updatedAt,
  });

  int? id,companyId,userId,isCompanyFollow;
  DateTime? createdAt,updatedAt;

  factory FollowUnfollowData.fromJson(Map<String, dynamic> json) => FollowUnfollowData(
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
