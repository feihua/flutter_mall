// To parse this JSON data, do
//
//     final cartListModel = cartListModelFromJson(jsonString);

import 'dart:convert';

CartListModel cartListModelFromJson(String str) => CartListModel.fromJson(json.decode(str));

String cartListModelToJson(CartListModel data) => json.encode(data.toJson());

class CartListModel {
  int code;
  String message;
  List<CartData> data;

  CartListModel({
    required this.code,
    required this.message,
    required this.data,
  });

  factory CartListModel.fromJson(Map<String, dynamic> json) => CartListModel(
    code: json["code"],
    message: json["message"],
    data: List<CartData>.from(json["data"].map((x) => CartData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class CartData {
  int id;
  int memberId;
  int productId;
  int productSkuId;
  int quantity;
  int price;
  int selected;
  String productName;
  String productSubTitle;
  String productPic;
  String productSkuCode;
  String productSn;
  String productBrand;
  int productCategoryId;
  String productAttr;
  String memberNickname;
  int source;
  DateTime expireTime;
  DateTime createTime;
  DateTime updateTime;

  CartData({
    required this.id,
    required this.memberId,
    required this.productId,
    required this.productSkuId,
    required this.quantity,
    required this.price,
    required this.selected,
    required this.productName,
    required this.productSubTitle,
    required this.productPic,
    required this.productSkuCode,
    required this.productSn,
    required this.productBrand,
    required this.productCategoryId,
    required this.productAttr,
    required this.memberNickname,
    required this.source,
    required this.expireTime,
    required this.createTime,
    required this.updateTime,
  });

  factory CartData.fromJson(Map<String, dynamic> json) => CartData(
    id: json["id"],
    memberId: json["memberId"],
    productId: json["productId"],
    productSkuId: json["productSkuId"],
    quantity: json["quantity"],
    price: json["price"],
    selected: json["selected"],
    productName: json["productName"],
    productSubTitle: json["productSubTitle"],
    productPic: json["productPic"],
    productSkuCode: json["productSkuCode"],
    productSn: json["productSn"],
    productBrand: json["productBrand"],
    productCategoryId: json["productCategoryId"],
    productAttr: json["productAttr"],
    memberNickname: json["memberNickname"],
    source: json["source"],
    expireTime: DateTime.parse(json["expireTime"]),
    createTime: DateTime.parse(json["createTime"]),
    updateTime: DateTime.parse(json["updateTime"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "memberId": memberId,
    "productId": productId,
    "productSkuId": productSkuId,
    "quantity": quantity,
    "price": price,
    "selected": selected,
    "productName": productName,
    "productSubTitle": productSubTitle,
    "productPic": productPic,
    "productSkuCode": productSkuCode,
    "productSn": productSn,
    "productBrand": productBrand,
    "productCategoryId": productCategoryId,
    "productAttr": productAttr,
    "memberNickname": memberNickname,
    "source": source,
    "expireTime": expireTime.toIso8601String(),
    "createTime": createTime.toIso8601String(),
    "updateTime": updateTime.toIso8601String(),
  };
}
