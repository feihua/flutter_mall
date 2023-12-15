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
  int productId;
  int productSkuId;
  int memberId;
  int quantity;
  int price;
  String productPic;
  String productName;
  String productSubTitle;
  String productSkuCode;
  String memberNickname;
  String createDate;
  int deleteStatus;
  int productCategoryId;
  String productBrand;
  String productSn;
  String productAttr;

  CartData({
    required this.id,
    required this.productId,
    required this.productSkuId,
    required this.memberId,
    required this.quantity,
    required this.price,
    required this.productPic,
    required this.productName,
    required this.productSubTitle,
    required this.productSkuCode,
    required this.memberNickname,
    required this.createDate,
    required this.deleteStatus,
    required this.productCategoryId,
    required this.productBrand,
    required this.productSn,
    required this.productAttr,
  });

  factory CartData.fromJson(Map<String, dynamic> json) => CartData(
        id: json["id"],
        productId: json["productId"],
        productSkuId: json["productSkuId"],
        memberId: json["memberId"],
        quantity: json["quantity"],
        price: json["price"],
        productPic: json["productPic"],
        productName: json["productName"],
        productSubTitle: json["productSubTitle"],
        productSkuCode: json["productSkuCode"],
        memberNickname: json["memberNickname"],
        createDate: json["createDate"],
        deleteStatus: json["deleteStatus"],
        productCategoryId: json["productCategoryId"],
        productBrand: json["productBrand"],
        productSn: json["productSn"],
        productAttr: json["productAttr"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "productId": productId,
        "productSkuId": productSkuId,
        "memberId": memberId,
        "quantity": quantity,
        "price": price,
        "productPic": productPic,
        "productName": productName,
        "productSubTitle": productSubTitle,
        "productSkuCode": productSkuCode,
        "memberNickname": memberNickname,
        "createDate": createDate,
        "deleteStatus": deleteStatus,
        "productCategoryId": productCategoryId,
        "productBrand": productBrand,
        "productSn": productSn,
        "productAttr": productAttr,
      };
}
