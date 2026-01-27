// To parse this JSON data, do
//
//     final attentionListModel = attentionListModelFromJson(jsonString);

import 'dart:convert';

AttentionListModel attentionListModelFromJson(String str) => AttentionListModel.fromJson(json.decode(str));

String attentionListModelToJson(AttentionListModel data) => json.encode(data.toJson());

class AttentionListModel {
  List<AttentionListData> data;
  bool success;
  int code;
  String message;

  AttentionListModel({
    required this.data,
    required this.success,
    required this.code,
    required this.message,
  });

  factory AttentionListModel.fromJson(Map<String, dynamic> json) => AttentionListModel(
    data: List<AttentionListData>.from(json["data"].map((x) => AttentionListData.fromJson(x))),
    success: json["success"],
    code: json["code"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "success": success,
    "code": code,
    "message": message,
  };
}

class AttentionListData {
  String id;
  int memberId;
  String memberNickName;
  String memberIcon;
  int brandId;
  String brandName;
  String brandLogo;
  String brandCity;
  DateTime createTime;

  AttentionListData({
    required this.id,
    required this.memberId,
    required this.memberNickName,
    required this.memberIcon,
    required this.brandId,
    required this.brandName,
    required this.brandLogo,
    required this.brandCity,
    required this.createTime,
  });

  factory AttentionListData.fromJson(Map<String, dynamic> json) => AttentionListData(
    id: json["id"],
    memberId: json["memberId"],
    memberNickName: json["memberNickName"],
    memberIcon: json["memberIcon"],
    brandId: json["brandId"],
    brandName: json["brandName"],
    brandLogo: json["brandLogo"],
    brandCity: json["brandCity"],
    createTime: DateTime.parse(json["createTime"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "memberId": memberId,
    "memberNickName": memberNickName,
    "memberIcon": memberIcon,
    "brandId": brandId,
    "brandName": brandName,
    "brandLogo": brandLogo,
    "brandCity": brandCity,
    "createTime": createTime.toIso8601String(),
  };
}
