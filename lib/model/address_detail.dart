// To parse this JSON data, do
//
//     final addressDetailModel = addressDetailModelFromJson(jsonString);

import 'dart:convert';

AddressDetailModel addressDetailModelFromJson(String str) => AddressDetailModel.fromJson(json.decode(str));

String addressDetailModelToJson(AddressDetailModel data) => json.encode(data.toJson());

class AddressDetailModel {
  int code;
  String message;
  AddressDetailData data;

  AddressDetailModel({
    required this.code,
    required this.message,
    required this.data,
  });

  factory AddressDetailModel.fromJson(Map<String, dynamic> json) => AddressDetailModel(
        code: json["code"],
        message: json["message"],
        data: AddressDetailData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data.toJson(),
      };
}

class AddressDetailData {
  int id;
  int memberId;
  String name;
  String phoneNumber;
  String postCode;
  String province;
  String city;
  String region;
  String detailAddress;

  AddressDetailData({
    required this.id,
    required this.memberId,
    required this.name,
    required this.phoneNumber,
    required this.postCode,
    required this.province,
    required this.city,
    required this.region,
    required this.detailAddress,
  });

  factory AddressDetailData.fromJson(Map<String, dynamic> json) => AddressDetailData(
        id: json["id"],
        memberId: json["memberId"],
        name: json["name"],
        phoneNumber: json["phoneNumber"],
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
        "postCode": postCode,
        "province": province,
        "city": city,
        "region": region,
        "detailAddress": detailAddress,
      };
}
