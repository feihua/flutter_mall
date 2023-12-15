import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mall/brand_detail.dart';
import 'package:flutter_mall/config/service_url.dart';
import 'package:flutter_mall/utils/http_util.dart';
import 'package:flutter_mall/widgets/cached_image_widget.dart';

import 'model/brand_list.dart';

///
/// 品牌列表页面
///
/// 作者：刘飞华
/// 日期：2023/11/21 17:17
///
class BrandList extends StatefulWidget {
  const BrandList({super.key});

  @override
  State<BrandList> createState() => _BrandListState();
}

class _BrandListState extends State<BrandList> {
  List<BrandListData> brandListData = [];

  @override
  void initState() {
    super.initState();
    _queryBrandListData();
  }

  void _queryBrandListData() async {
    Response result = await HttpUtil.get(brandListDataUrl);
    setState(() {
      BrandListModel brandListModel = BrandListModel.fromJson(result.data);
      brandListData = brandListModel.data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(" 推荐品牌列表 "),
          titleTextStyle: const TextStyle(fontSize: 16, color: Colors.black),
          centerTitle: true,
        ),
        body: Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            child: CustomScrollView(
              shrinkWrap: true,
              slivers: [buildBrandLogo(context), buildBrandList()],
            )));
  }

  // 构建推荐品牌页面的logo上半部分
  SliverPadding buildBrandLogo(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(0),
      sliver: SliverList(
          delegate: SliverChildListDelegate(<Widget>[
        Image.asset(
          "images/recommend_brand_banner.png",
          height: 200,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.fill,
        ),
        Container(
          height: 10,
          width: MediaQuery.of(context).size.width,
          color: Color(int.parse('f5f5f5', radix: 16)).withAlpha(255),
        ),
        Container(
          height: 45,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          color: Colors.white,
          child:
              Text("相关品牌", style: TextStyle(fontSize: 15, color: Color(int.parse('303133', radix: 16)).withAlpha(255))),
        ),
      ])),
    );
  }

  // 构建推荐品牌列表
  SliverGrid buildBrandList() {
    return SliverGrid.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 1.2, crossAxisSpacing: 10),
        itemCount: brandListData.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    // 跳转品牌详情
                    builder: (context) => BrandDetail(
                      brandId: brandListData[index].id,
                    ),
                  ),
                );
              },
              child: buildBrandItem(brandListData[index]));
        });
  }

  // 构建品牌项
  Padding buildBrandItem(BrandListData data) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedImageWidget(
            165,
            75,
            data.logo,
            fit: BoxFit.contain,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(data.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 16, color: Color(int.parse('303133', radix: 16)).withAlpha(255))),
          const SizedBox(
            height: 8,
          ),
          Text("商品数量：${data.productCount}",
              style: TextStyle(fontSize: 12, color: Color(int.parse('909399', radix: 16)).withAlpha(255))),
        ],
      ),
    );
  }
}
