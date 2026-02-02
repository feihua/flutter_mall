import 'package:flutter/material.dart';
import 'package:flutter_mall/view/mine/login/login.dart';

import 'layout/main_tab.dart';


///
/// 欢迎页面(启动页)
///
/// 作者：刘飞华
/// 日期：2023/11/21 17:17
///
class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  void initState() {
    super.initState();
    //延迟3秒执行
    Future.delayed(const Duration(seconds: 3), () {
      //跳转至应用首页
      Navigator.of(context).pop();
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const MainTab(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        // decoration: const BoxDecoration(
        //   color: Colors.white,
        // ),
        // padding: const EdgeInsets.all(50.0),
        alignment: Alignment.center,
        child: Image.asset(
          "images/shopping_cart.png",
          width: 200,
          height: 105,
          fit: BoxFit.contain,
        ));
  }
}
