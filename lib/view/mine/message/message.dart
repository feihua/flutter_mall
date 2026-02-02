import 'package:flutter/material.dart';

///
/// 消息页面
///
/// 作者：刘飞华
/// 日期：2023/11/21 17:17
///
class Message extends StatefulWidget {
  const Message({super.key});

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("通知"),
        centerTitle: true,
      ),
      body: Container(
        color: Color(int.parse('f5f5f5', radix: 16)).withAlpha(255),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        // width: MediaQuery.of(context).size.width,
        child: ListView.builder(
            itemCount: 3,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Column(
                  children: [
                    Text("2023-11-02 15:20:00",
                        style: TextStyle(fontSize: 13, color: Color(int.parse('7d7d7d', radix: 16)).withAlpha(255))),
                    Container(
                      color: Colors.white,
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "新品上市，全场满199减50",
                            style: TextStyle(fontSize: 16, color: Color(int.parse('303133', radix: 16)).withAlpha(255)),
                          ),
                          Image.network(
                            "http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg",
                            width: 115,
                            height: 130,
                          ),
                          Text(
                            "新品上市全场2折起，新品上市全场2折起，新品上市全场2折起，新品上市全场2折起，新品上市全场2折起",
                            style: TextStyle(fontSize: 14, color: Color(int.parse('606266', radix: 16)).withAlpha(255)),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            padding: const EdgeInsets.only(top: 10),
                            decoration: BoxDecoration(
                                border: Border(
                                    top: BorderSide(
                                        width: 1, color: Color(int.parse('f5f5f5', radix: 16)).withAlpha(255)))),
                            child: Row(
                              children: [
                                Expanded(
                                    child: Text("查看详情",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Color(int.parse('707070', radix: 16)).withAlpha(255)))),
                                Image.asset(
                                  "images/right_arrow.png",
                                  height: 16,
                                  width: 17,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}
