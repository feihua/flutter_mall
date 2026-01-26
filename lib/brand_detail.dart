import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mall/config/service_url.dart';
import 'package:flutter_mall/product_detail.dart';
import 'package:flutter_mall/utils/http_util.dart';
import 'package:flutter_mall/widgets/cached_image_widget.dart';

import 'model/brand_detail.dart';

///
/// 品牌详情页面
///
/// 作者：刘飞华
/// 日期：2023/11/21 17:17
///
class BrandDetail extends StatefulWidget {
  final int brandId;

  const BrandDetail({super.key, required this.brandId});

  @override
  State<BrandDetail> createState() => _BrandDetailState();
}

class _BrandDetailState extends State<BrandDetail> {
  BrandData? brandDetailData;
  List<BrandProductData>? productListBrandDataItem = [];
  // List<ProductList>? productList = [];

  @override
  void initState() {
    super.initState();
    _queryBrandDetailData();
    // _queryProductListData();
  }

  void _queryBrandDetailData() async {
    Response result = await HttpUtil.get(brandDetailDataUrl + widget.brandId.toString());
    setState(() {
      BrandDetailModel brandDetailModel = BrandDetailModel.fromJson(result.data);
      brandDetailData = brandDetailModel.data.brandData;
      productListBrandDataItem = brandDetailModel.data.brandProductData;
    });
  }

  // void _queryProductListData() async {
  //   Response result = await HttpUtil.get(productListDataUrl1);
  //   setState(() {
  //     ProductListBrandModel productListBrandModel = ProductListBrandModel.fromJson(result.data);
  //     productListBrandDataItem = productListBrandModel.data.list;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(" 品牌详情"),
          titleTextStyle: const TextStyle(fontSize: 16, color: Colors.black),
          centerTitle: true,
        ),
        body: brandDetailData != null
            ? Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                child: CustomScrollView(
                  shrinkWrap: true,
                  slivers: [buildBrandLogo(context), buildBrandList()],
                ))
            : Container());
  }

  // 构建推荐品牌页面的logo上半部分
  SliverPadding buildBrandLogo(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(0),
      sliver: SliverList(
          delegate: SliverChildListDelegate(<Widget>[
        CachedImageWidget(
          MediaQuery.of(context).size.width,
          200,
          brandDetailData!.bigPic,
          fit: BoxFit.fill,
        ),
        // Image.network(
        //   "http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/xiaomi_banner_01.png",
        //   height: 200,
        //   width: MediaQuery.of(context).size.width,
        //   fit: BoxFit.fill,
        // ),
        Container(
          height: 10,
          width: MediaQuery.of(context).size.width,
          color: Color(int.parse('f5f5f5', radix: 16)).withAlpha(255),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          // height: 74,
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.network(
                brandDetailData!.logo,
                width: 103,
                height: 35,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(brandDetailData!.name,
                      style: TextStyle(fontSize: 18, color: Color(int.parse('303133', radix: 16)).withAlpha(255))),
                  Text("品牌首字母：${brandDetailData!.firstLetter}",
                      style: TextStyle(fontSize: 12, color: Color(int.parse('909399', radix: 16)).withAlpha(255))),
                ],
              ),
              Image.asset(
                "images/love1.png",
                width: 40,
                height: 41,
              ),
            ],
          ),
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
              Text("品牌故事", style: TextStyle(fontSize: 15, color: Color(int.parse('303133', radix: 16)).withAlpha(255))),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          padding: const EdgeInsets.all(15),
          child: Text(brandDetailData!.description,
              style: TextStyle(fontSize: 12, color: Color(int.parse('909399', radix: 16)).withAlpha(255))),
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
              Text("相关商品", style: TextStyle(fontSize: 15, color: Color(int.parse('303133', radix: 16)).withAlpha(255))),
        ),
      ])),
    );
  }

  // 构建推荐品牌关联商品列表
  SliverGrid buildBrandList() {
    return SliverGrid.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 0.68, crossAxisSpacing: 10),
        itemCount: productListBrandDataItem!.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    // 跳转商品详情
                    builder: (context) => ProductDetail(productId: productListBrandDataItem![index].id),
                  ),
                );
              },
              child: buildBrandItem(index));
        });
  }

  // 构建品牌项
  Padding buildBrandItem(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedImageWidget(
            165,
            165,
            productListBrandDataItem![index].mainPic,
            fit: BoxFit.contain,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(productListBrandDataItem![index].name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 16, color: Color(int.parse('303133', radix: 16)).withAlpha(255))),
          const SizedBox(
            height: 8,
          ),
          Text(productListBrandDataItem![index].subTitle,
              maxLines: 2, style: TextStyle(fontSize: 12, color: Color(int.parse('707070', radix: 16)).withAlpha(255))),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Expanded(
                child: Text("￥${productListBrandDataItem![index].price}",
                    style: TextStyle(fontSize: 16, color: Color(int.parse('fa436a', radix: 16)).withAlpha(255))),
              ),
              Text("已售 ${productListBrandDataItem![index].sales}",
                  style: TextStyle(fontSize: 12, color: Color(int.parse('909399', radix: 16)).withAlpha(255))),
            ],
          )
        ],
      ),
    );
  }
}
