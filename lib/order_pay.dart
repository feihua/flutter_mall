import 'package:flutter/material.dart';
import 'package:flutter_mall/order_submit.dart';
import 'package:flutter_mall/pay_test.dart';

import 'order_list.dart';

///
/// 订单支付页面
///
/// 作者：刘飞华
/// 日期：2023/11/21 17:17
///
class OrderPay extends StatefulWidget {
  final double amount;

  const OrderPay({super.key, required this.amount});

  @override
  State<OrderPay> createState() => _OrderPayState();
}

class _OrderPayState extends State<OrderPay> {
  var check = 1;

  @override
  Widget build(BuildContext context) {
    var border = BorderSide(width: 1, color: Color(int.parse('f5f5f5', radix: 16)).withAlpha(255));
    var boxDecoration = BoxDecoration(border: Border(bottom: border));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("支付"),
        titleTextStyle: const TextStyle(fontSize: 16, color: Colors.black),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(top: 44),
        child: Column(
          children: [
            Column(
              children: [
                Text("支付金额",
                    style: TextStyle(fontSize: 12, color: Color(int.parse('909399', radix: 16)).withAlpha(255))),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("￥",
                        style: TextStyle(fontSize: 20, color: Color(int.parse('303133', radix: 16)).withAlpha(255))),
                    Text(widget.amount.toString(),
                        style: TextStyle(fontSize: 25, color: Color(int.parse('303133', radix: 16)).withAlpha(255))),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 60,
              margin: const EdgeInsets.only(left: 30),
              padding: const EdgeInsets.only(right: 18),
              decoration: boxDecoration,
              child: Row(
                children: [
                  Image.asset(
                    "images/wx_pay.png",
                    height: 27,
                    width: 26,
                    // fit: BoxFit.contain,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("微信支付",
                            style:
                                TextStyle(fontSize: 16, color: Color(int.parse('303133', radix: 16)).withAlpha(255))),
                        const SizedBox(
                          height: 2,
                        ),
                        Text("推荐使用微信支付",
                            style:
                                TextStyle(fontSize: 12, color: Color(int.parse('909399', radix: 16)).withAlpha(255))),
                      ],
                    ),
                  ),
                  Transform.scale(
                    scale: 1.3,
                    child: Checkbox(
                        value: check == 1,
                        activeColor: Color(int.parse('fa436a', radix: 16)).withAlpha(255),
                        shape: const CircleBorder(),
                        side: const BorderSide(width: 1, color: Colors.black26),
                        onChanged: (value) {
                          setState(() {
                            check = 1;
                          });
                        }),
                  )
                ],
              ),
            ),
            Container(
              height: 60,
              margin: const EdgeInsets.only(left: 30, bottom: 30),
              padding: const EdgeInsets.only(right: 18),
              child: Row(
                children: [
                  Image.asset(
                    "images/ali_pay.png",
                    height: 27,
                    width: 26,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Text("支付宝支付",
                        style: TextStyle(fontSize: 16, color: Color(int.parse('303133', radix: 16)).withAlpha(255))),
                  ),
                  Transform.scale(
                    scale: 1.3,
                    child: Checkbox(
                        value: check == 2,
                        activeColor: Color(int.parse('fa436a', radix: 16)).withAlpha(255),
                        shape: const CircleBorder(),
                        side: const BorderSide(width: 1, color: Colors.black26),
                        onChanged: (value) {
                          setState(() {
                            check = 2;
                          });
                        }),
                  )
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const PayTest(),
                  ),
                );
              },
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                height: 40,
                margin: const EdgeInsets.only(top: 15, left: 30, right: 30),
                decoration: BoxDecoration(
                  color: Color(int.parse('fa436a', radix: 16)).withAlpha(255),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Text(
                  '确认支付',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
