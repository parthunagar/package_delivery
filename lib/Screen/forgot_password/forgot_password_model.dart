// To parse this JSON data, do
//
//     final resetPasswrd = resetPasswrdFromJson(jsonString);

import 'dart:convert';

ResetPasswrd resetPasswrdFromJson(String str) => ResetPasswrd.fromJson(json.decode(str));

String resetPasswrdToJson(ResetPasswrd data) => json.encode(data.toJson());

class ResetPasswrd {
  ResetPasswrd({
    this.message,
  });

  String? message;

  factory ResetPasswrd.fromJson(Map<String, dynamic> json) => ResetPasswrd(
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
  };
}
