// To parse this JSON data, do
//
//     final homeModel = homeModelFromJson(jsonString);

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
  List<SubjectList> subjectList;

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
    subjectList: List<SubjectList>.from(json["subjectList"].map((x) => SubjectList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "advertiseList": List<dynamic>.from(advertiseList.map((x) => x.toJson())),
    "brandList": List<dynamic>.from(brandList.map((x) => x.toJson())),
    "homeFlashPromotion": homeFlashPromotion.toJson(),
    "newProductList": List<dynamic>.from(newProductList.map((x) => x.toJson())),
    "hotProductList": List<dynamic>.from(hotProductList.map((x) => x.toJson())),
    "subjectList": List<dynamic>.from(subjectList.map((x) => x.toJson())),
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
  String remark;
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
    required this.remark,
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
    remark: json["remark"],
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
    "remark": remark,
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

  ProductList({
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

  factory ProductList.fromJson(Map<String, dynamic> json) => ProductList(
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

class SubjectList {
  int id;
  int categoryId;
  String title;
  String pic;
  int productCount;
  int recommendStatus;
  int collectCount;
  int readCount;
  int commentCount;
  String albumPics;
  String description;
  int showStatus;
  String content;
  int forwardCount;
  String categoryName;
  int sort;

  SubjectList({
    required this.id,
    required this.categoryId,
    required this.title,
    required this.pic,
    required this.productCount,
    required this.recommendStatus,
    required this.collectCount,
    required this.readCount,
    required this.commentCount,
    required this.albumPics,
    required this.description,
    required this.showStatus,
    required this.content,
    required this.forwardCount,
    required this.categoryName,
    required this.sort,
  });

  factory SubjectList.fromJson(Map<String, dynamic> json) => SubjectList(
    id: json["id"],
    categoryId: json["categoryId"],
    title: json["title"],
    pic: json["pic"],
    productCount: json["productCount"],
    recommendStatus: json["recommendStatus"],
    collectCount: json["collectCount"],
    readCount: json["readCount"],
    commentCount: json["commentCount"],
    albumPics: json["albumPics"],
    description: json["description"],
    showStatus: json["showStatus"],
    content: json["content"],
    forwardCount: json["forwardCount"],
    categoryName: json["categoryName"],
    sort: json["sort"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "categoryId": categoryId,
    "title": title,
    "pic": pic,
    "productCount": productCount,
    "recommendStatus": recommendStatus,
    "collectCount": collectCount,
    "readCount": readCount,
    "commentCount": commentCount,
    "albumPics": albumPics,
    "description": description,
    "showStatus": showStatus,
    "content": content,
    "forwardCount": forwardCount,
    "categoryName": categoryName,
    "sort": sort,
  };
}
