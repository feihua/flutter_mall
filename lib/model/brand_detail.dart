// To parse this JSON data, do
//
//     final brandDetailModel = brandDetailModelFromJson(jsonString);

import 'dart:convert';

BrandDetailModel brandDetailModelFromJson(String str) => BrandDetailModel.fromJson(json.decode(str));

String brandDetailModelToJson(BrandDetailModel data) => json.encode(data.toJson());

class BrandDetailModel {
  int code;
  String message;
  Data data;

  BrandDetailModel({
    required this.code,
    required this.message,
    required this.data,
  });

  factory BrandDetailModel.fromJson(Map<String, dynamic> json) => BrandDetailModel(
    code: json["code"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  BrandData brandData;
  List<BrandProductData> brandProductData;

  Data({
    required this.brandData,
    required this.brandProductData,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    brandData: BrandData.fromJson(json["brandData"]),
    brandProductData: List<BrandProductData>.from(json["brandProductData"].map((x) => BrandProductData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "brandData": brandData.toJson(),
    "brandProductData": List<dynamic>.from(brandProductData.map((x) => x.toJson())),
  };
}

class BrandData {
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

  BrandData({
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

  factory BrandData.fromJson(Map<String, dynamic> json) => BrandData(
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

class BrandProductData {
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

  BrandProductData({
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

  factory BrandProductData.fromJson(Map<String, dynamic> json) => BrandProductData(
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
