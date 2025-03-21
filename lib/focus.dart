import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mall/brand_detail.dart';
import 'package:flutter_mall/config/service_url.dart';
import 'package:flutter_mall/utils/http_util.dart';
import 'package:flutter_mall/widgets/cached_image_widget.dart';

import 'model/attention_list.dart';

///
/// 我的关注页面
///
/// 作者：刘飞华
/// 日期：2023/11/21 17:17
///
class FocusOn extends StatefulWidget {
  const FocusOn({super.key});

  @override
  State<FocusOn> createState() => _FocusOnState();
}

class _FocusOnState extends State<FocusOn> {
  // 定义一个用于存储关注列表数据的列表
  List<AttentionListData> collectionDataItem = [];

  // 初始化状态方法，用于在组件挂载时调用
  @override
  void initState() {
    super.initState();
    // 在组件初始化时查询关注列表数据
    queryFocusOnList();
  }

  // 异步方法，用于查询关注列表数据
  void queryFocusOnList() async {
    // 发起GET请求获取关注列表数据
    Response result = await HttpUtil.get(focusOnListDataUrl);
    // 将获取到的数据转换为AttentionListModel对象
    AttentionListModel focusOnListModel = AttentionListModel.fromJson(
      result.data,
    );
    // 更新状态，将解析后的数据赋值给collectionDataItem
    setState(() {
      collectionDataItem = focusOnListModel.data;
    });
  }

  // 构建组件方法
  @override
  Widget build(BuildContext context) {
    // 返回一个Scaffold组件，包含AppBar和身体内容
    return Scaffold(
      appBar: AppBar(
        // 设置AppBar的背景色、标题、标题样式和居中显示
        backgroundColor: Colors.white,
        title: const Text("我的关注"),
        titleTextStyle: const TextStyle(fontSize: 16, color: Colors.black),
        centerTitle: true,
      ),
      body: Container(
        // 设置容器的背景色、宽度和子组件
        color: Color(int.parse('f5f5f5', radix: 16)).withAlpha(255),
        width: MediaQuery.of(context).size.width,
        child: Column(children: buildBrandList(context)),
      ),
    );
  }

  // 构建关注的品牌列表
  List<InkWell> buildBrandList(BuildContext context) {
    // 遍历collectionDataItem列表，为每个项创建一个InkWell组件
    return collectionDataItem.map((item) {
      // 返回一个InkWell组件，包含品牌信息和点击事件
      return InkWell(
        onTap: () {
          // 点击时导航到品牌详情页面
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => BrandDetail(brandId: item.id),
            ),
          );
        },
        child: Container(
          // 设置容器的背景色、边距、内边距和子组件
          color: Colors.white,
          margin: const EdgeInsets.only(top: 5),
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              // 显示品牌logo
              CachedImageWidget(103, 85, item.brandLogo, fit: BoxFit.contain),
              const SizedBox(width: 8),
              // 显示品牌名称
              Text(
                item.brandName,
                style: TextStyle(
                  fontSize: 16,
                  color: Color(int.parse('303133', radix: 16)).withAlpha(255),
                ),
              ),
            ],
          ),
        ),
      );
    }).toList();
  }
}
