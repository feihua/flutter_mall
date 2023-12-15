// To parse this JSON data, do
//
//     final addressListModel = addressListModelFromJson(jsonString);

import 'dart:convert';

AddressListModel addressListModelFromJson(String str) => AddressListModel.fromJson(json.decode(str));

String addressListModelToJson(AddressListModel data) => json.encode(data.toJson());

class AddressListModel {
  int code;
  String message;
  List<AddressListData> data;

  AddressListModel({
    required this.code,
    required this.message,
    required this.data,
  });

  factory AddressListModel.fromJson(Map<String, dynamic> json) => AddressListModel(
        code: json["code"],
        message: json["message"],
        data: List<AddressListData>.from(json["data"].map((x) => AddressListData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class AddressListData {
  int id;
  int memberId;
  String name;
  String phoneNumber;
  int? defaultStatus;
  String postCode;
  String province;
  String city;
  String region;
  String detailAddress;

  AddressListData({
    required this.id,
    required this.memberId,
    required this.name,
    required this.phoneNumber,
    this.defaultStatus,
    required this.postCode,
    required this.province,
    required this.city,
    required this.region,
    required this.detailAddress,
  });

  factory AddressListData.fromJson(Map<String, dynamic> json) => AddressListData(
        id: json["id"],
        memberId: json["memberId"],
        name: json["name"],
        phoneNumber: json["phoneNumber"],
        defaultStatus: json["defaultStatus"],
        postCode: json["postCode"],
        province: json["province"],
        city: json["city"],
        region: json["region"],
        detailAddress: json["detailAddress"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "memberId": memberId,
        "name": name,
        "phoneNumber": phoneNumber,
        "defaultStatus": defaultStatus,
        "postCode": postCode,
        "province": province,
        "city": city,
        "region": region,
        "detailAddress": detailAddress,
      };
}
