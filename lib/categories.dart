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
  // 一级分类
  List<CategoriesData> categoriesLevel1Data = [];

  // 二级分类
  List<CategoriesData> categoriesLevel2Data = [];

  // 默认选中的一级菜单项
  String selectedCategory = '';

  @override
  void initState() {
    super.initState();
    // 0:表示一级分类，1：表示二级分类
    _queryCategoriesData("0");
  }

  // 请求分类列表数据
  void _queryCategoriesData(String level) async {
    Response result = await HttpUtil.get("$categoriesDataUrl$level");
    CategoriesModel categoriesModel = CategoriesModel.fromJson(result.data);
    categoriesLevel2Data.clear();
    setState(() {
      if (level.contains("0")) {
        categoriesLevel1Data = categoriesModel.data;
        // 设置默认选择的中一级分类
        selectedCategory = categoriesLevel1Data[0].name;
      } else {
        categoriesLevel2Data = categoriesModel.data;
      }
    });

    // 如果是第一次请求一级分类的时候,要默认带出第一个二级分类
    if (level.contains("0")) {
      Response result2 = await HttpUtil.get("$categoriesDataUrl${categoriesModel.data[0].id}");
      CategoriesModel categoriesModel2 = CategoriesModel.fromJson(result2.data);
      setState(() {
        categoriesLevel2Data = categoriesModel2.data;
      });
    }
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
            Container(
              color: Colors.white,
              width: 100.0,
              child: ListView.builder(
                  itemCount: categoriesLevel1Data.length,
                  itemBuilder: (BuildContext context, int index) {
                    String name = categoriesLevel1Data[index].name;
                    return InkWell(
                      onTap: () {
                        setState(() {
                          // 0:表示一级分类，1：表示二级分类
                          _queryCategoriesData(categoriesLevel1Data[index].id.toString());
                          selectedCategory = name;
                        });
                      },
                      child: Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(15),
                            height: 50,
                            color:
                                name == selectedCategory ? Color(int.parse('f5f5f5', radix: 16)).withAlpha(255) : null,
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
            ),
            // 右侧二级菜单（流式布局）
            Expanded(
              child: Container(
                alignment: Alignment.topCenter,
                color: Colors.white,
                margin: const EdgeInsets.only(left: 6, top: 6),
                padding: const EdgeInsets.all(16.0),
                child: buildSecondLevelMenu(selectedCategory),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 根据选中的一级菜单项构建对应的二级菜单
  Widget buildSecondLevelMenu(String category) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      children: categoriesLevel2Data.map((item) {
        return GestureDetector(
          onTap: () {
            // 处理二级菜单项点击事件，跳转到商品详情页
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>  ProductList(productCategoryId: item.id,),
              ),
            );
          },
          child: Column(
            children: [
              CachedImageWidget(
                70,
                70,
                item.icon!,
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
