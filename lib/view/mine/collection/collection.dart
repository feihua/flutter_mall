import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mall/config/service_url.dart';
import 'package:flutter_mall/utils/http_util.dart';
import 'package:flutter_mall/widgets/cached_image_widget.dart';

import '../../../model/collection_list.dart';
import '../../category/product/product_detail.dart';

///
/// 我的收藏页面
///
/// 作者：刘飞华
/// 日期：2023/11/21 17:17
///
class Collection extends StatefulWidget {
  const Collection({super.key});

  @override
  State<Collection> createState() => _CollectionState();
}

class _CollectionState extends State<Collection> {
  List<CollectionListData> collectionDataItem = [];

  @override
  void initState() {
    super.initState();
    queryCollectionList();
  }

  void queryCollectionList() async {
    Response result = await HttpUtil.get(collectionListDataUrl);
    CollectionListModel collectionListModel = CollectionListModel.fromJson(result.data);
    setState(() {
      collectionDataItem = collectionListModel.data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text("我的收藏"),
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
                    itemCount: collectionDataItem.length,
                    itemBuilder: (BuildContext context, int index) {
                      CollectionListData item = collectionDataItem[index];
                      return InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ProductDetail(
                                  productId: collectionDataItem[index].productId,
                                ),
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
                                    Text("￥${item.productPrice}",
                                        style: TextStyle(
                                            fontSize: 16, color: Color(int.parse('fa436a', radix: 16)).withAlpha(255))),
                                  ],
                                ))
                              ],
                            ),
                          ));
                    }))));
  }
}
