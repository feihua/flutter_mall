import 'package:alipay_kit/alipay_kit.dart';
import 'package:flutter/material.dart';

///
/// 支付宝测试页
///
/// 作者：刘飞华
/// 日期：2023/11/21 17:17
///
class PayTest extends StatefulWidget {
  const PayTest({super.key});

  @override
  State<PayTest> createState() => _PayTestState();
}

class _PayTestState extends State<PayTest> {
  TextEditingController controller = TextEditingController();
  String payInfo = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("支付测试"),
        titleTextStyle: const TextStyle(fontSize: 16, color: Colors.black),
        centerTitle: true,
      ),
      body: Container(
        color: Color(int.parse('f5f5f5', radix: 16)).withAlpha(255),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        child: Column(
          children: [
            TextField(
              controller: controller,
              onChanged: (value) {
                print(value);
                payInfo = value;
              },
              decoration: const InputDecoration(hintText: "支付宝信息"),
            ),
            InkWell(
              onTap: () {
                callPay();
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

  void callPay() async {
    final isInstall = await AlipayKitPlatform.instance.isInstalled();
    if (!isInstall) {
      print("未安装支付宝app");
    } else {
      // 此处是后台返回的支付信息
      await AlipayKitPlatform.instance.pay(
        orderInfo: payInfo,
        dynamicLaunch: true,
      );
    }
  }
}
