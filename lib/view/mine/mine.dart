import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mall/view/mine/collection/collection.dart';
import 'package:flutter_mall/view/mine/coupon/coupon_list.dart';
import 'package:flutter_mall/view/mine/focus/focus.dart';
import 'package:flutter_mall/view/mine/history/history.dart';
import 'package:flutter_mall/view/mine/login/login.dart';
import 'package:flutter_mall/view/mine/message/message.dart';
import 'package:flutter_mall/view/mine/order/order_list.dart';
import 'package:flutter_mall/view/mine/ping_jia/ping_jia.dart';
import 'package:flutter_mall/view/mine/setting/settings.dart';
import 'package:flutter_mall/utils/http_util.dart';

import '../../config/service_url.dart';
import '../../model/member_info.dart';
import 'address/address_list.dart';

///
/// 我的页面
///
/// 作者：刘飞华
/// 日期：2023/11/21 17:17
///
class Mine extends StatefulWidget {
  const Mine({super.key});

  @override
  State<Mine> createState() => _MineState();
}

class _MineState extends State<Mine> {
  // 没登录时的默认数据
  MemberInfoData memberInfoData = MemberInfoData(
      id: 1,
      memberId: 1001,
      levelId: 1,
      nickname: "张三",
      mobile: "13800138001",
      source: 0,
      avatar: "https://example.com/avatar/001.jpg",
      signature: "生活就是购物~",
      gender: 1,
      birthday: "1990-01-15",
      growthPoint: 100,
      points: 500,
      totalPoints: 1000,
      spendAmount: 999.989990234375,
      orderCount: 10,
      couponCount: 5,
      commentCount: 8,
      returnCount: 1,
      lotteryTimes: 2,
      lastLogin: "2024-01-15 08:30:00"

  );

  @override
  void initState() {
    super.initState();
    queryMemberInfo();
  }

  // 请求用户个人信息
  void queryMemberInfo() async {
    Response result = await HttpUtil.get(memberInfoDataUrl);
    MemberInfoModel memberInfoModel = MemberInfoModel.fromJson(result.data);
    setState(() {
      memberInfoData = memberInfoModel.data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(int.parse('f5f5f5', radix: 16)).withAlpha(255),
        width: MediaQuery.of(context).size.width,
        child: CustomScrollView(
          shrinkWrap: true,
          slivers: [buildHeader(), buildIntegral(), buildOrderInfo(), buildSetting()],
        ),
      ),
    );
  }

  SliverPadding buildHeader() {
    return SliverPadding(
        padding: const EdgeInsets.all(0),
        sliver: SliverList(
          delegate: SliverChildListDelegate(<Widget>[
            Stack(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    "images/user-bg.jpg",
                    height: 200,
                    // width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: 200,
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const Login(),
                            ),
                          );
                        },
                        child: ClipOval(
                          child: Image.network(
                            "https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/icon/github_icon_02.png",
                            width: 70,
                            height: 70,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(memberInfoData.nickname,
                          style: TextStyle(fontSize: 25, color: Color(int.parse('303133', radix: 16)).withAlpha(255))),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const Message(),
                            ),
                          );
                        },
                        child: Image.asset(
                          "images/message.png",
                          height: 30,
                          width: 30,
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const Settings(),
                            ),
                          );
                        },
                        child: Image.asset(
                          "images/setting_white.png",
                          height: 30,
                          width: 30,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ]),
        ));
  }

  SliverPadding buildIntegral() {
    var numStyle = TextStyle(fontSize: 16, color: Color(int.parse('303133', radix: 16)).withAlpha(255));
    var txtStyle = TextStyle(fontSize: 12, color: Color(int.parse('707070', radix: 16)).withAlpha(255));
    return SliverPadding(
        padding: const EdgeInsets.all(0),
        sliver: SliverList(
          delegate: SliverChildListDelegate(<Widget>[
            Container(
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5)),
              height: 70,
              margin: const EdgeInsets.only(top: 8, left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(memberInfoData.points.toString(), style: numStyle),
                      Text("积分", style: txtStyle),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(memberInfoData.growthPoint.toString(), style: numStyle),
                      Text("成长值", style: txtStyle),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const CouponList(),
                        ),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(memberInfoData.couponCount.toString(), style: numStyle),
                        Text("优惠券", style: txtStyle),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ]),
        ));
  }

  SliverPadding buildOrderInfo() {
    var style = TextStyle(fontSize: 12, color: Color(int.parse('303133', radix: 16)).withAlpha(255));
    return SliverPadding(
        padding: const EdgeInsets.all(0),
        sliver: SliverList(
          delegate: SliverChildListDelegate(<Widget>[
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const OrderList(),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5)),
                margin: const EdgeInsets.only(top: 8, left: 10, right: 10),
                height: 88,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "images/all_order.png",
                          height: 25,
                          width: 24,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text("全部订单", style: style),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "images/daifukuan.png",
                          height: 25,
                          width: 24,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text("待付款", style: style),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "images/daifahuo.png",
                          height: 25,
                          width: 24,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text("待发货", style: style),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "images/yifukuan.png",
                          height: 25,
                          width: 24,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text("待收货", style: style),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "images/tuihuo.png",
                          height: 25,
                          width: 24,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text("退款/售后", style: style),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ]),
        ));
  }

  SliverPadding buildSetting() {
    var list = ['地址管理', '我的足迹', '我的关注', '我的收藏', '我的评价', '设置'];
    var listImg = [
      'images/address.png',
      'images/history.png',
      'images/guanzhu.png',
      'images/shoucang.png',
      'images/pingjia.png',
      'images/setting.png'
    ];
    var click = [
      const AddressList(),
      const History(),
      const FocusOn(),
      const Collection(),
      const PinJia(),
      const Settings()
    ];

    var border = BorderSide(width: 1, color: Color(int.parse('f5f5f5', radix: 16)).withAlpha(255));
    var boxDecoration = BoxDecoration(
      color: Colors.white,
      border: Border(bottom: border),
    );

    return SliverPadding(
        padding: const EdgeInsets.all(0),
        sliver: SliverList(
          delegate: SliverChildListDelegate(<Widget>[
            Container(
              margin: const EdgeInsets.only(top: 8, left: 10, right: 10),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5)),
              height: 350,
              child: MediaQuery.removeViewPadding(
                  removeTop: true,
                  context: context,
                  child: ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => click[index],
                              ),
                            );
                          },
                          child: Container(
                            decoration: boxDecoration,
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            height: 50,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                        child: Row(
                                      children: [
                                        Image.asset(
                                          listImg[index],
                                          height: 20,
                                          width: 20,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(list[index],
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Color(int.parse('303133', radix: 16)).withAlpha(255))),
                                      ],
                                    )),
                                    Image.asset(
                                      "images/right_arrow.png",
                                      height: 15,
                                      width: 15,
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      })),
            )
          ]),
        ));
  }
}
