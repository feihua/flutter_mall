import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mall/config/service_url.dart';
import 'package:flutter_mall/product_detail.dart';
import 'package:flutter_mall/utils/http_util.dart';
import 'package:flutter_mall/widgets/cached_image_widget.dart';

import 'model/hisotry_list.dart';

///
/// 我的足迹页面
///
/// 作者：刘飞华
/// 日期：2023/11/21 17:17
///
class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

// 历史记录页面的状态类
class _HistoryState extends State<History> {
  // 初始化一个空的历史记录列表
  List<HistoryListDataItem> historyListDataItem = [];

  // 初始化状态，调用父类的initState方法
  @override
  void initState() {
    super.initState();
    // 在初始化时查询历史记录列表
    queryHistoryList();
  }

  // 查询历史记录列表的方法
  void queryHistoryList() async {
    // 发起获取历史记录列表的HTTP请求
    Response result = await HttpUtil.get(historyListDataUrl);
    // 将请求结果转换为历史记录模型对象
    HistoryListModel historyListModel = HistoryListModel.fromJson(result.data);
    // 更新状态，设置历史记录列表数据
    setState(() {
      historyListDataItem = historyListModel.data;
    });
  }

  // 构建历史记录页面的UI
  @override
  Widget build(BuildContext context) {
    // 返回一个带有AppBar和历史记录列表的Scaffold
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text("我的足迹"),
          titleTextStyle: const TextStyle(fontSize: 16, color: Colors.black),
          centerTitle: true,
        ),
        body: Container(
            color: Color(int.parse('f5f5f5', radix: 16)).withAlpha(255),
            width: MediaQuery.of(context).size.width,
            child: Container(
                color: Colors.white,
                // height: 300,
                margin: const EdgeInsets.only(top: 5),
                padding: const EdgeInsets.all(15),
                child: ListView.builder(
                    itemCount: historyListDataItem.length,
                    itemBuilder: (BuildContext context, int index) {
                      HistoryListDataItem item = historyListDataItem[index];
                      return InkWell(
                          onTap: () {
                            // 点击历史记录项时，导航到产品详情页面
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ProductDetail(productId: historyListDataItem[index].productId),
                              ),
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 20),
                            child: Row(
                              children: [
                                CachedImageWidget(
                                  103,
                                  125,
                                  item.productPic,
                                  fit: BoxFit.fill,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(item.productName,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 16, color: Color(int.parse('303133', radix: 16)).withAlpha(255))),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    Text(item.productSubTitle,
                                        maxLines: 2,
                                        style: TextStyle(
                                            fontSize: 12, color: Color(int.parse('707070', radix: 16)).withAlpha(255))),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text("￥${item.productPrice}",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Color(int.parse('fa436a', radix: 16)).withAlpha(255))),
                                        ),
                                        Text(item.createTime.toString(),
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Color(int.parse('303133', radix: 16)).withAlpha(255))),
                                      ],
                                    )
                                  ],
                                ))
                              ],
                            ),
                          ));
                    }))));
  }
}
