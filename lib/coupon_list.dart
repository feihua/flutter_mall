import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mall/config/service_url.dart';
import 'package:flutter_mall/utils/http_util.dart';

import 'model/coupon_model.dart';

///
/// 优惠券列表页面
///
/// 作者：刘飞华
/// 日期：2023/11/21 17:17
///
class CouponList extends StatefulWidget {
  const CouponList({super.key});

  @override
  State<CouponList> createState() => _CouponListState();
}

class _CouponListState extends State<CouponList> {
  final List<String> couponStatus = ['未使用', '已使用', '已过期'];

  List<CouponData> couponListData = [];

  @override
  void initState() {
    super.initState();
    queryCouponList("1");
  }

  void queryCouponList(String status) async {
    Response result = await HttpUtil.get(couponDataUrl + status);
    CouponModel couponModel = CouponModel.fromJson(result.data);
    setState(() {
      couponListData = couponModel.data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: couponStatus.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(' 优惠券列表 '),
          titleTextStyle: const TextStyle(fontSize: 16, color: Colors.black),
          centerTitle: true,
          bottom: TabBar(
            indicatorColor: Color(int.parse('fa436a', radix: 16)).withAlpha(255),
            labelColor: Color(int.parse('fa436a', radix: 16)).withAlpha(255),
            tabs: couponStatus.map((status) => Tab(text: status)).toList(),
          ),
        ),
        body: TabBarView(
          children: couponStatus.map((status) {
            return CouponListInfo(
              status: status,
              couponListData: couponListData,
            );
          }).toList(),
        ),
      ),
    );
  }
}

class CouponListInfo extends StatelessWidget {
  final String status;
  final List<CouponData> couponListData;

  const CouponListInfo({
    super.key,
    required this.status,
    required this.couponListData,
  });

  @override
  Widget build(BuildContext context) {
    var border = BorderSide(width: 1, color: Color(int.parse('f5f5f5', radix: 16)).withAlpha(255));
    var boxDecoration = BoxDecoration(border: Border(bottom: border));
    return ListView.builder(
        itemCount: couponListData.length,
        itemBuilder: (context, index) {
          // 优惠券类型：0：全场通用，1：指定分类商品可用，2：指定商品可用
          String flag = getUseType(index);
          CouponData couponData = couponListData[index];
          return Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 5, color: Color(int.parse('f5f5f5', radix: 16)).withAlpha(255)))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(couponData.name,
                                style: TextStyle(
                                    fontSize: 16, color: Color(int.parse('303133', radix: 16)).withAlpha(255))),
                            Text("有效期至${couponData.endTime}",
                                style: TextStyle(
                                    fontSize: 12, color: Color(int.parse('909399', radix: 16)).withAlpha(255))),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Text("￥",
                                  style: TextStyle(
                                      fontSize: 17, color: Color(int.parse('fa436a', radix: 16)).withAlpha(255))),
                              Text(couponData.amount.toString(),
                                  style: TextStyle(
                                      fontSize: 22, color: Color(int.parse('fa436a', radix: 16)).withAlpha(255))),
                            ],
                          ),
                          Text("满${couponData.minPoint}可用",
                              style:
                                  TextStyle(fontSize: 13, color: Color(int.parse('707070', radix: 16)).withAlpha(255))),
                        ],
                      )
                    ],
                  ),
                  Container(
                    height: 5,
                  ),
                  Text(flag,
                      style: TextStyle(fontSize: 12, color: Color(int.parse('909399', radix: 16)).withAlpha(255))),
                ],
              ));
        });
  }

  // 优惠券类型：0：全场通用，1：指定分类商品可用，2：指定商品可用
  String getUseType(int index) {
    int cType = couponListData[index].useType;
    if (cType == 0) {
      return "全场通用";
    }
    return cType == 1 ? "指定分类商品可用" : "指定商品可用";
  }
}
