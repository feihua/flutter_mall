// To parse this JSON data, do
//
//     final collectionListModel = collectionListModelFromJson(jsonString);

import 'dart:convert';

CollectionListModel collectionListModelFromJson(String str) => CollectionListModel.fromJson(json.decode(str));

String collectionListModelToJson(CollectionListModel data) => json.encode(data.toJson());

class CollectionListModel {
  int code;
  String message;
  List<CollectionListData> data;

  CollectionListModel({
    required this.code,
    required this.message,
    required this.data,
  });

  factory CollectionListModel.fromJson(Map<String, dynamic> json) => CollectionListModel(
    code: json["code"],
    message: json["message"],
    data: List<CollectionListData>.from(json["data"].map((x) => CollectionListData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class CollectionListData {
  int id;
  int memberId;
  String memberNickName;
  String memberIcon;
  int productId;
  String productName;
  String productPic;
  String productSubTitle;
  int productPrice;
  DateTime createTime;

  CollectionListData({
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

  factory CollectionListData.fromJson(Map<String, dynamic> json) => CollectionListData(
    id: json["id"],
    memberId: json["memberId"],
    memberNickName: json["memberNickName"],
    memberIcon: json["memberIcon"],
    productId: json["productId"],
    productName: json["productName"],
    productPic: json["productPic"],
    productSubTitle: json["productSubTitle"],
    productPrice: json["productPrice"],
    createTime: DateTime.parse(json["createTime"]),
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
    "createTime": createTime.toIso8601String(),
  };
}
