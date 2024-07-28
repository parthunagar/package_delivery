// To parse this JSON data, do
//
//     final review = reviewFromJson(jsonString);

import 'dart:convert';

Review reviewFromJson(String str) => Review.fromJson(json.decode(str));

String reviewToJson(Review data) => json.encode(data.toJson());

class Review {
  Review({this.status, this.message, this.reviewData});

  int? status;
  String? message;
  ReviewData? reviewData;

  factory Review.fromJson(Map<String, dynamic> json) => Review(
    status: json["status"],
    message: json["message"],
    reviewData: json['data'] != null?  ReviewData.fromJson(json["data"]) : null
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": reviewData!.toJson(),
  };
}

class ReviewData {
  ReviewData({this.id, this.userId, this.ratingBy, this.ratingStar, this.ratingComment, this.createdAt, this.updatedAt});

  int? id,userId;
  String? ratingBy,ratingStar,ratingComment;
  DateTime? createdAt,updatedAt;

  factory ReviewData.fromJson(Map<String, dynamic> json) => ReviewData(
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
