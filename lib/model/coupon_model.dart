// To parse this JSON data, do
//
//     final couponModel = couponModelFromJson(jsonString);

import 'dart:convert';

CouponModel couponModelFromJson(String str) => CouponModel.fromJson(json.decode(str));

String couponModelToJson(CouponModel data) => json.encode(data.toJson());

class CouponModel {
  int code;
  String message;
  List<CouponData> data;

  CouponModel({
    required this.code,
    required this.message,
    required this.data,
  });

  factory CouponModel.fromJson(Map<String, dynamic> json) => CouponModel(
    code: json["code"],
    message: json["message"],
    data: List<CouponData>.from(json["data"].map((x) => CouponData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class CouponData {
  int id;
  int typeId;
  String name;
  String code;
  int amount;
  int minAmount;
  String startTime;
  String endTime;
  int perLimit;
  int status;
  String description;
  int scopeType;

  CouponData({
    required this.id,
    required this.typeId,
    required this.name,
    required this.code,
    required this.amount,
    required this.minAmount,
    required this.startTime,
    required this.endTime,
    required this.perLimit,
    required this.status,
    required this.description,
    required this.scopeType,
  });

  factory CouponData.fromJson(Map<String, dynamic> json) => CouponData(
    id: json["id"],
    typeId: json["typeId"],
    name: json["name"],
    code: json["code"],
    amount: json["amount"],
    minAmount: json["minAmount"],
    startTime: json["startTime"],
    endTime: json["endTime"],
    perLimit: json["perLimit"],
    status: json["status"],
    description: json["description"],
    scopeType: json["scopeType"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "typeId": typeId,
    "name": name,
    "code": code,
    "amount": amount,
    "minAmount": minAmount,
    "startTime": startTime,
    "endTime": endTime,
    "perLimit": perLimit,
    "status": status,
    "description": description,
    "scopeType": scopeType,
  };
}
