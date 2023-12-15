// To parse this JSON data, do
//
//     final productDetailModel = productDetailModelFromJson(jsonString);

import 'dart:convert';

ProductDetailModel productDetailModelFromJson(String str) => ProductDetailModel.fromJson(json.decode(str));

String productDetailModelToJson(ProductDetailModel data) => json.encode(data.toJson());

class ProductDetailModel {
  int code;
  String message;
  ProductDetailData data;

  ProductDetailModel({
    required this.code,
    required this.message,
    required this.data,
  });

  factory ProductDetailModel.fromJson(Map<String, dynamic> json) => ProductDetailModel(
        code: json["code"],
        message: json["message"],
        data: ProductDetailData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data.toJson(),
      };
}

class ProductDetailData {
  Product product;
  Brand brand;
  List<ProductAttributeList> productAttributeList;
  List<ProductAttributeValueList> productAttributeValueList;
  List<SkuStockList> skuStockList;
  List<CouponList> couponList;

  ProductDetailData({
    required this.product,
    required this.brand,
    required this.productAttributeList,
    required this.productAttributeValueList,
    required this.skuStockList,
    required this.couponList,
  });

  factory ProductDetailData.fromJson(Map<String, dynamic> json) => ProductDetailData(
        product: Product.fromJson(json["product"]),
        brand: Brand.fromJson(json["brand"]),
        productAttributeList:
            List<ProductAttributeList>.from(json["productAttributeList"].map((x) => ProductAttributeList.fromJson(x))),
        productAttributeValueList: List<ProductAttributeValueList>.from(
            json["productAttributeValueList"].map((x) => ProductAttributeValueList.fromJson(x))),
        skuStockList: List<SkuStockList>.from(json["skuStockList"].map((x) => SkuStockList.fromJson(x))),
        couponList: List<CouponList>.from(json["couponList"].map((x) => CouponList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "product": product.toJson(),
        "brand": brand.toJson(),
        "productAttributeList": List<dynamic>.from(productAttributeList.map((x) => x.toJson())),
        "productAttributeValueList": List<dynamic>.from(productAttributeValueList.map((x) => x.toJson())),
        "skuStockList": List<dynamic>.from(skuStockList.map((x) => x.toJson())),
        "couponList": List<dynamic>.from(couponList.map((x) => x.toJson())),
      };
}

class Brand {
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

  Brand({
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
  });

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
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
      };
}

class CouponList {
  int id;
  int type;
  String name;
  int platform;
  int count;
  int amount;
  int perLimit;
  int minPoint;
  String startTime;
  String endTime;
  int useType;
  int publishCount;
  int useCount;
  int receiveCount;
  String enableTime;

  CouponList({
    required this.id,
    required this.type,
    required this.name,
    required this.platform,
    required this.count,
    required this.amount,
    required this.perLimit,
    required this.minPoint,
    required this.startTime,
    required this.endTime,
    required this.useType,
    required this.publishCount,
    required this.useCount,
    required this.receiveCount,
    required this.enableTime,
  });

  factory CouponList.fromJson(Map<String, dynamic> json) => CouponList(
        id: json["id"],
        type: json["type"],
        name: json["name"],
        platform: json["platform"],
        count: json["count"],
        amount: json["amount"],
        perLimit: json["perLimit"],
        minPoint: json["minPoint"],
        startTime: json["startTime"],
        endTime: json["endTime"],
        useType: json["useType"],
        publishCount: json["publishCount"],
        useCount: json["useCount"],
        receiveCount: json["receiveCount"],
        enableTime: json["enableTime"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "name": name,
        "platform": platform,
        "count": count,
        "amount": amount,
        "perLimit": perLimit,
        "minPoint": minPoint,
        "startTime": startTime,
        "endTime": endTime,
        "useType": useType,
        "publishCount": publishCount,
        "useCount": useCount,
        "receiveCount": receiveCount,
        "enableTime": enableTime,
      };
}

class Product {
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
  String detailDesc;
  String detailHtml;
  String detailMobileHtml;

  Product({
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
    required this.promotionPrice,
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
    required this.detailDesc,
    required this.detailHtml,
    required this.detailMobileHtml,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
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
        detailDesc: json["detailDesc"],
        detailHtml: json["detailHtml"],
        detailMobileHtml: json["detailMobileHtml"],
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
        "detailDesc": detailDesc,
        "detailHtml": detailHtml,
        "detailMobileHtml": detailMobileHtml,
      };
}

class ProductAttributeList {
  int id;
  int productAttributeCategoryId;
  String name;
  int selectType;
  int inputType;
  String inputList;
  int sort;
  int filterType;
  int searchType;
  int relatedStatus;
  int handAddStatus;
  int type;

  ProductAttributeList({
    required this.id,
    required this.productAttributeCategoryId,
    required this.name,
    required this.selectType,
    required this.inputType,
    required this.inputList,
    required this.sort,
    required this.filterType,
    required this.searchType,
    required this.relatedStatus,
    required this.handAddStatus,
    required this.type,
  });

  factory ProductAttributeList.fromJson(Map<String, dynamic> json) => ProductAttributeList(
        id: json["id"],
        productAttributeCategoryId: json["productAttributeCategoryId"],
        name: json["name"],
        selectType: json["selectType"],
        inputType: json["inputType"],
        inputList: json["inputList"],
        sort: json["sort"],
        filterType: json["filterType"],
        searchType: json["searchType"],
        relatedStatus: json["relatedStatus"],
        handAddStatus: json["handAddStatus"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "productAttributeCategoryId": productAttributeCategoryId,
        "name": name,
        "selectType": selectType,
        "inputType": inputType,
        "inputList": inputList,
        "sort": sort,
        "filterType": filterType,
        "searchType": searchType,
        "relatedStatus": relatedStatus,
        "handAddStatus": handAddStatus,
        "type": type,
      };
}

class ProductAttributeValueList {
  int id;
  int productId;
  int productAttributeId;
  String value;

  ProductAttributeValueList({
    required this.id,
    required this.productId,
    required this.productAttributeId,
    required this.value,
  });

  factory ProductAttributeValueList.fromJson(Map<String, dynamic> json) => ProductAttributeValueList(
        id: json["id"],
        productId: json["productId"],
        productAttributeId: json["productAttributeId"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "productId": productId,
        "productAttributeId": productAttributeId,
        "value": value,
      };
}

class SkuStockList {
  int id;
  int productId;
  String skuCode;
  int price;
  int stock;
  int? promotionPrice;
  int lockStock;
  String spData;

  SkuStockList({
    required this.id,
    required this.productId,
    required this.skuCode,
    required this.price,
    required this.stock,
    this.promotionPrice,
    required this.lockStock,
    required this.spData,
  });

  factory SkuStockList.fromJson(Map<String, dynamic> json) => SkuStockList(
        id: json["id"],
        productId: json["productId"],
        skuCode: json["skuCode"],
        price: json["price"],
        stock: json["stock"],
        promotionPrice: json["promotionPrice"],
        lockStock: json["lockStock"],
        spData: json["spData"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "productId": productId,
        "skuCode": skuCode,
        "price": price,
        "stock": stock,
        "promotionPrice": promotionPrice,
        "lockStock": lockStock,
        "spData": spData,
      };
}
