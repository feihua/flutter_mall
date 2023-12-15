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
  int type;
  String name;
  int platform;
  int count;
  int amount;
  int perLimit;
  int minPoint;
  String startTime;
  String endTime;
  int useType;
  int publishCount;
  int useCount;
  int receiveCount;
  String enableTime;

  CouponData({
    required this.id,
    required this.type,
    required this.name,
    required this.platform,
    required this.count,
    required this.amount,
    required this.perLimit,
    required this.minPoint,
    required this.startTime,
    required this.endTime,
    required this.useType,
    required this.publishCount,
    required this.useCount,
    required this.receiveCount,
    required this.enableTime,
  });

  factory CouponData.fromJson(Map<String, dynamic> json) => CouponData(
        id: json["id"],
        type: json["type"],
        name: json["name"],
        platform: json["platform"],
        count: json["count"],
        amount: json["amount"],
        perLimit: json["perLimit"],
        minPoint: json["minPoint"],
        startTime: json["startTime"],
        endTime: json["endTime"],
        useType: json["useType"],
        publishCount: json["publishCount"],
        useCount: json["useCount"],
        receiveCount: json["receiveCount"],
        enableTime: json["enableTime"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "name": name,
        "platform": platform,
        "count": count,
        "amount": amount,
        "perLimit": perLimit,
        "minPoint": minPoint,
        "startTime": startTime,
        "endTime": endTime,
        "useType": useType,
        "publishCount": publishCount,
        "useCount": useCount,
        "receiveCount": receiveCount,
        "enableTime": enableTime,
      };
}
