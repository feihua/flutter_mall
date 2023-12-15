import 'package:flutter/material.dart';

///
/// 评价页面
///
/// 作者：刘飞华
/// 日期：2023/11/21 17:17
///
class PinJia extends StatefulWidget {
  const PinJia({super.key});

  @override
  State<PinJia> createState() => _PinJiaState();
}

class _PinJiaState extends State<PinJia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("我的评价"),
        titleTextStyle: const TextStyle(fontSize: 16, color: Colors.black),
        centerTitle: true,
      ),
      body: Container(
        color: Color(int.parse('f5f5f5', radix: 16)).withAlpha(255),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
            itemCount: 3,
            itemBuilder: (BuildContext context, int index) {
              return const Padding(
                padding: EdgeInsets.only(top: 15),
                child: Column(
                  children: [Text("暂时没有评价!")],
                ),
              );
            }),
      ),
    );
  }
}
