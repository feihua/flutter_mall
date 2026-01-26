// To parse this JSON data, do
//
//     final addressListModel = addressListModelFromJson(jsonString);

import 'dart:convert';

AddressListModel addressListModelFromJson(String str) => AddressListModel.fromJson(json.decode(str));

String addressListModelToJson(AddressListModel data) => json.encode(data.toJson());

class AddressListModel {
  int code;
  String message;
  int current;
  List<AddressListData> data;
  int pageSize;
  bool success;
  int total;

  AddressListModel({
    required this.code,
    required this.message,
    required this.current,
    required this.data,
    required this.pageSize,
    required this.success,
    required this.total,
  });

  factory AddressListModel.fromJson(Map<String, dynamic> json) => AddressListModel(
    code: json["code"],
    message: json["message"],
    current: json["current"],
    data: List<AddressListData>.from(json["data"].map((x) => AddressListData.fromJson(x))),
    pageSize: json["pageSize"],
    success: json["success"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "current": current,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "pageSize": pageSize,
    "success": success,
    "total": total,
  };
}

class AddressListData {
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
  DateTime createTime;
  String updateTime;

  AddressListData({
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
    required this.createTime,
    required this.updateTime,
  });

  factory AddressListData.fromJson(Map<String, dynamic> json) => AddressListData(
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
    createTime: DateTime.parse(json["createTime"]),
    updateTime: json["updateTime"],
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
    "createTime": createTime.toIso8601String(),
    "updateTime": updateTime,
  };
}
