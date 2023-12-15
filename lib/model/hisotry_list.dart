// To parse this JSON data, do
//
//     final historyListModel = historyListModelFromJson(jsonString);

import 'dart:convert';

HistoryListModel historyListModelFromJson(String str) => HistoryListModel.fromJson(json.decode(str));

String historyListModelToJson(HistoryListModel data) => json.encode(data.toJson());

class HistoryListModel {
  int code;
  String message;
  List<HistoryListDataItem> data;

  HistoryListModel({
    required this.code,
    required this.message,
    required this.data,
  });

  factory HistoryListModel.fromJson(Map<String, dynamic> json) => HistoryListModel(
    code: json["code"],
    message: json["message"],
    data: List<HistoryListDataItem>.from(json["data"].map((x) => HistoryListDataItem.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class HistoryListDataItem {
  int id;
  int memberId;
  String memberNickName;
  String memberIcon;
  int productId;
  String productName;
  String productPic;
  String productSubTitle;
  int productPrice;
  String createTime;

  HistoryListDataItem({
    required this.id,
    required this.memberId,
    required this.memberNickName,
    required this.memberIcon,
    required this.productId,
    required this.productName,
    required this.productPic,
    required this.productSubTitle,
    required this.productPrice,
    required this.createTime,
  });

  factory HistoryListDataItem.fromJson(Map<String, dynamic> json) => HistoryListDataItem(
    id: json["id"],
    memberId: json["memberId"],
    memberNickName: json["memberNickName"],
    memberIcon: json["memberIcon"],
    productId: json["productId"],
    productName: json["productName"],
    productPic: json["productPic"],
    productSubTitle: json["productSubTitle"],
    productPrice: json["productPrice"],
    createTime: json["createTime"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "memberId": memberId,
    "memberNickName": memberNickName,
    "memberIcon": memberIcon,
    "productId": productId,
    "productName": productName,
    "productPic": productPic,
    "productSubTitle": productSubTitle,
    "productPrice": productPrice,
    "createTime": createTime,
  };
}
