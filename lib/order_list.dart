import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mall/config/service_url.dart';
import 'package:flutter_mall/order_detail.dart';
import 'package:flutter_mall/utils/http_util.dart';
import 'package:flutter_mall/widgets/cached_image_widget.dart';

import 'model/order_list_model.dart';

///
/// 订单列表页面
///
/// 作者：刘飞华
/// 日期：2023/11/21 17:17
///
class OrderList extends StatefulWidget {
  const OrderList({super.key});

  @override
  State<OrderList> createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  final List<String> orderStatus = ['全部', '待支付', '待发货', '已完成', '已取消'];

  List<OrderListData> orderListData = [];

  @override
  void initState() {
    super.initState();
    _queryOrderListData();
  }

  void _queryOrderListData() async {
    // todo 订单状态待完善
    Response result = await HttpUtil.get("${orderListDataUrl}1");
    setState(() {
      OrderListModel orderListModel = OrderListModel.fromJson(result.data);
      orderListData = orderListModel.data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: orderStatus.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(' 我的订单 '),
          titleTextStyle: const TextStyle(fontSize: 16, color: Colors.black),
          centerTitle: true,
          bottom: TabBar(
            indicatorColor: Color(
              int.parse('fa436a', radix: 16),
            ).withAlpha(255),
            labelColor: Color(int.parse('fa436a', radix: 16)).withAlpha(255),
            tabs: orderStatus.map((status) => Tab(text: status)).toList(),
          ),
        ),
        body: TabBarView(
          children:
              orderStatus.map((status) {
                return OrderListInfo(
                  status: status,
                  orderListData: orderListData,
                );
              }).toList(),
        ),
      ),
    );
  }
}

class OrderListInfo extends StatelessWidget {
  final String status;
  final List<OrderListData> orderListData;

  const OrderListInfo({
    super.key,
    required this.status,
    required this.orderListData,
  });

