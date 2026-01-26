// To parse this JSON data, do
//
//     final productListModel = productListModelFromJson(jsonString);

import 'dart:convert';

ProductListModel productListModelFromJson(String str) => ProductListModel.fromJson(json.decode(str));

String productListModelToJson(ProductListModel data) => json.encode(data.toJson());

class ProductListModel {
  int code;
  String message;
  List<ProductListData> data;

  ProductListModel({
    required this.code,
    required this.message,
    required this.data,
  });

  factory ProductListModel.fromJson(Map<String, dynamic> json) => ProductListModel(
    code: json["code"],
    message: json["message"],
    data: List<ProductListData>.from(json["data"].map((x) => ProductListData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class ProductListData {
  int id;
  String name;
  String productSn;
  int categoryId;
  String categoryIds;
  String categoryName;
  int brandId;
  String brandName;
  String unit;
  double weight;
  String keywords;
  String albumPics;
  String mainPic;
  String price;
  String priceRange;
  int publishStatus;
  int newStatus;
  int recommendStatus;
  int verifyStatus;
  int previewStatus;
  int sort;
  int newStatusSort;
  int recommendStatusSort;
  int sales;
  int stock;
  int lowStock;
  int promotionType;
  String subTitle;
  String detailHtml;
  String detailMobileHtml;

  ProductListData({
    required this.id,
    required this.name,
    required this.productSn,
    required this.categoryId,
    required this.categoryIds,
    required this.categoryName,
    required this.brandId,
    required this.brandName,
    required this.unit,
    required this.weight,
    required this.keywords,
    required this.albumPics,
    required this.mainPic,
    required this.price,
    required this.priceRange,
    required this.publishStatus,
    required this.newStatus,
    required this.recommendStatus,
    required this.verifyStatus,
    required this.previewStatus,
    required this.sort,
    required this.newStatusSort,
    required this.recommendStatusSort,
    required this.sales,
    required this.stock,
    required this.lowStock,
    required this.promotionType,
    required this.subTitle,
    required this.detailHtml,
    required this.detailMobileHtml,
  });

  factory ProductListData.fromJson(Map<String, dynamic> json) => ProductListData(
    id: json["id"],
    name: json["name"],
    productSn: json["productSn"],
    categoryId: json["categoryId"],
    categoryIds: json["categoryIds"],
    categoryName: json["categoryName"],
    brandId: json["brandId"],
    brandName: json["brandName"],
    unit: json["unit"],
    weight: json["weight"]?.toDouble(),
    keywords: json["keywords"],
    albumPics: json["albumPics"],
    mainPic: json["mainPic"],
    price: json["price"],
    priceRange: json["priceRange"],
    publishStatus: json["publishStatus"],
    newStatus: json["newStatus"],
    recommendStatus: json["recommendStatus"],
    verifyStatus: json["verifyStatus"],
    previewStatus: json["previewStatus"],
    sort: json["sort"],
    newStatusSort: json["newStatusSort"],
    recommendStatusSort: json["recommendStatusSort"],
    sales: json["sales"],
    stock: json["stock"],
    lowStock: json["lowStock"],
    promotionType: json["promotionType"],
    subTitle: json["subTitle"],
    detailHtml: json["detailHtml"],
    detailMobileHtml: json["detailMobileHtml"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "productSn": productSn,
    "categoryId": categoryId,
    "categoryIds": categoryIds,
    "categoryName": categoryName,
    "brandId": brandId,
    "brandName": brandName,
    "unit": unit,
    "weight": weight,
    "keywords": keywords,
    "albumPics": albumPics,
    "mainPic": mainPic,
    "price": price,
    "priceRange": priceRange,
    "publishStatus": publishStatus,
    "newStatus": newStatus,
    "recommendStatus": recommendStatus,
    "verifyStatus": verifyStatus,
    "previewStatus": previewStatus,
    "sort": sort,
    "newStatusSort": newStatusSort,
    "recommendStatusSort": recommendStatusSort,
    "sales": sales,
    "stock": stock,
    "lowStock": lowStock,
    "promotionType": promotionType,
    "subTitle": subTitle,
    "detailHtml": detailHtml,
    "detailMobileHtml": detailMobileHtml,
  };
}
