// To parse this JSON data, do
//
//     final orderListModel = orderListModelFromJson(jsonString);

import 'dart:convert';

OrderListModel orderListModelFromJson(String str) => OrderListModel.fromJson(json.decode(str));

String orderListModelToJson(OrderListModel data) => json.encode(data.toJson());

class OrderListModel {
  int code;
  String message;
  List<OrderListData> data;

  OrderListModel({
    required this.code,
    required this.message,
    required this.data,
  });

  factory OrderListModel.fromJson(Map<String, dynamic> json) => OrderListModel(
        code: json["code"],
        message: json["message"],
        data: List<OrderListData>.from(json["data"].map((x) => OrderListData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class OrderListData {
  int id;
  int memberId;
  int couponId;
  String orderSn;
  String createTime;
  String memberUserName;
  int totalAmount;
  int payAmount;
  int freightAmount;
  int promotionAmount;
  int integrationAmount;
  int couponAmount;
  int discountAmount;
  int payType;
  int sourceType;
  int status;
  int orderType;
  String deliveryCompany;
  String deliverySn;
  int autoConfirmDay;
  int integration;
  int growth;
  String promotionInfo;
  int billType;
  String billHeader;
  String billContent;
  String billReceiverPhone;
  String billReceiverEmail;
  String receiverName;
  String receiverPhone;
  String receiverPostCode;
  String receiverProvince;
  String receiverCity;
  String receiverRegion;
  String receiverDetailAddress;
  String note;
  int confirmStatus;
  int deleteStatus;
  int useIntegration;
  String paymentTime;
  String deliveryTime;
  String receiveTime;
  String commentTime;
  String modifyTime;
  List<OrderItemList> orderItemList;

  OrderListData({
    required this.id,
    required this.memberId,
    required this.couponId,
    required this.orderSn,
    required this.createTime,
    required this.memberUserName,
    required this.totalAmount,
    required this.payAmount,
    required this.freightAmount,
    required this.promotionAmount,
    required this.integrationAmount,
    required this.couponAmount,
    required this.discountAmount,
    required this.payType,
    required this.sourceType,
    required this.status,
    required this.orderType,
    required this.deliveryCompany,
    required this.deliverySn,
    required this.autoConfirmDay,
    required this.integration,
    required this.growth,
    required this.promotionInfo,
    required this.billType,
    required this.billHeader,
    required this.billContent,
    required this.billReceiverPhone,
    required this.billReceiverEmail,
    required this.receiverName,
    required this.receiverPhone,
    required this.receiverPostCode,
    required this.receiverProvince,
    required this.receiverCity,
    required this.receiverRegion,
    required this.receiverDetailAddress,
    required this.note,
    required this.confirmStatus,
    required this.deleteStatus,
    required this.useIntegration,
    required this.paymentTime,
    required this.deliveryTime,
    required this.receiveTime,
    required this.commentTime,
    required this.modifyTime,
    required this.orderItemList,
  });

  factory OrderListData.fromJson(Map<String, dynamic> json) => OrderListData(
        id: json["id"],
        memberId: json["memberId"],
        couponId: json["couponId"],
        orderSn: json["orderSn"],
        createTime: json["createTime"],
        memberUserName: json["memberUserName"],
        totalAmount: json["totalAmount"],
        payAmount: json["payAmount"],
        freightAmount: json["freightAmount"],
        promotionAmount: json["promotionAmount"],
        integrationAmount: json["integrationAmount"],
        couponAmount: json["couponAmount"],
        discountAmount: json["discountAmount"],
        payType: json["payType"],
        sourceType: json["sourceType"],
        status: json["status"],
        orderType: json["orderType"],
        deliveryCompany: json["deliveryCompany"],
        deliverySn: json["deliverySn"],
        autoConfirmDay: json["autoConfirmDay"],
        integration: json["integration"],
        growth: json["growth"],
        promotionInfo: json["promotionInfo"],
        billType: json["billType"],
        billHeader: json["billHeader"],
        billContent: json["billContent"],
        billReceiverPhone: json["billReceiverPhone"],
        billReceiverEmail: json["billReceiverEmail"],
        receiverName: json["receiverName"],
        receiverPhone: json["receiverPhone"],
        receiverPostCode: json["receiverPostCode"],
        receiverProvince: json["receiverProvince"],
        receiverCity: json["receiverCity"],
        receiverRegion: json["receiverRegion"],
        receiverDetailAddress: json["receiverDetailAddress"],
        note: json["note"],
        confirmStatus: json["confirmStatus"],
        deleteStatus: json["deleteStatus"],
        useIntegration: json["useIntegration"],
        paymentTime: json["paymentTime"],
        deliveryTime: json["deliveryTime"],
        receiveTime: json["receiveTime"],
        commentTime: json["commentTime"],
        modifyTime: json["modifyTime"],
        orderItemList: List<OrderItemList>.from(json["orderItemList"].map((x) => OrderItemList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "memberId": memberId,
        "couponId": couponId,
        "orderSn": orderSn,
        "createTime": createTime,
        "memberUserName": memberUserName,
        "totalAmount": totalAmount,
        "payAmount": payAmount,
        "freightAmount": freightAmount,
        "promotionAmount": promotionAmount,
        "integrationAmount": integrationAmount,
        "couponAmount": couponAmount,
        "discountAmount": discountAmount,
        "payType": payType,
        "sourceType": sourceType,
        "status": status,
        "orderType": orderType,
        "deliveryCompany": deliveryCompany,
        "deliverySn": deliverySn,
        "autoConfirmDay": autoConfirmDay,
        "integration": integration,
        "growth": growth,
        "promotionInfo": promotionInfo,
        "billType": billType,
        "billHeader": billHeader,
        "billContent": billContent,
        "billReceiverPhone": billReceiverPhone,
        "billReceiverEmail": billReceiverEmail,
        "receiverName": receiverName,
        "receiverPhone": receiverPhone,
        "receiverPostCode": receiverPostCode,
        "receiverProvince": receiverProvince,
        "receiverCity": receiverCity,
        "receiverRegion": receiverRegion,
        "receiverDetailAddress": receiverDetailAddress,
        "note": note,
        "confirmStatus": confirmStatus,
        "deleteStatus": deleteStatus,
        "useIntegration": useIntegration,
        "paymentTime": paymentTime,
        "deliveryTime": deliveryTime,
        "receiveTime": receiveTime,
        "commentTime": commentTime,
        "modifyTime": modifyTime,
        "orderItemList": List<dynamic>.from(orderItemList.map((x) => x.toJson())),
      };
}

class OrderItemList {
  int id;
  int orderId;
  String orderSn;
  int productId;
  String productPic;
  String productName;
  String productBrand;
  String productSn;
  int productPrice;
  int productQuantity;
  int productSkuId;
  String productSkuCode;
  int productCategoryId;
  String promotionName;
  int promotionAmount;
  int couponAmount;
  int integrationAmount;
  int realAmount;
  int giftIntegration;
  int giftGrowth;
  String productAttr;

  OrderItemList({
    required this.id,
    required this.orderId,
    required this.orderSn,
    required this.productId,
    required this.productPic,
    required this.productName,
    required this.productBrand,
    required this.productSn,
    required this.productPrice,
    required this.productQuantity,
    required this.productSkuId,
    required this.productSkuCode,
    required this.productCategoryId,
    required this.promotionName,
    required this.promotionAmount,
    required this.couponAmount,
    required this.integrationAmount,
    required this.realAmount,
    required this.giftIntegration,
    required this.giftGrowth,
    required this.productAttr,
  });

  factory OrderItemList.fromJson(Map<String, dynamic> json) => OrderItemList(
        id: json["id"],
        orderId: json["orderId"],
        orderSn: json["orderSn"],
        productId: json["productId"],
        productPic: json["productPic"],
        productName: json["productName"],
        productBrand: json["productBrand"],
        productSn: json["productSn"],
        productPrice: json["productPrice"],
        productQuantity: json["productQuantity"],
        productSkuId: json["productSkuId"],
        productSkuCode: json["productSkuCode"],
        productCategoryId: json["productCategoryId"],
        promotionName: json["promotionName"],
        promotionAmount: json["promotionAmount"],
        couponAmount: json["couponAmount"],
        integrationAmount: json["integrationAmount"],
        realAmount: json["realAmount"],
        giftIntegration: json["giftIntegration"],
        giftGrowth: json["giftGrowth"],
        productAttr: json["productAttr"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "orderId": orderId,
        "orderSn": orderSn,
        "productId": productId,
        "productPic": productPic,
        "productName": productName,
        "productBrand": productBrand,
        "productSn": productSn,
        "productPrice": productPrice,
        "productQuantity": productQuantity,
        "productSkuId": productSkuId,
        "productSkuCode": productSkuCode,
        "productCategoryId": productCategoryId,
        "promotionName": promotionName,
        "promotionAmount": promotionAmount,
        "couponAmount": couponAmount,
        "integrationAmount": integrationAmount,
        "realAmount": realAmount,
        "giftIntegration": giftIntegration,
        "giftGrowth": giftGrowth,
        "productAttr": productAttr,
      };
}
