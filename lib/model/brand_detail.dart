// To parse this JSON data, do
//
//     final brandDetailModel = brandDetailModelFromJson(jsonString);

import 'dart:convert';

BrandDetailModel brandDetailModelFromJson(String str) => BrandDetailModel.fromJson(json.decode(str));

String brandDetailModelToJson(BrandDetailModel data) => json.encode(data.toJson());

class BrandDetailModel {
  int code;
  String message;
  BrandDetailData data;

  BrandDetailModel({
    required this.code,
    required this.message,
    required this.data,
  });

  factory BrandDetailModel.fromJson(Map<String, dynamic> json) => BrandDetailModel(
        code: json["code"],
        message: json["message"],
        data: BrandDetailData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data.toJson(),
      };
}

class BrandDetailData {
  int id;
  String name;
  String firstLetter;
  int sort;
  int factoryStatus;
  int showStatus;
  int productCount;
  int productCommentCount;
  String logo;
  String bigPic;
  String brandStory;
  List<ProductList>? productList;

  BrandDetailData({
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
    required this.brandStory,
    this.productList,
  });

  factory BrandDetailData.fromJson(Map<String, dynamic> json) => BrandDetailData(
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
        brandStory: json["brandStory"],
        productList: List<ProductList>.from(json["productList"]?.map((x) => ProductList.fromJson(x))),
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
        "brandStory": brandStory,
        "productList": List<dynamic>.from(productList!.map((x) => x.toJson())),
      };
}

class ProductList {
  int id;
  int brandId;
  int productCategoryId;
  int feightTemplateId;
  int productAttributeCategoryId;
  String name;
  String pic;
  String productSn;
  int deleteStatus;
  int publishStatus;
  int newStatus;
  int recommandStatus;
  int verifyStatus;
  int sort;
  int sale;
  int price;
  int giftGrowth;
  int giftPoint;
  int usePointLimit;
  String subTitle;
  int originalPrice;
  int stock;
  int lowStock;
  String unit;
  int weight;
  int previewStatus;
  String serviceIds;
  String keywords;
  String note;
  String albumPics;
  String detailTitle;
  String promotionStartTime;
  String promotionEndTime;
  int promotionPerLimit;
  int promotionType;
  String brandName;
  String productCategoryName;
  String description;

  ProductList({
    required this.id,
    required this.brandId,
    required this.productCategoryId,
    required this.feightTemplateId,
    required this.productAttributeCategoryId,
    required this.name,
    required this.pic,
    required this.productSn,
    required this.deleteStatus,
    required this.publishStatus,
    required this.newStatus,
    required this.recommandStatus,
    required this.verifyStatus,
    required this.sort,
    required this.sale,
    required this.price,
    required this.giftGrowth,
    required this.giftPoint,
    required this.usePointLimit,
    required this.subTitle,
    required this.originalPrice,
    required this.stock,
    required this.lowStock,
    required this.unit,
    required this.weight,
    required this.previewStatus,
    required this.serviceIds,
    required this.keywords,
    required this.note,
    required this.albumPics,
    required this.detailTitle,
    required this.promotionStartTime,
    required this.promotionEndTime,
    required this.promotionPerLimit,
    required this.promotionType,
    required this.brandName,
    required this.productCategoryName,
    required this.description,
  });

  factory ProductList.fromJson(Map<String, dynamic> json) => ProductList(
        id: json["id"],
        brandId: json["brandId"],
        productCategoryId: json["productCategoryId"],
        feightTemplateId: json["feightTemplateId"],
        productAttributeCategoryId: json["productAttributeCategoryId"],
        name: json["name"],
        pic: json["pic"],
        productSn: json["productSn"],
        deleteStatus: json["deleteStatus"],
        publishStatus: json["publishStatus"],
        newStatus: json["newStatus"],
        recommandStatus: json["recommandStatus"],
        verifyStatus: json["verifyStatus"],
        sort: json["sort"],
        sale: json["sale"],
        price: json["price"],
        giftGrowth: json["giftGrowth"],
        giftPoint: json["giftPoint"],
        usePointLimit: json["usePointLimit"],
        subTitle: json["subTitle"],
        originalPrice: json["originalPrice"],
        stock: json["stock"],
        lowStock: json["lowStock"],
        unit: json["unit"],
        weight: json["weight"],
        previewStatus: json["previewStatus"],
        serviceIds: json["serviceIds"],
        keywords: json["keywords"],
        note: json["note"],
        albumPics: json["albumPics"],
        detailTitle: json["detailTitle"],
        promotionStartTime: json["promotionStartTime"],
        promotionEndTime: json["promotionEndTime"],
        promotionPerLimit: json["promotionPerLimit"],
        promotionType: json["promotionType"],
        brandName: json["brandName"],
        productCategoryName: json["productCategoryName"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "brandId": brandId,
        "productCategoryId": productCategoryId,
        "feightTemplateId": feightTemplateId,
        "productAttributeCategoryId": productAttributeCategoryId,
        "name": name,
        "pic": pic,
        "productSn": productSn,
        "deleteStatus": deleteStatus,
        "publishStatus": publishStatus,
        "newStatus": newStatus,
        "recommandStatus": recommandStatus,
        "verifyStatus": verifyStatus,
        "sort": sort,
        "sale": sale,
        "price": price,
        "giftGrowth": giftGrowth,
        "giftPoint": giftPoint,
        "usePointLimit": usePointLimit,
        "subTitle": subTitle,
        "originalPrice": originalPrice,
        "stock": stock,
        "lowStock": lowStock,
        "unit": unit,
        "weight": weight,
        "previewStatus": previewStatus,
        "serviceIds": serviceIds,
        "keywords": keywords,
        "note": note,
        "albumPics": albumPics,
        "detailTitle": detailTitle,
        "promotionStartTime": promotionStartTime,
        "promotionEndTime": promotionEndTime,
        "promotionPerLimit": promotionPerLimit,
        "promotionType": promotionType,
        "brandName": brandName,
        "productCategoryName": productCategoryName,
        "description": description,
      };
}
