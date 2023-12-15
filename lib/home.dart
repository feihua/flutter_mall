import 'dart:convert';

import 'package:card_swiper/card_swiper.dart';
import 'package:dio/dio.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_mall/brand_detail.dart';
import 'package:flutter_mall/brand_list.dart';
import 'package:flutter_mall/model/home_model.dart';
import 'package:flutter_mall/product_detail.dart';
import 'package:flutter_mall/utils/http_util.dart';
import 'package:flutter_mall/widgets/cached_image_widget.dart';

import 'config/service_url.dart';
import 'model/brand_list.dart';

///
/// 首页
///
/// 作者：刘飞华
/// 日期：2023/11/21 17:17
///
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // banner轮播图
  List<AdvertiseList> advertiseList = [];

  // 品牌列表
  List<BrandListData> brandList = [];

  // 秒杀
  HomeFlashPromotion? homeFlashPromotion;
  List<ProductList> flashProductList = [];

  // 新鲜好物商品
  List<ProductList> newProductList = [];

  // 人气推荐商品
  List<ProductList> hotProductList = [];

  int _count = 4;
  late EasyRefreshController _controller;

  @override
  void initState() {
    super.initState();
    _controller = EasyRefreshController(
      controlFinishRefresh: true,
      controlFinishLoad: true,
    );
    _queryHomeData();
  }

  void _queryHomeData() async {
    Response result = await HttpUtil.get(homeDataUrl);
    setState(() {
      HomeModel homeModel = HomeModel.fromJson(result.data);
      advertiseList = homeModel.data.advertiseList;
      brandList = homeModel.data.brandList;
      homeFlashPromotion = homeModel.data.homeFlashPromotion;
      flashProductList = homeModel.data.homeFlashPromotion.productList;
      newProductList = homeModel.data.newProductList;
      hotProductList = homeModel.data.hotProductList;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.white,
      child: EasyRefresh(
        controller: _controller,
        onRefresh: () async {
          setState(() {
            _count = 6;
          });
          _controller.finishRefresh();
          _controller.resetFooter();
          // return IndicatorResult.success;
        },
        onLoad: () async {
          await Future.delayed(const Duration(seconds: 2));
          if (!mounted) {
            return;
          }
          setState(() {
            _count += 2;
          });
          _controller.finishLoad(_count >= 30 ? IndicatorResult.noMore : IndicatorResult.success);
        },
        child: CustomScrollView(
          shrinkWrap: true,
          slivers: [
            buildHeader(),
            buildBanner(),
            buildSubject(),
            buildBrandTitle(),
            buildBrandContent(),
            buildFlashSaleTitle(),
            buildFlashSaleContent(4),
            buildNewProductTitle(),
            buildNewProductContent(6),
            buildHotProductTitle(),
            buildHotProductContent(6),
            buildLikeTitle(),
            buildLikeContent(_count),
          ],
        ),
      ),
    ));
  }

  SliverPadding buildHeader() {
    return SliverPadding(
        padding: const EdgeInsets.all(0.0),
        sliver: SliverList(
            delegate: SliverChildListDelegate(<Widget>[
          Container(
            height: 44,
            color: Colors.red.shade400,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  "images/scan.png",
                  height: 30,
                  width: 30,
                ),
                InkWell(
                  onTap: () {
                    print("click the search bar");
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (context) => const SearchDetail(),
                    //   ),
                    // );
                  },
                  child: const Text(
                    "请输入商品 例如：手机",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Image.asset(
                  "images/message.png",
                  height: 30,
                  width: 30,
                )
              ],
            ),
          )
        ])));
  }

  SliverPadding buildBanner() {
    var list = [
      "http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/xiaomi_banner_01.png",
      'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/huawei_banner_01.png',
      'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/apple_banner_01.png',
      'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/sanxing_banner_01.png',
      'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/oppo_banner_01.png'
    ];
    return SliverPadding(
        padding: const EdgeInsets.all(0.0),
        sliver: SliverList(
            delegate: SliverChildListDelegate(<Widget>[
          SizedBox(
            height: 200,
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return CachedImageWidget(double.infinity, double.infinity, advertiseList[index].pic);
              },
              autoplay: true,
              itemCount: advertiseList.length,
              pagination: const SwiperPagination(),
              control: const SwiperControl(),
              onTap: (index) {
                print(index);
              },
            ),
          )
        ])));
  }

  SliverPadding buildSubject() {
    var style = TextStyle(fontSize: 12, color: Color(int.parse('303133', radix: 16)).withAlpha(255));

    return SliverPadding(
        padding: const EdgeInsets.all(0.0),
        sliver: SliverList(
            delegate: SliverChildListDelegate(<Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5)),
            margin: const EdgeInsets.only(top: 8),
            padding: const EdgeInsets.symmetric(vertical: 20),
            // height: 98,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "images/c3.png",
                      height: 44,
                      width: 44,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text("专题", style: style),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "images/c5.png",
                      height: 44,
                      width: 44,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text("话题", style: style),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "images/c6.png",
                      height: 44,
                      width: 44,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text("优选", style: style),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "images/c7.png",
                      height: 44,
                      width: 44,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text("特惠", style: style),
                  ],
                )
              ],
            ),
          )
        ])));
  }

  SliverPadding buildBrandTitle() {
    return SliverPadding(
        padding: const EdgeInsets.all(0.0),
        sliver: SliverList(
            delegate: SliverChildListDelegate(<Widget>[
          Container(
            color: Color(int.parse('f5f5f5', radix: 16)).withAlpha(255),
            height: 8,
          ),
          Container(
            color: Colors.white,
            // margin: const EdgeInsets.only(top: 8),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 70,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const BrandList(),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        Expanded(
                            child: Row(
                          children: [
                            Image.asset(
                              "images/icon_home_brand.png",
                              height: 40,
                              width: 40,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("品牌制造商直供",
                                    style: TextStyle(
                                        fontSize: 17, color: Color(int.parse('303133', radix: 16)).withAlpha(255))),
                                Text("工厂直达消费者,剔除商品溢价",
                                    style: TextStyle(
                                        fontSize: 12, color: Color(int.parse('909399', radix: 16)).withAlpha(255))),
                              ],
                            ),
                          ],
                        )),
                        Image.asset(
                          "images/right_arrow.png",
                          height: 20,
                          width: 20,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ])));
  }

  SliverGrid buildBrandContent() {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 1.4),
      itemCount: brandList.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) =>  BrandDetail(
                  brandId: brandList[index].id,
                ),
              ),
            );
          },
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CachedImageWidget(
                  160,
                  75,
                  brandList[index].logo,
                  fit: BoxFit.contain,
                ),
                Text(brandList[index].name,
                    style: TextStyle(fontSize: 16, color: Color(int.parse('303133', radix: 16)).withAlpha(255))),
                const SizedBox(
                  height: 5,
                ),
                Text("商品数量: ${brandList[index].productCount}",
                    style: TextStyle(fontSize: 12, color: Color(int.parse('909399', radix: 16)).withAlpha(255))),
              ],
            ),
          ),
        );
      },
    );
  }

  SliverPadding buildFlashSaleTitle() {
    return SliverPadding(
        padding: const EdgeInsets.all(0.0),
        sliver: SliverList(
            delegate: SliverChildListDelegate(<Widget>[
          Container(
            color: Color(int.parse('f5f5f5', radix: 16)).withAlpha(255),
            height: 8,
          ),
          Container(
            color: Colors.white,
            // margin: const EdgeInsets.only(top: 8),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            // height: 70,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 70,
                  child: Row(
                    children: [
                      Expanded(
                          child: Row(
                        children: [
                          Image.asset(
                            "images/icon_flash_promotion.png",
                            height: 40,
                            width: 40,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("秒杀专区",
                                  style: TextStyle(
                                      fontSize: 17, color: Color(int.parse('303133', radix: 16)).withAlpha(255))),
                              Text("下一场 ${homeFlashPromotion?.nextStartTime}开始",
                                  style: TextStyle(
                                      fontSize: 12, color: Color(int.parse('909399', radix: 16)).withAlpha(255))),
                            ],
                          ),
                        ],
                      )),
                      Image.asset(
                        "images/right_arrow.png",
                        height: 20,
                        width: 20,
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ])));
  }

  SliverGrid buildFlashSaleContent(int count) {
    return SliverGrid.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.65,
        ),
        itemCount: flashProductList.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ProductDetail(productId: flashProductList[index].id),
                  ),
                );
              },
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CachedImageWidget(
                      165,
                      165,
                      flashProductList[index].pic,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(flashProductList[index].name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style:
                                TextStyle(fontSize: 16, color: Color(int.parse('303133', radix: 16)).withAlpha(255))),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(flashProductList[index].subTitle,
                            maxLines: 2,
                            style:
                                TextStyle(fontSize: 12, color: Color(int.parse('909399', radix: 16)).withAlpha(255))),
                        const SizedBox(
                          height: 5,
                        ),
                        Text("￥${flashProductList[index].price}",
                            style: TextStyle(fontSize: 16, color: Color(int.parse('fa436a', radix: 16)).withAlpha(255)))
                      ],
                    )
                  ],
                ),
              ));
        });
  }

  SliverPadding buildNewProductTitle() {
    return SliverPadding(
        padding: const EdgeInsets.all(0.0),
        sliver: SliverList(
            delegate: SliverChildListDelegate(<Widget>[
          Container(
            color: Color(int.parse('f5f5f5', radix: 16)).withAlpha(255),
            height: 8,
          ),
          Container(
            color: Colors.white,
            // margin: const EdgeInsets.only(top: 8),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            // height: 70,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 70,
                  child: Row(
                    children: [
                      Expanded(
                          child: Row(
                        children: [
                          Image.asset(
                            "images/icon_new_product.png",
                            height: 40,
                            width: 40,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("新鲜好物",
                                  style: TextStyle(
                                      fontSize: 17, color: Color(int.parse('303133', radix: 16)).withAlpha(255))),
                              Text("为你寻觅世间好物",
                                  style: TextStyle(
                                      fontSize: 12, color: Color(int.parse('909399', radix: 16)).withAlpha(255))),
                            ],
                          ),
                        ],
                      )),
                      Image.asset(
                        "images/right_arrow.png",
                        height: 20,
                        width: 20,
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ])));
  }

  SliverPadding buildNewProductContent(int count) {
    return SliverPadding(
      padding: const EdgeInsets.all(0),
      sliver: SliverToBoxAdapter(
        child: Container(
          height: 270,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: newProductList.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProductDetail(productId: newProductList[index].id),
                      ),
                    );
                  },
                  child: Container(
                    color: Colors.white,
                    width: 200,
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: Column(
                      children: [
                        CachedImageWidget(
                          150,
                          150,
                          newProductList[index].pic,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(newProductList[index].name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 16, color: Color(int.parse('303133', radix: 16)).withAlpha(255))),
                            const SizedBox(
                              height: 6,
                            ),
                            Text(newProductList[index].subTitle,
                                maxLines: 2,
                                style: TextStyle(
                                    fontSize: 12, color: Color(int.parse('909399', radix: 16)).withAlpha(255))),
                            const SizedBox(
                              height: 6,
                            ),
                            Text("￥${newProductList[index].price}",
                                style: TextStyle(
                                    fontSize: 16, color: Color(int.parse('fa436a', radix: 16)).withAlpha(255))),
                          ],
                        ))
                      ],
                    ),
                  ));
            },
          ),
        ),
      ),
    );
  }

  SliverPadding buildHotProductTitle() {
    return SliverPadding(
        padding: const EdgeInsets.all(0.0),
        sliver: SliverList(
            delegate: SliverChildListDelegate(<Widget>[
          Container(
            color: Color(int.parse('f5f5f5', radix: 16)).withAlpha(255),
            height: 8,
          ),
          Container(
            color: Colors.white,
            // margin: const EdgeInsets.only(top: 8),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            // height: 70,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 70,
                  child: Row(
                    children: [
                      Expanded(
                          child: Row(
                        children: [
                          Image.asset(
                            "images/icon_hot_product.png",
                            height: 40,
                            width: 40,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("人气推荐",
                                  style: TextStyle(
                                      fontSize: 17, color: Color(int.parse('303133', radix: 16)).withAlpha(255))),
                              Text("大家都赞不绝口的",
                                  style: TextStyle(
                                      fontSize: 12, color: Color(int.parse('909399', radix: 16)).withAlpha(255))),
                            ],
                          ),
                        ],
                      )),
                      Image.asset(
                        "images/right_arrow.png",
                        height: 20,
                        width: 20,
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ])));
  }

  SliverList buildHotProductContent(int count) {
    return SliverList.builder(
        itemCount: hotProductList.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ProductDetail(productId: hotProductList[index].id),
                  ),
                );
              },
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    CachedImageWidget(
                      103,
                      125,
                      hotProductList[index].pic,
                      fit: BoxFit.fill,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(hotProductList[index].name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style:
                                TextStyle(fontSize: 16, color: Color(int.parse('303133', radix: 16)).withAlpha(255))),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(hotProductList[index].subTitle,
                            maxLines: 2,
                            style:
                                TextStyle(fontSize: 12, color: Color(int.parse('909399', radix: 16)).withAlpha(255))),
                        const SizedBox(
                          height: 6,
                        ),
                        Text("￥${hotProductList[index].price}",
                            style:
                                TextStyle(fontSize: 16, color: Color(int.parse('fa436a', radix: 16)).withAlpha(255))),
                      ],
                    ))
                  ],
                ),
              ));
        });
  }

  SliverPadding buildLikeTitle() {
    return SliverPadding(
        padding: const EdgeInsets.all(0.0),
        sliver: SliverList(
            delegate: SliverChildListDelegate(<Widget>[
          Container(
            color: Color(int.parse('f5f5f5', radix: 16)).withAlpha(255),
            height: 8,
          ),
          Container(
            color: Colors.white,
            // margin: const EdgeInsets.only(top: 8),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            // height: 70,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 70,
                  child: Row(
                    children: [
                      Expanded(
                          child: Row(
                        children: [
                          Image.asset(
                            "images/icon_recommend_product.png",
                            height: 40,
                            width: 40,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("猜你喜欢",
                                  style: TextStyle(
                                      fontSize: 17, color: Color(int.parse('303133', radix: 16)).withAlpha(255))),
                              Text("你喜欢的都在这里了",
                                  style: TextStyle(
                                      fontSize: 12, color: Color(int.parse('909399', radix: 16)).withAlpha(255))),
                            ],
                          ),
                        ],
                      )),
                    ],
                  ),
                ),
              ],
            ),
          )
        ])));
  }

  SliverGrid buildLikeContent(int count) {
    return SliverGrid.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.65,
        ),
        itemCount: hotProductList.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ProductDetail(productId: hotProductList[index].id),
                  ),
                );
              },
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CachedImageWidget(
                      165,
                      165,
                      hotProductList[index].pic,
                      fit: BoxFit.fill,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(hotProductList[index].name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style:
                                TextStyle(fontSize: 16, color: Color(int.parse('303133', radix: 16)).withAlpha(255))),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(hotProductList[index].subTitle,
                            maxLines: 2,
                            style:
                                TextStyle(fontSize: 12, color: Color(int.parse('909399', radix: 16)).withAlpha(255))),
                        const SizedBox(
                          height: 5,
                        ),
                        Text("￥${hotProductList[index].price}",
                            style: TextStyle(fontSize: 16, color: Color(int.parse('fa436a', radix: 16)).withAlpha(255)))
                      ],
                    )
                  ],
                ),
              ));
        });
  }
}
