// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  int code;
  String message;
  LoginData data;

  LoginModel({
    required this.code,
    required this.message,
    required this.data,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        code: json["code"],
        message: json["message"],
        data: LoginData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data.toJson(),
      };
}

class LoginData {
  String tokenHead;
  String token;

  LoginData({
    required this.tokenHead,
    required this.token,
  });

  factory LoginData.fromJson(Map<String, dynamic> json) => LoginData(
        tokenHead: json["tokenHead"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "tokenHead": tokenHead,
        "token": token,
      };
}
