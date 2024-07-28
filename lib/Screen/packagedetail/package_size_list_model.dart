// To parse this JSON data, do
//
//     final packageSizeList = packageSizeListFromJson(jsonString);

import 'dart:convert';

PackageSizeList packageSizeListFromJson(String str) => PackageSizeList.fromJson(json.decode(str));

String packageSizeListToJson(PackageSizeList data) => json.encode(data.toJson());

class PackageSizeList {
  PackageSizeList({
    this.status,
    this.message,
    this.packageSize,
  });

  int? status;
  String? message;
  List<PackageSize>? packageSize;

  factory PackageSizeList.fromJson(Map<String, dynamic> json) => PackageSizeList(
    status: json["status"] == null ? null : json["status"],
    message: json["message"] == null ? null : json["message"],
    packageSize: json["data"] == null ? null : List<PackageSize>.from(json["data"].map((x) => PackageSize.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "message": message == null ? null : message,
    "data": packageSize == null ? null : List<dynamic>.from(packageSize!.map((x) => x.toJson())),
  };
}

class PackageSize {
  PackageSize({
    this.id,
    this.packageSizeName,
    this.packagePrice,
    this.packageStatus,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? packageSizeName;
  String? packagePrice;
  int? packageStatus;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory PackageSize.fromJson(Map<String, dynamic> json) => PackageSize(
    id: json["id"] == null ? null : json["id"],
    packageSizeName: json["package_size_name"] == null ? null : json["package_size_name"],
    packagePrice: json["package_price"] == null ? null : json["package_price"],
    packageStatus: json["package_status"] == null ? null : json["package_status"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "package_size_name": packageSizeName == null ? null : packageSizeName,
    "package_price": packagePrice == null ? null : packagePrice,
    "package_status": packageStatus == null ? null : packageStatus,
    "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
  };
}
