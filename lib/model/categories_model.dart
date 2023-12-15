// To parse this JSON data, do
//
//     final categoriesModel = categoriesModelFromJson(jsonString);

import 'dart:convert';

CategoriesModel categoriesModelFromJson(String str) => CategoriesModel.fromJson(json.decode(str));

String categoriesModelToJson(CategoriesModel data) => json.encode(data.toJson());

class CategoriesModel {
  int code;
  String message;
  List<CategoriesData> data;

  CategoriesModel({
    required this.code,
    required this.message,
    required this.data,
  });

  factory CategoriesModel.fromJson(Map<String, dynamic> json) => CategoriesModel(
        code: json["code"],
        message: json["message"],
        data: List<CategoriesData>.from(json["data"].map((x) => CategoriesData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class CategoriesData {
  int id;
  int parentId;
  String name;
  int level;
  int productCount;
  String productUnit;
  int navStatus;
  int showStatus;
  int sort;
  String keywords;
  String? icon;

  CategoriesData({
    required this.id,
    required this.parentId,
    required this.name,
    required this.level,
    required this.productCount,
    required this.productUnit,
    required this.navStatus,
    required this.showStatus,
    required this.sort,
    required this.keywords,
    this.icon,
  });

  factory CategoriesData.fromJson(Map<String, dynamic> json) => CategoriesData(
        id: json["id"],
        parentId: json["parentId"],
        name: json["name"],
        level: json["level"],
        productCount: json["productCount"],
        productUnit: json["productUnit"],
        navStatus: json["navStatus"],
        showStatus: json["showStatus"],
        sort: json["sort"],
        keywords: json["keywords"],
        icon: json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "parentId": parentId,
        "name": name,
        "level": level,
        "productCount": productCount,
        "productUnit": productUnit,
        "navStatus": navStatus,
        "showStatus": showStatus,
        "sort": sort,
        "keywords": keywords,
        "icon": icon,
      };
}
