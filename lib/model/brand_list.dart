// To parse this JSON data, do
//
//     final brandListModel = brandListModelFromJson(jsonString);

import 'dart:convert';

BrandListModel brandListModelFromJson(String str) => BrandListModel.fromJson(json.decode(str));

String brandListModelToJson(BrandListModel data) => json.encode(data.toJson());

class BrandListModel {
  int code;
  String message;
  List<BrandListData> data;

  BrandListModel({
    required this.code,
    required this.message,
    required this.data,
  });

  factory BrandListModel.fromJson(Map<String, dynamic> json) => BrandListModel(
    code: json["code"],
    message: json["message"],
    data: List<BrandListData>.from(json["data"].map((x) => BrandListData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class BrandListData {
  int id;
  String name;
  String logo;
  String bigPic;
  String description;
  String firstLetter;
  int sort;
  int recommendStatus;
  int productCount;
  int productCommentCount;

  BrandListData({
    required this.id,
    required this.name,
    required this.logo,
    required this.bigPic,
    required this.description,
    required this.firstLetter,
    required this.sort,
    required this.recommendStatus,
    required this.productCount,
    required this.productCommentCount,
  });

  factory BrandListData.fromJson(Map<String, dynamic> json) => BrandListData(
    id: json["id"],
    name: json["name"],
    logo: json["logo"],
    bigPic: json["bigPic"],
    description: json["description"],
    firstLetter: json["firstLetter"],
    sort: json["sort"],
    recommendStatus: json["recommendStatus"],
    productCount: json["productCount"],
    productCommentCount: json["productCommentCount"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "logo": logo,
    "bigPic": bigPic,
    "description": description,
    "firstLetter": firstLetter,
    "sort": sort,
    "recommendStatus": recommendStatus,
    "productCount": productCount,
    "productCommentCount": productCommentCount,
  };
}
