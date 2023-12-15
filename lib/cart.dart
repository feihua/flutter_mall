import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mall/config/service_url.dart';
import 'package:flutter_mall/provider/cart_model.dart';
import 'package:flutter_mall/utils/http_util.dart';
import 'package:provider/provider.dart';

import 'model/cart_list.dart';
import 'order_submit.dart';

///
/// 购物车页面
///
/// 作者：刘飞华
/// 日期：2023/11/21 17:17
///
class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  // List<CartData> cartListData = [];

  @override
  void initState() {
    super.initState();
    _queryBrandListData();
  }

  void _queryBrandListData() async {
    Response result = await HttpUtil.get(cartDataUrl);
    setState(() {
      CartListModel cartListModel = CartListModel.fromJson(result.data);
      // cartListData = cartListModel.data;
      context.read<CartModel>().setCartListData(cartListModel.data);
    });
  }

  var boxDecoration = BoxDecoration(
    color: Colors.white,
    border: Border(bottom: BorderSide(width: 1, color: Color(int.parse('f5f5f5', radix: 16)).withAlpha(255))),
  );

  @override
  Widget build(BuildContext context) {
    List<CartData> cartListData = Provider.of<CartModel>(context, listen: false).getAllProduct();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("购物车"),
        titleTextStyle: const TextStyle(fontSize: 16, color: Colors.black),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          cartListData.isNotEmpty
              ? ListView.builder(
                  itemCount: cartListData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      decoration: boxDecoration,
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              context.read<CartModel>().setCartItemStatus(cartListData[index].productId);
                            },
                            child: Image.asset(
                              context.watch<CartModel>().getProductIsCheck(cartListData[index].productId)
                                  ? "images/checkbox_round_1.png"
                                  : "images/checkbox_round_2.png",
                              height: 23,
                              width: 22,
                            ),
                          ),
                          ClipRRect(
                            borderRadius: const BorderRadius.all(Radius.circular(20)),
                            child: Image.network(
                              cartListData[index].productPic,
                              width: 115,
                              height: 115,
                            ),
                          ),
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(cartListData[index].productName,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 15, color: Color(int.parse('303133', radix: 16)).withAlpha(255))),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 4),
                                child: Text(cartListData[index].productAttr,
                                    style: TextStyle(
                                        fontSize: 13, color: Color(int.parse('909399', radix: 16)).withAlpha(255))),
                              ),
                              Text("¥${cartListData[index].price}",
                                  style: TextStyle(
                                      fontSize: 15, color: Color(int.parse('303133', radix: 16)).withAlpha(255))),
                            ],
                          )),
                          Image.asset("images/close.png",
                              height: 16, width: 17, color: Color(int.parse('909399', radix: 16)).withAlpha(255))
                        ],
                      ),
                    );
                  })
              : Container(
                  alignment: Alignment.topCenter,
                  margin: const EdgeInsets.only(top: 200),
                  child: Text("囧~ 购物车还是空的",
                      style: TextStyle(fontSize: 20, color: Color(int.parse('909399', radix: 16)).withAlpha(255))),
                ),
          Visibility(
              visible: cartListData.isNotEmpty,
              child: Positioned(
                  bottom: 0,
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    height: 60,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    margin: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.grey, //边框颜色
                        width: 1, //边框宽度
                      ),
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 2, //阴影范围
                          spreadRadius: 1, //阴影浓度
                          color: Colors.grey, //阴影颜色
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10), // 圆角也可控件一边圆角大小
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            context.read<CartModel>().setAllStatus();
                          },
                          child: Image.asset(
                            Provider.of<CartModel>(context, listen: true).getAllStatus()
                                ? "images/checkbox_round_1.png"
                                : "images/checkbox_round_2.png",
                            height: 30,
                            width: 30,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "￥${Provider.of<CartModel>(context, listen: true).getProductAllPrice()}",
                              style: const TextStyle(fontSize: 16),
                            ),
                            const SizedBox(
                              width: 25,
                            ),
                            Container(
                              height: 40,
                              width: 90,
                              decoration: BoxDecoration(
                                color: Color(int.parse('fa436a', radix: 16)).withAlpha(255),
                                borderRadius: const BorderRadius.all(Radius.circular(50)),
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 2, //阴影范围
                                    spreadRadius: 1, //阴影浓度
                                    color: Colors.grey, //阴影颜色
                                  ),
                                ],
                              ),
                              child: TextButton(
                                onPressed: () {
                                  // 购物车为空的时候,不能提交订单
                                  if (Provider.of<CartModel>(context, listen: false).getCheckProduct().isEmpty) {
                                    return;
                                  }
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const OrderSubmit(),
                                    ),
                                  );
                                },
                                child: const Text(
                                  '去结算',
                                  style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  )))
        ],
      ),
    );
  }
}
