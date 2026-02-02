import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mall/config/service_url.dart';
import 'package:flutter_mall/utils/http_util.dart';
import 'package:flutter_mall/view/category/product/product_detail.dart';
import 'package:flutter_mall/widgets/cached_image_widget.dart';

import '../../../model/product_list.dart';

///
/// 商品列表页面
///
/// 作者：刘飞华
/// 日期：2023/11/21 17:17
///
class ProductList extends StatefulWidget {
  final int productCategoryId;
  const ProductList({super.key, required this.productCategoryId});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<ProductListData> productDataItem = [];

  @override
  void initState() {
    super.initState();
    queryCollectionList();
  }

  void queryCollectionList() async {
    Response result = await HttpUtil.get(productListDataUrl+widget.productCategoryId.toString());
    ProductListModel collectionListModel = ProductListModel.fromJson(result.data);
    setState(() {
      productDataItem = collectionListModel.data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text("商品列表"),
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
                child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, childAspectRatio: 0.63, crossAxisSpacing: 10),
                    itemCount: productDataItem.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ProductDetail(productId: productDataItem[index].id),
                              ),
                            );
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CachedImageWidget(
                                165,
                                165,
                                productDataItem[index].mainPic,
                                fit: BoxFit.fill,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(productDataItem[index].name,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 16, color: Color(int.parse('303133', radix: 16)).withAlpha(255))),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(productDataItem[index].subTitle,
                                  maxLines: 2,
                                  style: TextStyle(
                                      fontSize: 12, color: Color(int.parse('707070', radix: 16)).withAlpha(255))),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text("￥${productDataItem[index].price}",
                                        style: TextStyle(
                                            fontSize: 16, color: Color(int.parse('fa436a', radix: 16)).withAlpha(255))),
                                  ),
                                  Text("已售 ${productDataItem[index].sales}",
                                      style: TextStyle(
                                          fontSize: 12, color: Color(int.parse('909399', radix: 16)).withAlpha(255))),
                                ],
                              )
                            ],
                          ));
                    }))));
  }
}
