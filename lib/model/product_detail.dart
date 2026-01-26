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
  List<ProductLadderList> productLadderList;
  List<ProductFullReductionList> productFullReductionList;
  List<MemberPriceList> memberPriceList;
  List<CouponList> couponList;

  ProductDetailData({
    required this.product,
    required this.brand,
    required this.productAttributeList,
    required this.productAttributeValueList,
    required this.skuStockList,
    required this.productLadderList,
    required this.productFullReductionList,
    required this.memberPriceList,
    required this.couponList,
  });

  factory ProductDetailData.fromJson(Map<String, dynamic> json) => ProductDetailData(
    product: Product.fromJson(json["product"]),
    brand: Brand.fromJson(json["brand"]),
    productAttributeList: List<ProductAttributeList>.from(json["productAttributeList"].map((x) => ProductAttributeList.fromJson(x))),
    productAttributeValueList: List<ProductAttributeValueList>.from(json["productAttributeValueList"].map((x) => ProductAttributeValueList.fromJson(x))),
    skuStockList: List<SkuStockList>.from(json["skuStockList"].map((x) => SkuStockList.fromJson(x))),
    productLadderList: List<ProductLadderList>.from(json["productLadderList"].map((x) => ProductLadderList.fromJson(x))),
    productFullReductionList: List<ProductFullReductionList>.from(json["productFullReductionList"].map((x) => ProductFullReductionList.fromJson(x))),
    memberPriceList: List<MemberPriceList>.from(json["memberPriceList"].map((x) => MemberPriceList.fromJson(x))),
    couponList: List<CouponList>.from(json["couponList"].map((x) => CouponList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "product": product.toJson(),
    "brand": brand.toJson(),
    "productAttributeList": List<dynamic>.from(productAttributeList.map((x) => x.toJson())),
    "productAttributeValueList": List<dynamic>.from(productAttributeValueList.map((x) => x.toJson())),
    "skuStockList": List<dynamic>.from(skuStockList.map((x) => x.toJson())),
    "productLadderList": List<dynamic>.from(productLadderList.map((x) => x.toJson())),
    "productFullReductionList": List<dynamic>.from(productFullReductionList.map((x) => x.toJson())),
    "memberPriceList": List<dynamic>.from(memberPriceList.map((x) => x.toJson())),
    "couponList": List<dynamic>.from(couponList.map((x) => x.toJson())),
  };
}

class Brand {
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

  Brand({
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

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
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

class CouponList {
  int id;
  int typeId;
  String name;
  String code;
  int amount;
  int minAmount;
  DateTime startTime;
  DateTime endTime;
  int perLimit;
  int status;
  String description;

  CouponList({
    required this.id,
    required this.typeId,
    required this.name,
    required this.code,
    required this.amount,
    required this.minAmount,
    required this.startTime,
    required this.endTime,
    required this.perLimit,
    required this.status,
    required this.description,
  });

  factory CouponList.fromJson(Map<String, dynamic> json) => CouponList(
    id: json["id"],
    typeId: json["typeId"],
    name: json["name"],
    code: json["code"],
    amount: json["amount"],
    minAmount: json["minAmount"],
    startTime: DateTime.parse(json["startTime"]),
    endTime: DateTime.parse(json["endTime"]),
    perLimit: json["perLimit"],
    status: json["status"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "typeId": typeId,
    "name": name,
    "code": code,
    "amount": amount,
    "minAmount": minAmount,
    "startTime": startTime.toIso8601String(),
    "endTime": endTime.toIso8601String(),
    "perLimit": perLimit,
    "status": status,
    "description": description,
  };
}

class MemberPriceList {
  int id;
  int productId;
  int memberLevelId;
  int memberPrice;
  String memberLevelName;

  MemberPriceList({
    required this.id,
    required this.productId,
    required this.memberLevelId,
    required this.memberPrice,
    required this.memberLevelName,
  });

  factory MemberPriceList.fromJson(Map<String, dynamic> json) => MemberPriceList(
    id: json["id"],
    productId: json["productId"],
    memberLevelId: json["memberLevelId"],
    memberPrice: json["memberPrice"],
    memberLevelName: json["memberLevelName"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "productId": productId,
    "memberLevelId": memberLevelId,
    "memberPrice": memberPrice,
    "memberLevelName": memberLevelName,
  };
}

class Product {
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

  Product({
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

  factory Product.fromJson(Map<String, dynamic> json) => Product(
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

class ProductAttributeList {
  int id;
  int groupId;
  String name;
  int inputType;
  int valueType;
  String inputList;
  String unit;
  int isRequired;
  int isSearchable;
  int isShow;
  int sort;

  ProductAttributeList({
    required this.id,
    required this.groupId,
    required this.name,
    required this.inputType,
    required this.valueType,
    required this.inputList,
    required this.unit,
    required this.isRequired,
    required this.isSearchable,
    required this.isShow,
    required this.sort,
  });

  factory ProductAttributeList.fromJson(Map<String, dynamic> json) => ProductAttributeList(
    id: json["id"],
    groupId: json["groupId"],
    name: json["name"],
    inputType: json["inputType"],
    valueType: json["valueType"],
    inputList: json["inputList"],
    unit: json["unit"],
    isRequired: json["isRequired"],
    isSearchable: json["isSearchable"],
    isShow: json["isShow"],
    sort: json["sort"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "groupId": groupId,
    "name": name,
    "inputType": inputType,
    "valueType": valueType,
    "inputList": inputList,
    "unit": unit,
    "isRequired": isRequired,
    "isSearchable": isSearchable,
    "isShow": isShow,
    "sort": sort,
  };
}

class ProductAttributeValueList {
  int id;
  int spuId;
  int attributeId;
  String value;

  ProductAttributeValueList({
    required this.id,
    required this.spuId,
    required this.attributeId,
    required this.value,
  });

  factory ProductAttributeValueList.fromJson(Map<String, dynamic> json) => ProductAttributeValueList(
    id: json["id"],
    spuId: json["spuId"],
    attributeId: json["attributeId"],
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "spuId": spuId,
    "attributeId": attributeId,
    "value": value,
  };
}

class ProductFullReductionList {
  int id;
  int productId;
  int fullPrice;
  int reducePrice;

  ProductFullReductionList({
    required this.id,
    required this.productId,
    required this.fullPrice,
    required this.reducePrice,
  });

  factory ProductFullReductionList.fromJson(Map<String, dynamic> json) => ProductFullReductionList(
    id: json["id"],
    productId: json["productId"],
    fullPrice: json["fullPrice"],
    reducePrice: json["reducePrice"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "productId": productId,
    "fullPrice": fullPrice,
    "reducePrice": reducePrice,
  };
}

class ProductLadderList {
  int id;
  int productId;
  int count;
  int discount;
  int price;

  ProductLadderList({
    required this.id,
    required this.productId,
    required this.count,
    required this.discount,
    required this.price,
  });

  factory ProductLadderList.fromJson(Map<String, dynamic> json) => ProductLadderList(
    id: json["id"],
    productId: json["productId"],
    count: json["count"],
    discount: json["discount"],
    price: json["price"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "productId": productId,
    "count": count,
    "discount": discount,
    "price": price,
  };
}

class SkuStockList {
  int id;
  int spuId;
  String name;
  String skuCode;
  String mainPic;
  String albumPics;
  int price;
  int promotionPrice;
  String promotionStartTime;
  String promotionEndTime;
  int stock;
  int lowStock;
  String specData;
  double weight;
  int publishStatus;
  int verifyStatus;
  int sort;
  int sales;

  SkuStockList({
    required this.id,
    required this.spuId,
    required this.name,
    required this.skuCode,
    required this.mainPic,
    required this.albumPics,
    required this.price,
    required this.promotionPrice,
    required this.promotionStartTime,
    required this.promotionEndTime,
    required this.stock,
    required this.lowStock,
    required this.specData,
    required this.weight,
    required this.publishStatus,
    required this.verifyStatus,
    required this.sort,
    required this.sales,
  });

  factory SkuStockList.fromJson(Map<String, dynamic> json) => SkuStockList(
    id: json["id"],
    spuId: json["spuId"],
    name: json["name"],
    skuCode: json["skuCode"],
    mainPic: json["mainPic"],
    albumPics: json["albumPics"],
    price: json["price"],
    promotionPrice: json["promotionPrice"],
    promotionStartTime: json["promotionStartTime"],
    promotionEndTime: json["promotionEndTime"],
    stock: json["stock"],
    lowStock: json["lowStock"],
    specData: json["specData"],
    weight: json["weight"]?.toDouble(),
    publishStatus: json["publishStatus"],
    verifyStatus: json["verifyStatus"],
    sort: json["sort"],
    sales: json["sales"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "spuId": spuId,
    "name": name,
    "skuCode": skuCode,
    "mainPic": mainPic,
    "albumPics": albumPics,
    "price": price,
    "promotionPrice": promotionPrice,
    "promotionStartTime": promotionStartTime,
    "promotionEndTime": promotionEndTime,
    "stock": stock,
    "lowStock": lowStock,
    "specData": specData,
    "weight": weight,
    "publishStatus": publishStatus,
    "verifyStatus": verifyStatus,
    "sort": sort,
    "sales": sales,
  };
}
