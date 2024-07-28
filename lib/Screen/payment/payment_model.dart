// To parse this JSON data, do
//
//     final paymentStore = paymentStoreFromJson(jsonString);

import 'dart:convert';

PaymentStore paymentStoreFromJson(String str) => PaymentStore.fromJson(json.decode(str));

String paymentStoreToJson(PaymentStore data) => json.encode(data.toJson());

class PaymentStore {
  PaymentStore({
    this.status,
    this.message,
    this.paymentStoreData,
  });

  int? status;
  String? message;
  PaymentStoreData? paymentStoreData;

  factory PaymentStore.fromJson(Map<String, dynamic> json) => PaymentStore(
    status: json["status"],
    message: json["message"],
    paymentStoreData: json['data'] != null ? PaymentStoreData.fromJson(json["data"]) : null
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": paymentStoreData!.toJson(),
  };
}

class PaymentStoreData {
  PaymentStoreData({
    this.id,
    this.trackingId,
    this.finalAmount,
    this.transcationId,
    this.paymentType,
  });

  int? id;
  String? trackingId,finalAmount,transcationId,paymentType;

  factory PaymentStoreData.fromJson(Map<String, dynamic> json) => PaymentStoreData(
    id: json["id"],
    trackingId: json["tracking_id"],
    finalAmount: json["final_amount"],
    transcationId: json["transcation_id"],
    paymentType: json["payment_type"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "tracking_id": trackingId,
    "final_amount": finalAmount,
    "transcation_id": transcationId,
    "payment_type": paymentType,
  };
}
