import 'package:flutter/material.dart';
import 'package:flutter_mall/order_pay.dart';
import 'package:flutter_mall/product_detail.dart';
import 'package:flutter_mall/provider/cart_model.dart';
import 'package:flutter_mall/widgets/cached_image_widget.dart';
import 'package:provider/provider.dart';

import 'model/cart_list.dart';

///
/// 提交订单页面
///
/// 作者：刘飞华
/// 日期：2023/11/21 17:17
///
class OrderSubmit extends StatefulWidget {
  const OrderSubmit({super.key});

  @override
  State<OrderSubmit> createState() => _OrderSubmitState();
}

class Product {
  final String image;
  final String name;
  final String subName;
  final double price;
  final String time;

  Product({
    required this.image,
    required this.name,
    required this.subName,
    required this.price,
    required this.time,
  });
}

class _OrderSubmitState extends State<OrderSubmit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("创建订单"),
        titleTextStyle: const TextStyle(fontSize: 16, color: Colors.black),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [buildOrderDetail(), Positioned(bottom: 0, child: buildSubmit())],
          ),
        ),
      )
    );
  }

  CustomScrollView buildOrderDetail() {
    return CustomScrollView(
      shrinkWrap: true,
      slivers: [
        buildAddress(),
        buildProductTitle(),
        buildProductList(4),
        buildCoupon(),
        buildOrderInfo(),
      ],
    );
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
                      Text("小李 18613030352",
                          style: TextStyle(fontSize: 17, color: Color(int.parse('303133', radix: 16)).withAlpha(255))),
                      const SizedBox(
                        height: 5,
                      ),
                      Text("广东省 深圳市 福田区	东晓街道",
                          style: TextStyle(fontSize: 14, color: Color(int.parse('909399', radix: 16)).withAlpha(255))),
                    ],
                  ),
                ),
                Image.asset(
                  "images/right_arrow1.png",
                  height: 17,
                  width: 16,
                )
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
    List<CartData> products = Provider.of<CartModel>(context, listen: true).getCheckProduct();
    return SliverList.builder(
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            color: Colors.white,
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                CachedImageWidget(
                  70,
                  70,
                  products[index].productPic,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(products[index].productName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 15, color: Color(int.parse('303133', radix: 16)).withAlpha(255))),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(products[index].productSubTitle,
                        maxLines: 1,
                        style: TextStyle(fontSize: 13, color: Color(int.parse('909399', radix: 16)).withAlpha(255))),
                    const SizedBox(
                      height: 6,
                    ),
                    Text("￥${products[index].price}x1",
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
                      Text("￥${Provider.of<CartModel>(context, listen: true).getProductAllPrice()}",
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
                      Text("￥0",
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
                      Text("-￥200",
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
                      Text("-￥0",
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
                      Text("-￥0",
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
                      const Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: "请填写备注信息",
                              contentPadding: EdgeInsets.zero,
                              isDense: true,
                              border: InputBorder.none,
                              hintStyle: TextStyle(fontSize: 12, textBaseline: TextBaseline.alphabetic)),
                        ),
                      )
                    ],
                  ),
                ),
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
    double price = Provider.of<CartModel>(context, listen: true).getProductAllPrice();
    price = price - 200 - 50;
    return Container(
      padding: const EdgeInsets.only(left: 15),
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
        children: [
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Text("实付款 ",
                    style: TextStyle(fontSize: 15, color: Color(int.parse('606266', radix: 16)).withAlpha(255))),
                Text("￥", style: TextStyle(fontSize: 15, color: Color(int.parse('fa436a', radix: 16)).withAlpha(255))),
                Text(price.toString(),
                    style: TextStyle(fontSize: 18, color: Color(int.parse('fa436a', radix: 16)).withAlpha(255))),
              ],
            ),
          ),
          Expanded(
              flex: 1,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => OrderPay(
                        amount: price,
                      ),
                    ),
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 140,
                  decoration: BoxDecoration(
                    color: Color(int.parse('fa436a', radix: 16)).withAlpha(255),
                  ),
                  child: const Text(
                    '提交订单',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
