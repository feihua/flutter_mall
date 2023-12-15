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
  String firstLetter;
  int sort;
  int factoryStatus;
  int showStatus;
  int productCount;
  int productCommentCount;
  String logo;
  String? bigPic;

  BrandListData({
    required this.id,
    required this.name,
    required this.firstLetter,
    required this.sort,
    required this.factoryStatus,
    required this.showStatus,
    required this.productCount,
    required this.productCommentCount,
    required this.logo,
    required this.bigPic,
  });

  factory BrandListData.fromJson(Map<String, dynamic> json) => BrandListData(
        id: json["id"],
        name: json["name"],
        firstLetter: json["firstLetter"],
        sort: json["sort"],
        factoryStatus: json["factoryStatus"],
        showStatus: json["showStatus"],
        productCount: json["productCount"],
        productCommentCount: json["productCommentCount"],
        logo: json["logo"],
        bigPic: json["bigPic"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "firstLetter": firstLetter,
        "sort": sort,
        "factoryStatus": factoryStatus,
        "showStatus": showStatus,
        "productCount": productCount,
        "productCommentCount": productCommentCount,
        "logo": logo,
        "bigPic": bigPic,
      };
}
