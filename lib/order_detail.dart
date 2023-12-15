import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mall/config/service_url.dart';
import 'package:flutter_mall/order_pay.dart';
import 'package:flutter_mall/product_detail.dart';
import 'package:flutter_mall/utils/http_util.dart';
import 'package:flutter_mall/widgets/cached_image_widget.dart';

import 'config/order_status.dart';
import 'model/order_detail.dart';

///
/// 订单详情页面
///
/// 作者：刘飞华
/// 日期：2023/11/21 17:17
///
class OrderDetail extends StatefulWidget {
  final int orderId;

  const OrderDetail({super.key, required this.orderId});

  @override
  State<OrderDetail> createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  OrderDetailData? orderDetailData;

  List<OrderItemList> orderItemList = [];

  @override
  void initState() {
    super.initState();
    queryOrderDetail();
  }

  void queryOrderDetail() async {
    Response result = await HttpUtil.get(orderDetailDataUrl + widget.orderId.toString());
    OrderDetailModel orderDetailModel = OrderDetailModel.fromJson(result.data);
    setState(() {
      orderDetailData = orderDetailModel.data;
      orderItemList = orderDetailModel.data.orderItemList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("订单详情"),
        titleTextStyle: const TextStyle(fontSize: 16, color: Colors.black),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        child: orderDetailData != null
            ? Stack(
                alignment: Alignment.topCenter,
                children: [buildOrderDetail(), Positioned(bottom: 0, child: buildSubmit())],
              )
            : Container(),
      ),
    );
  }

  CustomScrollView buildOrderDetail() {
    return CustomScrollView(
      shrinkWrap: true,
      slivers: [
        buildOrderStatus(),
        buildAddress(),
        buildProductTitle(),
        buildProductList(4),
        // buildCoupon(),
        buildOrderInfo(),
        buildOrderPay(),
      ],
    );
  }