  @override
  Widget build(BuildContext context) {
    var border = BorderSide(
      width: 1,
      color: Color(int.parse('f5f5f5', radix: 16)).withAlpha(255),
    );
    var boxDecoration = BoxDecoration(border: Border(bottom: border));
    return ListView.builder(
      itemCount: orderListData.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder:
                    (context) => OrderDetail(orderId: orderListData[index].id),
              ),
            );
          },
          child: Container(
            padding: const EdgeInsets.only(left: 15),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 5,
                  color: Color(int.parse('f5f5f5', radix: 16)).withAlpha(255),
                ),
              ),
            ),
            child: Column(
              children: [
                buildCreateTime(boxDecoration, index),
                buildProductList(index),
                buildAmount(boxDecoration, index),
                buildOrderOperate(index),
              ],
            ),
          ),
        );
      },
    );
  }

  // 构建订单操作
  Container buildOrderOperate(int index) {
    int status = orderListData[index].status;
    return Container(
      padding: const EdgeInsets.only(right: 5),
      height: 40,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Visibility(
            visible: status == 0,
            child: TextButton(
              onPressed: () {},
              // style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white12)),
              child: Text(
                "取消订单",
                style: TextStyle(
                  fontSize: 14,
                  color: Color(int.parse('303133', radix: 16)).withAlpha(255),
                ),
              ),
            ),
          ),
          Visibility(
            visible: status == 2,
            child: TextButton(
              onPressed: () {},
              // style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white12)),
              child: Text(
                "查看物流",
                style: TextStyle(
                  fontSize: 14,
                  color: Color(int.parse('303133', radix: 16)).withAlpha(255),
                ),
              ),
            ),
          ),
          Visibility(
            visible: status == 0,
            child: TextButton(
              onPressed: () {},
              // style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white12)),
              child: Text(
                "立即付款",
                style: TextStyle(
                  fontSize: 14,
                  color: Color(int.parse('fa436a', radix: 16)).withAlpha(255),
                ),
              ),
            ),
          ),
          // const SizedBox(
          //   width: 5,
          // ),
          Visibility(
            visible: status == 2,
            child: TextButton(
              onPressed: () {},
              // style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color(int.parse('f7bcc8', radix: 16)).withAlpha(255))),
              child: Text(
                "确认收货",
                style: TextStyle(
                  fontSize: 14,
                  color: Color(int.parse('fa436a', radix: 16)).withAlpha(255),
                ),
              ),
            ),
          ),
          Visibility(
            visible: status == 3,
            child: TextButton(
              onPressed: () {},
              // style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color(int.parse('f7bcc8', radix: 16)).withAlpha(255))),
              child: Text(
                "评价商品",
                style: TextStyle(
                  fontSize: 14,
                  color: Color(int.parse('fa436a', radix: 16)).withAlpha(255),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 构建订单支付金额
  Container buildAmount(BoxDecoration boxDecoration, int index) {
    return Container(
      padding: const EdgeInsets.only(right: 15),
      height: 40,
      decoration: boxDecoration,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "共",
            style: TextStyle(
              fontSize: 13,
              color: Color(int.parse('707070', radix: 16)).withAlpha(255),
            ),
          ),
          Text(
            orderListData[index].orderItemList.length.toString(),
            style: TextStyle(
              fontSize: 13,
              color: Color(int.parse('303133', radix: 16)).withAlpha(255),
            ),
          ),
          Text(
            "件商品 实付款",
            style: TextStyle(
              fontSize: 13,
              color: Color(int.parse('707070', radix: 16)).withAlpha(255),
            ),
          ),
          Text(
            " ￥",
            style: TextStyle(
              fontSize: 12,
              color: Color(int.parse('707070', radix: 16)).withAlpha(255),
            ),
          ),
          Text(
            orderListData[index].payAmount.toString(),
            style: TextStyle(
              fontSize: 16,
              color: Color(int.parse('303133', radix: 16)).withAlpha(255),
            ),
          ),
        ],
      ),
    );
  }

  // 构建商品列表
  Column buildProductList(int index) {
    return Column(
      children:
          orderListData[index].orderItemList.map((item) {
            return Container(
              padding: const EdgeInsets.only(right: 15, top: 15),
              // decoration: boxDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CachedImageWidget(
                    60,
                    60,
                    item.productPic,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.productName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 15,
                            color: Color(
                              int.parse('303133', radix: 16),
                            ).withAlpha(255),
                          ),
                        ),
                        Text(
                          "颜色:黑色;容量:128G; x 1",
                          style: TextStyle(
                            fontSize: 13,
                            color: Color(
                              int.parse('707070', radix: 16),
                            ).withAlpha(255),
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "￥",
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(
                                  int.parse('707070', radix: 16),
                                ).withAlpha(255),
                              ),
                            ),
                            Text(
                              item.productPrice.toString(),
                              style: TextStyle(
                                fontSize: 15,
                                color: Color(
                                  int.parse('303133', radix: 16),
                                ).withAlpha(255),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
    );
  }

  // 构建订单生成时间和订单状态
  Container buildCreateTime(BoxDecoration boxDecoration, int index) {
    return Container(
      padding: const EdgeInsets.only(right: 15),
      height: 40,
      decoration: boxDecoration,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              orderListData[index].createTime.toString(),
              style: TextStyle(
                fontSize: 14,
                color: Color(int.parse('303133', radix: 16)).withAlpha(255),
              ),
            ),
          ),
          Text(
            getOrderStatus(orderListData[index].status),
            style: TextStyle(
              fontSize: 14,
              color: Color(int.parse('fa436a', radix: 16)).withAlpha(255),
            ),
          ),
          Visibility(
            visible: getDeleteStatus(orderListData[index].status),
            child: Container(
              margin: const EdgeInsets.only(left: 10),
              child: Image.asset("images/delete.png", height: 17, width: 16),
            ),
          ),
        ],
      ),
    );
  }

  // 状态转换
  String getOrderStatus(int status) {
    //0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单',
    Map statusMap = <int, String>{};
    statusMap[0] = "等待付款";
    statusMap[1] = "待发货";
    statusMap[2] = "等待收货";
    statusMap[3] = "交易完成";
    statusMap[4] = "交易关闭";
    statusMap[5] = "无效订单";

    return statusMap[status];
  }

  // 是否显示删除图标
  bool getDeleteStatus(int status) {
    //0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单',
    Map statusMap = <int, bool>{};
    statusMap[0] = false;
    statusMap[1] = false;
    statusMap[2] = false;
    statusMap[3] = true;
    statusMap[4] = true;
    statusMap[5] = true;

    return statusMap[status];
  }
}
