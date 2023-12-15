// To parse this JSON data, do
//
//     final memberInfoModel = memberInfoModelFromJson(jsonString);

import 'dart:convert';

MemberInfoModel memberInfoModelFromJson(String str) => MemberInfoModel.fromJson(json.decode(str));

String memberInfoModelToJson(MemberInfoModel data) => json.encode(data.toJson());

class MemberInfoModel {
  int code;
  String message;
  MemberInfoData data;

  MemberInfoModel({
    required this.code,
    required this.message,
    required this.data,
  });

  factory MemberInfoModel.fromJson(Map<String, dynamic> json) => MemberInfoModel(
        code: json["code"],
        message: json["message"],
        data: MemberInfoData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data.toJson(),
      };
}

class MemberInfoData {
  int id;
  int memberLevelId;
  String username;
  String nickname;
  String phone;
  int status;
  String createTime;
  String icon;
  int gender;
  String birthday;
  String city;
  String job;
  String personalizedSignature;
  int integration;
  int growth;
  int couponCount;

  MemberInfoData({
    required this.id,
    required this.memberLevelId,
    required this.username,
    required this.nickname,
    required this.phone,
    required this.status,
    required this.createTime,
    required this.icon,
    required this.gender,
    required this.birthday,
    required this.city,
    required this.job,
    required this.personalizedSignature,
    required this.integration,
    required this.growth,
    required this.couponCount,
  });

  factory MemberInfoData.fromJson(Map<String, dynamic> json) => MemberInfoData(
        id: json["id"],
        memberLevelId: json["memberLevelId"],
        username: json["username"],
        nickname: json["nickname"],
        phone: json["phone"],
        status: json["status"],
        createTime: json["createTime"],
        icon: json["icon"],
        gender: json["gender"],
        birthday: json["birthday"],
        city: json["city"],
        job: json["job"],
        personalizedSignature: json["personalizedSignature"],
        integration: json["integration"],
        growth: json["growth"],
        couponCount: json["couponCount"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "memberLevelId": memberLevelId,
        "username": username,
        "nickname": nickname,
        "phone": phone,
        "status": status,
        "createTime": createTime,
        "icon": icon,
        "gender": gender,
        "birthday": birthday,
        "city": city,
        "job": job,
        "personalizedSignature": personalizedSignature,
        "integration": integration,
        "growth": growth,
        "couponCount": couponCount,
      };
}
