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
  List<AttentionListData> collectionDataItem = [];

  @override
  void initState() {
    super.initState();
    queryFocusOnList();
  }

  void queryFocusOnList() async {
    Response result = await HttpUtil.get(focusOnListDataUrl);
    AttentionListModel focusOnListModel = AttentionListModel.fromJson(result.data);
    setState(() {
      collectionDataItem = focusOnListModel.data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text("我的关注"),
          titleTextStyle: const TextStyle(fontSize: 16, color: Colors.black),
          centerTitle: true,
        ),
        body: Container(
            color: Color(int.parse('f5f5f5', radix: 16)).withAlpha(255),
            width: MediaQuery.of(context).size.width,
            child: Column(children: buildBrandList(context))));
  }

  // 构建关注的品牌列表
  List<InkWell> buildBrandList(BuildContext context) {
    return collectionDataItem.map((item) {
      return InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) =>  BrandDetail(
                  brandId: item.id,
                ),
              ),
            );
          },
          child: Container(
            color: Colors.white,
            margin: const EdgeInsets.only(top: 5),
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                CachedImageWidget(
                  103,
                  85,
                  item.brandLogo,
                  fit: BoxFit.contain,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(item.brandName,
                    style: TextStyle(fontSize: 16, color: Color(int.parse('303133', radix: 16)).withAlpha(255))),
              ],
            ),
          ));
    }).toList();
  }
}
