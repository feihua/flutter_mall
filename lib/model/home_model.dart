import 'dart:convert';

import 'brand_list.dart';

HomeModel homeModelFromJson(String str) => HomeModel.fromJson(json.decode(str));

String homeModelToJson(HomeModel data) => json.encode(data.toJson());

class HomeModel {
  int code;
  String message;
  Data data;

  HomeModel({
    required this.code,
    required this.message,
    required this.data,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
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
  List<AdvertiseList> advertiseList;
  List<BrandListData> brandList;
  HomeFlashPromotion homeFlashPromotion;
  List<ProductList> newProductList;
  List<ProductList> hotProductList;
  List<dynamic> subjectList;

  Data({
    required this.advertiseList,
    required this.brandList,
    required this.homeFlashPromotion,
    required this.newProductList,
    required this.hotProductList,
    required this.subjectList,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        advertiseList: List<AdvertiseList>.from(json["advertiseList"].map((x) => AdvertiseList.fromJson(x))),
        brandList: List<BrandListData>.from(json["brandList"].map((x) => BrandListData.fromJson(x))),
        homeFlashPromotion: HomeFlashPromotion.fromJson(json["homeFlashPromotion"]),
        newProductList: List<ProductList>.from(json["newProductList"].map((x) => ProductList.fromJson(x))),
        hotProductList: List<ProductList>.from(json["hotProductList"].map((x) => ProductList.fromJson(x))),
        subjectList: List<dynamic>.from(json["subjectList"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "advertiseList": List<dynamic>.from(advertiseList.map((x) => x.toJson())),
        "brandList": List<dynamic>.from(brandList.map((x) => x.toJson())),
        "homeFlashPromotion": homeFlashPromotion.toJson(),
        "newProductList": List<dynamic>.from(newProductList.map((x) => x.toJson())),
        "hotProductList": List<dynamic>.from(hotProductList.map((x) => x.toJson())),
        "subjectList": List<dynamic>.from(subjectList.map((x) => x)),
      };
}

class AdvertiseList {
  int id;
  String name;
  int type;
  String pic;
  String startTime;
  String endTime;
  int status;
  int clickCount;
  int orderCount;
  String url;
  int sort;

  AdvertiseList({
    required this.id,
    required this.name,
    required this.type,
    required this.pic,
    required this.startTime,
    required this.endTime,
    required this.status,
    required this.clickCount,
    required this.orderCount,
    required this.url,
    required this.sort,
  });

  factory AdvertiseList.fromJson(Map<String, dynamic> json) => AdvertiseList(
        id: json["id"],
        name: json["name"],
        type: json["type"],
        pic: json["pic"],
        startTime: json["startTime"],
        endTime: json["endTime"],
        status: json["status"],
        clickCount: json["clickCount"],
        orderCount: json["orderCount"],
        url: json["url"],
        sort: json["sort"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
        "pic": pic,
        "startTime": startTime,
        "endTime": endTime,
        "status": status,
        "clickCount": clickCount,
        "orderCount": orderCount,
        "url": url,
        "sort": sort,
      };
}

class HomeFlashPromotion {
  String startTime;
  String endTime;
  String nextStartTime;
  String nextEndTime;
  List<ProductList> productList;

  HomeFlashPromotion({
    required this.startTime,
    required this.endTime,
    required this.nextStartTime,
    required this.nextEndTime,
    required this.productList,
  });

  factory HomeFlashPromotion.fromJson(Map<String, dynamic> json) => HomeFlashPromotion(
        startTime: json["startTime"],
        endTime: json["endTime"],
        nextStartTime: json["nextStartTime"],
        nextEndTime: json["nextEndTime"],
        productList: List<ProductList>.from(json["productList"].map((x) => ProductList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "startTime": startTime,
        "endTime": endTime,
        "nextStartTime": nextStartTime,
        "nextEndTime": nextEndTime,
        "productList": List<dynamic>.from(productList.map((x) => x.toJson())),
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
  int? promotionPrice;
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
  String? promotionStartTime;
  String? promotionEndTime;
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
        "promotionStartTime": promotionStartTime,
        "promotionEndTime": promotionEndTime,
        "promotionPerLimit": promotionPerLimit,
        "promotionType": promotionType,
        "brandName": brandName,
        "productCategoryName": productCategoryName,
        "description": description,
      };
}
