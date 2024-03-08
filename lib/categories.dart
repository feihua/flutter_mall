import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mall/config/service_url.dart';
import 'package:flutter_mall/product_list.dart';
import 'package:flutter_mall/utils/http_util.dart';
import 'package:flutter_mall/widgets/cached_image_widget.dart';

import 'model/categories_model.dart';

///
/// 商品分类页面
///
/// 作者：刘飞华
/// 日期：2023/11/21 17:17
///
class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

// 商品分类页面
class _CategoriesState extends State<Categories> {
  // 商品一级分类
  List<CategoriesData>? firstCategoriesData = [];

  // 商品二级分类
  List<CategoriesData>? secondCategoriesData = [];

  // 默认选中的一级菜单项
  String selectedCategory = '';

  // 选择数据的索引
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _queryCategoriesData();
  }

  // 请求分类列表数据
  void _queryCategoriesData() async {
    Response result = await HttpUtil.get(categoriesDataUrl);
    CategoriesModel categoriesModel = CategoriesModel.fromJson(result.data);
    setState(() {
      firstCategoriesData = categoriesModel.data;
      secondCategoriesData = categoriesModel.data[0].children;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("分类"),
        titleTextStyle: const TextStyle(fontSize: 16, color: Colors.black),
        centerTitle: true,
      ),
      body: Container(
        color: Color(int.parse('f5f5f5', radix: 16)).withAlpha(255),
        child: Row(
          children: <Widget>[
            // 左侧一级菜单
            firstCategoriesData != null ? buildFirstCategories() : Container(),
            // 右侧二级菜单（流式布局）
            Expanded(
              child: Container(
                alignment: Alignment.topCenter,
                color: Colors.white,
                margin: const EdgeInsets.only(left: 6, top: 6),
                padding: const EdgeInsets.all(16.0),
                child: secondCategoriesData != null ? buildSecondCategories() : Container(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 构建一级商品分类
  Container buildFirstCategories() {
    return Container(
      color: Colors.white,
      width: 100.0,
      child: ListView.builder(
          itemCount: firstCategoriesData!.length,
          itemBuilder: (BuildContext context, int index) {
            String name = firstCategoriesData![index].name;
            return InkWell(
              onTap: () {
                setState(() {
                  selectedCategory = name;
                  secondCategoriesData = firstCategoriesData![index].children;
                });
              },
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(15),
                    height: 50,
                    color: name == selectedCategory ? Color(int.parse('f5f5f5', radix: 16)).withAlpha(255) : null,
                    child: Text(
                      name,
                      style: TextStyle(
                          fontSize: 14,
                          color: name == selectedCategory
                              ? Color(int.parse('fa436a', radix: 16)).withAlpha(255)
                              : Color(int.parse('606266', radix: 16)).withAlpha(255)),
                    ),
                  ),
                  Visibility(
                    visible: name == selectedCategory,
                    child: Text(
                      "|",
                      style: TextStyle(
                        color: Color(int.parse('fa436a', radix: 16)).withAlpha(255),
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }

  // 根据选中的一级分类项构建对应的二级分类
  Widget buildSecondCategories() {
    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      children: secondCategoriesData!.map((item) {
        return GestureDetector(
          onTap: () {
            // 处理二级菜单项点击事件，跳转到商品详情页
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductList(
                  productCategoryId: item.id,
                ),
              ),
            );
          },
          child: Column(
            children: [
              CachedImageWidget(
                70,
                70,
                item.imageUrl,
                fit: BoxFit.contain,
              ),
              Text(
                item.name,
                style: TextStyle(fontSize: 13, color: Color(int.parse('666666', radix: 16)).withAlpha(255)),
              )
            ],
          ),
        );
      }).toList(),
    );
  }
}
