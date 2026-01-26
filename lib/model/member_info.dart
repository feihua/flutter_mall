// To parse this JSON data, do
//
//     final memberInfoModel = memberInfoModelFromJson(jsonString);

import 'dart:convert';

MemberInfoModel memberInfoModelFromJson(String str) => MemberInfoModel.fromJson(json.decode(str));

String memberInfoModelToJson(MemberInfoModel data) => json.encode(data.toJson());

class MemberInfoModel {
  int code;
  String message;
  MemberInfoData data;

  MemberInfoModel({
    required this.code,
    required this.message,
    required this.data,
  });

  factory MemberInfoModel.fromJson(Map<String, dynamic> json) => MemberInfoModel(
    code: json["code"],
    message: json["message"],
    data: MemberInfoData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "data": data.toJson(),
  };
}

class MemberInfoData {
  int id;
  int memberId;
  int levelId;
  String nickname;
  String mobile;
  int source;
  String avatar;
  String signature;
  int gender;
  String birthday;
  int growthPoint;
  int points;
  int totalPoints;
  double spendAmount;
  int orderCount;
  int couponCount;
  int commentCount;
  int returnCount;
  int lotteryTimes;
  String lastLogin;

  MemberInfoData({
    required this.id,
    required this.memberId,
    required this.levelId,
    required this.nickname,
    required this.mobile,
    required this.source,
    required this.avatar,
    required this.signature,
    required this.gender,
    required this.birthday,
    required this.growthPoint,
    required this.points,
    required this.totalPoints,
    required this.spendAmount,
    required this.orderCount,
    required this.couponCount,
    required this.commentCount,
    required this.returnCount,
    required this.lotteryTimes,
    required this.lastLogin,
  });

  factory MemberInfoData.fromJson(Map<String, dynamic> json) => MemberInfoData(
    id: json["id"],
    memberId: json["memberId"],
    levelId: json["levelId"],
    nickname: json["nickname"],
    mobile: json["mobile"],
    source: json["source"],
    avatar: json["avatar"],
    signature: json["signature"],
    gender: json["gender"],
    birthday: json["birthday"],
    growthPoint: json["growthPoint"],
    points: json["points"],
    totalPoints: json["totalPoints"],
    spendAmount: json["spendAmount"]?.toDouble(),
    orderCount: json["orderCount"],
    couponCount: json["couponCount"],
    commentCount: json["commentCount"],
    returnCount: json["returnCount"],
    lotteryTimes: json["lotteryTimes"],
    lastLogin: json["lastLogin"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "memberId": memberId,
    "levelId": levelId,
    "nickname": nickname,
    "mobile": mobile,
    "source": source,
    "avatar": avatar,
    "signature": signature,
    "gender": gender,
    "birthday": birthday,
    "growthPoint": growthPoint,
    "points": points,
    "totalPoints": totalPoints,
    "spendAmount": spendAmount,
    "orderCount": orderCount,
    "couponCount": couponCount,
    "commentCount": commentCount,
    "returnCount": returnCount,
    "lotteryTimes": lotteryTimes,
    "lastLogin": lastLogin,
  };
}