  // 订单状态
  SliverPadding buildOrderStatus() {
    return SliverPadding(
        padding: const EdgeInsets.all(0),
        sliver: SliverList(
            delegate: SliverChildListDelegate(<Widget>[
          Container(
            color: Color(int.parse('fa436a', radix: 16)).withAlpha(255),
            height: 100,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Image.asset(
                  getStatusIcon(orderDetailData!.status),
                  height: 24,
                  width: 24,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(getOrderStatusTxt(orderDetailData!.status),
                    style: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ])));
  }

  // 用户收货地址
  SliverPadding buildAddress() {
    var border = BorderSide(width: 5, color: Color(int.parse('f5f5f5', radix: 16)).withAlpha(255));
    var boxDecoration = BoxDecoration(
      color: Colors.white,
      border: Border(bottom: border),
    );
    return SliverPadding(
        padding: const EdgeInsets.all(0),
        sliver: SliverList(
            delegate: SliverChildListDelegate(<Widget>[
          Container(
            decoration: boxDecoration,
            height: 78,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Image.asset(
                  "images/address.png",
                  height: 24,
                  width: 22,
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("${orderDetailData!.receiverName} ${orderDetailData!.receiverPhone}",
                          style: TextStyle(fontSize: 17, color: Color(int.parse('303133', radix: 16)).withAlpha(255))),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                          "${orderDetailData!.receiverProvince} ${orderDetailData!.receiverCity} ${orderDetailData!.receiverRegion} ${orderDetailData!.receiverDetailAddress}",
                          style: TextStyle(fontSize: 14, color: Color(int.parse('909399', radix: 16)).withAlpha(255))),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ])));
  }

  // 标题
  SliverPadding buildProductTitle() {
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
              alignment: AlignmentDirectional.centerStart,
              padding: const EdgeInsets.only(left: 15),
              decoration: boxDecoration,
              height: 42,
              child: Text("商品信息",
                  style: TextStyle(fontSize: 15, color: Color(int.parse('606266', radix: 16)).withAlpha(255)))),
        ])));
  }

  // 商品列表
  SliverList buildProductList(int count) {
    return SliverList.builder(
        itemCount: orderItemList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            color: Colors.white,
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                CachedImageWidget(
                  70,
                  70,
                  orderItemList[index].productPic,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(orderItemList[index].productName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 15, color: Color(int.parse('303133', radix: 16)).withAlpha(255))),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(orderItemList[index].productAttr,
                        maxLines: 1,
                        style: TextStyle(fontSize: 13, color: Color(int.parse('909399', radix: 16)).withAlpha(255))),
                    const SizedBox(
                      height: 6,
                    ),
                    Text("￥${orderItemList[index].productPrice}x1",
                        style: TextStyle(fontSize: 16, color: Color(int.parse('303133', radix: 16)).withAlpha(255))),
                  ],
                ))
              ],
            ),
          );
        });
  }

  SliverPadding buildCoupon() {
    var border = BorderSide(width: 5, color: Color(int.parse('f5f5f5', radix: 16)).withAlpha(255));
    var boxDecoration = BoxDecoration(
      color: Colors.white,
      border: Border(top: border),
    );
    return SliverPadding(
        padding: const EdgeInsets.all(0),
        sliver: SliverList(
            delegate: SliverChildListDelegate(<Widget>[
          Container(
            margin: const EdgeInsets.only(top: 5),
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: boxDecoration,
            height: 45,
            child: Row(
              children: [
                Container(
                  width: 20,
                  height: 20,
                  alignment: Alignment.center,
                  color: Color(int.parse('f85e52', radix: 16)).withAlpha(255),
                  child: const Text("券",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      )),
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: Text("优惠券",
                      style: TextStyle(fontSize: 13, color: Color(int.parse('707070', radix: 16)).withAlpha(255))),
                ),
                Text("选择优惠券",
                    style: TextStyle(fontSize: 13, color: Color(int.parse('fa436a', radix: 16)).withAlpha(255))),
              ],
            ),
          ),
          Divider(
            height: 1,
            indent: 15,
            color: Color(int.parse('f5f5f5', radix: 16)).withAlpha(255),
          ),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            height: 45,
            child: Row(
              children: [
                Container(
                  width: 20,
                  height: 20,
                  alignment: Alignment.center,
                  color: Color(int.parse('ffaa0e', radix: 16)).withAlpha(255),
                  child: const Text("积",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      )),
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: Text("积分抵扣",
                      style: TextStyle(fontSize: 13, color: Color(int.parse('707070', radix: 16)).withAlpha(255))),
                ),
                Text("0", style: TextStyle(fontSize: 13, color: Color(int.parse('fa436a', radix: 16)).withAlpha(255))),
              ],
            ),
          )
        ])));
  }

  SliverPadding buildOrderInfo() {
    var border = BorderSide(width: 5, color: Color(int.parse('f5f5f5', radix: 16)).withAlpha(255));
    var boxDecoration = BoxDecoration(
      color: Colors.white,
      border: Border(top: border),
    );
    return SliverPadding(
        padding: const EdgeInsets.all(0),
        sliver: SliverList(
            delegate: SliverChildListDelegate(<Widget>[
          Container(
            decoration: boxDecoration,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                SizedBox(
                  height: 45,
                  child: Row(
                    children: [
                      Expanded(
                          child: Text("商品合计",
                              style: TextStyle(
                                  fontSize: 13, color: Color(int.parse('909399', radix: 16)).withAlpha(255)))),
                      Text("￥${orderDetailData!.payAmount}",
                          style: TextStyle(fontSize: 13, color: Color(int.parse('303133', radix: 16)).withAlpha(255))),
                    ],
                  ),
                ),
                Divider(
                  height: 1,
                  color: Color(int.parse('f5f5f5', radix: 16)).withAlpha(255),
                ),
                SizedBox(
                  height: 45,
                  child: Row(
                    children: [
                      Expanded(
                          child: Text("运费",
                              style: TextStyle(
                                  fontSize: 13, color: Color(int.parse('909399', radix: 16)).withAlpha(255)))),
                      Text("￥${orderDetailData!.freightAmount}",
                          style: TextStyle(fontSize: 13, color: Color(int.parse('303133', radix: 16)).withAlpha(255))),
                    ],
                  ),
                ),
                Divider(
                  height: 1,
                  color: Color(int.parse('f5f5f5', radix: 16)).withAlpha(255),
                ),
                SizedBox(
                  height: 45,
                  child: Row(
                    children: [
                      Expanded(
                          child: Text("活动优惠",
                              style: TextStyle(
                                  fontSize: 13, color: Color(int.parse('909399', radix: 16)).withAlpha(255)))),
                      Text("-￥${orderDetailData!.promotionAmount}",
                          style: TextStyle(fontSize: 13, color: Color(int.parse('fa436a', radix: 16)).withAlpha(255))),
                    ],
                  ),
                ),
                Divider(
                  height: 1,
                  color: Color(int.parse('f5f5f5', radix: 16)).withAlpha(255),
                ),
                SizedBox(
                  height: 45,
                  child: Row(
                    children: [
                      Expanded(
                          child: Text("优惠券",
                              style: TextStyle(
                                  fontSize: 13, color: Color(int.parse('909399', radix: 16)).withAlpha(255)))),
                      Text("-￥${orderDetailData!.couponAmount}",
                          style: TextStyle(fontSize: 13, color: Color(int.parse('fa436a', radix: 16)).withAlpha(255))),
                    ],
                  ),
                ),
                Divider(
                  height: 1,
                  color: Color(int.parse('f5f5f5', radix: 16)).withAlpha(255),
                ),
                SizedBox(
                  height: 45,
                  child: Row(
                    children: [
                      Expanded(
                          child: Text("积分抵扣",
                              style: TextStyle(
                                  fontSize: 13, color: Color(int.parse('909399', radix: 16)).withAlpha(255)))),
                      Text("-￥${orderDetailData!.integrationAmount}",
                          style: TextStyle(fontSize: 13, color: Color(int.parse('fa436a', radix: 16)).withAlpha(255))),
                    ],
                  ),
                ),
                Divider(
                  height: 1,
                  color: Color(int.parse('f5f5f5', radix: 16)).withAlpha(255),
                ),
                SizedBox(
                  height: 45,
                  child: Row(
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text("备注",
                          style: TextStyle(fontSize: 13, color: Color(int.parse('909399', radix: 16)).withAlpha(255))),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text("备注",
                            style:
                                TextStyle(fontSize: 12, color: Color(int.parse('909399', radix: 16)).withAlpha(255))),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ])));
  }

  SliverPadding buildOrderPay() {
    var border = BorderSide(width: 5, color: Color(int.parse('f5f5f5', radix: 16)).withAlpha(255));
    var boxDecoration = BoxDecoration(
      color: Colors.white,
      border: Border(top: border),
    );
    return SliverPadding(
        padding: const EdgeInsets.all(0),
        sliver: SliverList(
            delegate: SliverChildListDelegate(<Widget>[
          Container(
            decoration: boxDecoration,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                buildTxt("订单编号", orderDetailData!.orderSn),
                buildTxt("提交时间", orderDetailData!.createTime.toString()),
                buildTxt("支付方式", getPayType(orderDetailData!.payType)),
                buildTxt("实付金额", "￥${orderDetailData!.payAmount}"),
                buildTxt("付款时间", orderDetailData!.paymentTime.toString()),
                const SizedBox(
                  height: 45,
                ),
              ],
            ),
          )
        ])));
  }

  // 底部提交订单部分
  Container buildSubmit() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border.symmetric(
          vertical: BorderSide(
            color: Colors.grey, //边框颜色
            width: 1, //边框宽度)
          ),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 2, //阴影范围
            spreadRadius: 1, //阴影浓度
            color: Colors.grey, //阴影颜色
          ),
        ],
      ),
      height: 45,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Visibility(
              visible: orderDetailData!.status == 0,
              child: InkWell(
                onTap: () {
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (context) => const OrderPay(),
                  //   ),
                  // );
                },
                child: Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.all(6),
                  width: 70,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Text(
                    '取消订单',
                    style: TextStyle(color: Color(int.parse('303133', radix: 16)).withAlpha(255), fontSize: 13),
                  ),
                ),
              )),
          // const SizedBox(width: 10,),
          Visibility(
              visible: orderDetailData!.status == 0,
              child: InkWell(
                onTap: () {
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (context) => const OrderPay(),
                  //   ),
                  // );
                },
                child: Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.all(6),
                  width: 70,
                  decoration: BoxDecoration(
                    // color: Color(int.parse('f7bcc8', radix: 16)).withAlpha(255),
                    border: Border.all(color: Colors.grey),
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Text(
                    '立即付款',
                    style: TextStyle(color: Color(int.parse('fa436a', radix: 16)).withAlpha(255), fontSize: 13),
                  ),
                ),
              )),
          Visibility(
              visible: orderDetailData!.status == 2,
              child: InkWell(
                onTap: () {
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (context) => const OrderPay(),
                  //   ),
                  // );
                },
                child: Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.all(6),
                  width: 70,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Text(
                    '查看物流',
                    style: TextStyle(color: Color(int.parse('303133', radix: 16)).withAlpha(255), fontSize: 13),
                  ),
                ),
              )),
          // const SizedBox(width: 10,),
          Visibility(
              visible: orderDetailData!.status == 2,
              child: InkWell(
                onTap: () {
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (context) => const OrderPay(),
                  //   ),
                  // );
                },
                child: Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.all(6),
                  width: 70,
                  decoration: BoxDecoration(
                    // color: Color(int.parse('f7bcc8', radix: 16)).withAlpha(255),
                    border: Border.all(color: Colors.grey),
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Text(
                    '确认收货',
                    style: TextStyle(color: Color(int.parse('fa436a', radix: 16)).withAlpha(255), fontSize: 13),
                  ),
                ),
              )),
          Visibility(
              visible: orderDetailData!.status == 3,
              child: InkWell(
                onTap: () {
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (context) => const OrderPay(),
                  //   ),
                  // );
                },
                child: Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.all(6),
                  width: 70,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Text(
                    '申请售后',
                    style: TextStyle(color: Color(int.parse('303133', radix: 16)).withAlpha(255), fontSize: 13),
                  ),
                ),
              )),
          // const SizedBox(width: 10,),
          Visibility(
              visible: orderDetailData!.status == 3,
              child: InkWell(
                onTap: () {
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (context) => const OrderPay(),
                  //   ),
                  // );
                },
                child: Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.all(6),
                  width: 70,
                  decoration: BoxDecoration(
                    // color: Color(int.parse('f7bcc8', radix: 16)).withAlpha(255),
                    border: Border.all(color: Colors.grey),
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Text(
                    '评价商品',
                    style: TextStyle(color: Color(int.parse('fa436a', radix: 16)).withAlpha(255), fontSize: 13),
                  ),
                ),
              ))
        ],
      ),
    );
  }

  Container buildTxt(String title, String value) {
    var border = BorderSide(width: 1, color: Color(int.parse('f5f5f5', radix: 16)).withAlpha(255));
    var boxDecoration = BoxDecoration(
      color: Colors.white,
      border: Border(bottom: border),
    );
    return Container(
      decoration: boxDecoration,
      height: 45,
      child: Row(
        children: [
          Expanded(
              child: Text(title,
                  style: TextStyle(fontSize: 13, color: Color(int.parse('909399', radix: 16)).withAlpha(255)))),
          Text(value, style: TextStyle(fontSize: 13, color: Color(int.parse('303133', radix: 16)).withAlpha(255))),
        ],
      ),
    );
  }

  String getPayType(int type) {
    Map typeMap = <int, String>{};
    typeMap[2] = "微信支付";
    typeMap[1] = "支付宝支付";
    typeMap[0] = "未支付";

    return typeMap[type];
  }

  // 状态图标转换
  String getStatusIcon(int status) {
    //0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单',
    Map statusIconMap = <int, String>{};
    statusIconMap[0] = "images/daifukuan.png";
    statusIconMap[1] = "images/daifahuo.png";
    statusIconMap[2] = "images/yifukuan.png";
    statusIconMap[3] = "images/tick.png";
    statusIconMap[4] = "images/delete.png";
    statusIconMap[5] = "images/delete.png";

    return statusIconMap[status];
  }
}
