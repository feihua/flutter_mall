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
  String orderNo;
  int userId;
  int orderStatus;
  int totalAmount;
  int promotionAmount;
  int couponAmount;
  int pointsAmount;
  int discountAmount;
  int freightAmount;
  int payAmount;
  int payType;
  String payTime;
  String deliveryTime;
  String receiveTime;
  String commentTime;
  int sourceType;
  String expressOrderNumber;
  int usePoints;
  int receiveStatus;
  String remark;
  DateTime createTime;
  DateTime updateTime;
  List<OrderItemList> orderItemData;

  OrderListData({
    required this.id,
    required this.orderNo,
    required this.userId,
    required this.orderStatus,
    required this.totalAmount,
    required this.promotionAmount,
    required this.couponAmount,
    required this.pointsAmount,
    required this.discountAmount,
    required this.freightAmount,
    required this.payAmount,
    required this.payType,
    required this.payTime,
    required this.deliveryTime,
    required this.receiveTime,
    required this.commentTime,
    required this.sourceType,
    required this.expressOrderNumber,
    required this.usePoints,
    required this.receiveStatus,
    required this.remark,
    required this.createTime,
    required this.updateTime,
    required this.orderItemData,
  });

  factory OrderListData.fromJson(Map<String, dynamic> json) => OrderListData(
    id: json["id"],
    orderNo: json["orderNo"],
    userId: json["userId"],
    orderStatus: json["orderStatus"],
    totalAmount: json["totalAmount"],
    promotionAmount: json["promotionAmount"],
    couponAmount: json["couponAmount"],
    pointsAmount: json["pointsAmount"],
    discountAmount: json["discountAmount"],
    freightAmount: json["freightAmount"],
    payAmount: json["payAmount"],
    payType: json["payType"],
    payTime: json["payTime"],
    deliveryTime: json["deliveryTime"],
    receiveTime: json["receiveTime"],
    commentTime: json["commentTime"],
    sourceType: json["sourceType"],
    expressOrderNumber: json["expressOrderNumber"],
    usePoints: json["usePoints"],
    receiveStatus: json["receiveStatus"],
    remark: json["remark"],
    createTime: DateTime.parse(json["createTime"]),
    updateTime: DateTime.parse(json["updateTime"]),
    orderItemData: List<OrderItemList>.from(json["orderItemData"].map((x) => OrderItemList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "orderNo": orderNo,
    "userId": userId,
    "orderStatus": orderStatus,
    "totalAmount": totalAmount,
    "promotionAmount": promotionAmount,
    "couponAmount": couponAmount,
    "pointsAmount": pointsAmount,
    "discountAmount": discountAmount,
    "freightAmount": freightAmount,
    "payAmount": payAmount,
    "payType": payType,
    "payTime": payTime,
    "deliveryTime": deliveryTime,
    "receiveTime": receiveTime,
    "commentTime": commentTime,
    "sourceType": sourceType,
    "expressOrderNumber": expressOrderNumber,
    "usePoints": usePoints,
    "receiveStatus": receiveStatus,
    "remark": remark,
    "createTime": createTime.toIso8601String(),
    "updateTime": updateTime.toIso8601String(),
    "orderItemData": List<dynamic>.from(orderItemData.map((x) => x.toJson())),
  };
}

class OrderItemList {
  int id;
  int orderId;
  String orderNo;
  int orderItemStatus;
  int skuId;
  String skuName;
  String skuPic;
  int skuPrice;
  int skuQuantity;
  String specData;
  int skuTotalAmount;
  int promotionAmount;
  int couponAmount;
  int pointsAmount;
  int discountAmount;
  int realAmount;
  String createTime;

  OrderItemList({
    required this.id,
    required this.orderId,
    required this.orderNo,
    required this.orderItemStatus,
    required this.skuId,
    required this.skuName,
    required this.skuPic,
    required this.skuPrice,
    required this.skuQuantity,
    required this.specData,
    required this.skuTotalAmount,
    required this.promotionAmount,
    required this.couponAmount,
    required this.pointsAmount,
    required this.discountAmount,
    required this.realAmount,
    required this.createTime,
  });

  factory OrderItemList.fromJson(Map<String, dynamic> json) => OrderItemList(
    id: json["id"],
    orderId: json["orderId"],
    orderNo: json["orderNo"],
    orderItemStatus: json["orderItemStatus"],
    skuId: json["skuId"],
    skuName: json["skuName"],
    skuPic: json["skuPic"],
    skuPrice: json["skuPrice"],
    skuQuantity: json["skuQuantity"],
    specData: json["specData"],
    skuTotalAmount: json["skuTotalAmount"],
    promotionAmount: json["promotionAmount"],
    couponAmount: json["couponAmount"],
    pointsAmount: json["pointsAmount"],
    discountAmount: json["discountAmount"],
    realAmount: json["realAmount"],
    createTime: json["createTime"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "orderId": orderId,
    "orderNo": orderNo,
    "orderItemStatus": orderItemStatus,
    "skuId": skuId,
    "skuName": skuName,
    "skuPic": skuPic,
    "skuPrice": skuPrice,
    "skuQuantity": skuQuantity,
    "specData": specData,
    "skuTotalAmount": skuTotalAmount,
    "promotionAmount": promotionAmount,
    "couponAmount": couponAmount,
    "pointsAmount": pointsAmount,
    "discountAmount": discountAmount,
    "realAmount": realAmount,
    "createTime": createTime,
  };
}
