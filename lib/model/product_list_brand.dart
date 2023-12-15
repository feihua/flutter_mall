// To parse this JSON data, do
//
//     final productListBrandModel = productListBrandModelFromJson(jsonString);

import 'dart:convert';

ProductListBrandModel productListBrandModelFromJson(String str) => ProductListBrandModel.fromJson(json.decode(str));

String productListBrandModelToJson(ProductListBrandModel data) => json.encode(data.toJson());

class ProductListBrandModel {
  int code;
  String message;
  ProductListBrandData data;

  ProductListBrandModel({
    required this.code,
    required this.message,
    required this.data,
  });

  factory ProductListBrandModel.fromJson(Map<String, dynamic> json) => ProductListBrandModel(
        code: json["code"],
        message: json["message"],
        data: ProductListBrandData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data.toJson(),
      };
}

class ProductListBrandData {
  int pageNum;
  int pageSize;
  int totalPage;
  int total;
  List<ProductListBrandDataItem> list;

  ProductListBrandData({
    required this.pageNum,
    required this.pageSize,
    required this.totalPage,
    required this.total,
    required this.list,
  });

  factory ProductListBrandData.fromJson(Map<String, dynamic> json) => ProductListBrandData(
        pageNum: json["pageNum"],
        pageSize: json["pageSize"],
        totalPage: json["totalPage"],
        total: json["total"],
        list: List<ProductListBrandDataItem>.from(json["list"].map((x) => ProductListBrandDataItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "pageNum": pageNum,
        "pageSize": pageSize,
        "totalPage": totalPage,
        "total": total,
        "list": List<dynamic>.from(list.map((x) => x.toJson())),
      };
}

class ProductListBrandDataItem {
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
  double price;
  double? promotionPrice;
  int giftGrowth;
  int giftPoint;
  int usePointLimit;
  String subTitle;
  double originalPrice;
  int stock;
  int lowStock;
  String unit;
  double weight;
  int previewStatus;
  String serviceIds;
  String keywords;
  String note;
  String albumPics;
  String detailTitle;
  DateTime? promotionStartTime;
  DateTime? promotionEndTime;
  int promotionPerLimit;
  int promotionType;
  String brandName;
  String productCategoryName;

  ProductListBrandDataItem({
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
    this.promotionPrice,
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
    this.promotionStartTime,
    this.promotionEndTime,
    required this.promotionPerLimit,
    required this.promotionType,
    required this.brandName,
    required this.productCategoryName,
  });

  factory ProductListBrandDataItem.fromJson(Map<String, dynamic> json) => ProductListBrandDataItem(
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
        promotionPrice: json["promotionPrice"],
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
        promotionStartTime: json["promotionStartTime"] == null ? null : DateTime.parse(json["promotionStartTime"]),
        promotionEndTime: json["promotionEndTime"] == null ? null : DateTime.parse(json["promotionEndTime"]),
        promotionPerLimit: json["promotionPerLimit"],
        promotionType: json["promotionType"],
        brandName: json["brandName"],
        productCategoryName: json["productCategoryName"],
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
        "promotionPrice": promotionPrice,
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
        "promotionStartTime": promotionStartTime?.toIso8601String(),
        "promotionEndTime": promotionEndTime?.toIso8601String(),
        "promotionPerLimit": promotionPerLimit,
        "promotionType": promotionType,
        "brandName": brandName,
        "productCategoryName": productCategoryName,
      };
}
