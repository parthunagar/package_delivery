// To parse this JSON data, do
//
//     final otpVerification = otpVerificationFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

OtpVerification otpVerificationFromJson(String str) => OtpVerification.fromJson(json.decode(str));

String otpVerificationToJson(OtpVerification data) => json.encode(data.toJson());

class OtpVerification {
  OtpVerification({
    required this.status,
    required this.message,
  });

  int status;
  String message;

  factory OtpVerification.fromJson(Map<String, dynamic> json) => OtpVerification(
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
  };
}
