// To parse this JSON data, do
//
//     final orderDetailModel = orderDetailModelFromJson(jsonString);

import 'dart:convert';

OrderDetailModel orderDetailModelFromJson(String str) => OrderDetailModel.fromJson(json.decode(str));

String orderDetailModelToJson(OrderDetailModel data) => json.encode(data.toJson());

class OrderDetailModel {
  int code;
  String message;
  OrderDetailData data;

  OrderDetailModel({
    required this.code,
    required this.message,
    required this.data,
  });

  factory OrderDetailModel.fromJson(Map<String, dynamic> json) => OrderDetailModel(
    code: json["code"],
    message: json["message"],
    data: OrderDetailData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "data": data.toJson(),
  };
}

class OrderDetailData {
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
  MemberReceiveAddress memberReceiveAddress;

  OrderDetailData({
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
    required this.memberReceiveAddress,
  });

  factory OrderDetailData.fromJson(Map<String, dynamic> json) => OrderDetailData(
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
    memberReceiveAddress: MemberReceiveAddress.fromJson(json["memberReceiveAddress"]),
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
    "memberReceiveAddress": memberReceiveAddress.toJson(),
  };
}

class MemberReceiveAddress {
  int id;
  int memberId;
  String receiverName;
  String receiverPhone;
  String province;
  String city;
  String district;
  String detailAddress;
  String postalCode;
  String tag;
  int isDefault;

  MemberReceiveAddress({
    required this.id,
    required this.memberId,
    required this.receiverName,
    required this.receiverPhone,
    required this.province,
    required this.city,
    required this.district,
    required this.detailAddress,
    required this.postalCode,
    required this.tag,
    required this.isDefault,
  });

  factory MemberReceiveAddress.fromJson(Map<String, dynamic> json) => MemberReceiveAddress(
    id: json["id"],
    memberId: json["memberId"],
    receiverName: json["receiverName"],
    receiverPhone: json["receiverPhone"],
    province: json["province"],
    city: json["city"],
    district: json["district"],
    detailAddress: json["detailAddress"],
    postalCode: json["postalCode"],
    tag: json["tag"],
    isDefault: json["isDefault"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "memberId": memberId,
    "receiverName": receiverName,
    "receiverPhone": receiverPhone,
    "province": province,
    "city": city,
    "district": district,
    "detailAddress": detailAddress,
    "postalCode": postalCode,
    "tag": tag,
    "isDefault": isDefault,
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
  int isDeleted;

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
    required this.isDeleted,
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
    isDeleted: json["isDeleted"],
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
    "isDeleted": isDeleted,
  };
}
