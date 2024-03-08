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
  String name;
  String imageUrl;
  List<CategoriesData>? children;

  CategoriesData({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.children,
  });

  factory CategoriesData.fromJson(Map<String, dynamic> json) => CategoriesData(
    id: json["id"],
    name: json["name"],
    imageUrl: json["imageUrl"],
    children: json["children"] == null ? [] : List<CategoriesData>.from(json["children"]!.map((x) => CategoriesData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "imageUrl": imageUrl,
    "children": children == null ? [] : List<dynamic>.from(children!.map((x) => x.toJson())),
  };
}
