import 'package:flutter/material.dart';
import 'package:flutter_mall/view/cart/cart.dart';
import 'package:flutter_mall/view/category/categories.dart';
import 'package:flutter_mall/view/home/home_page.dart';
import 'package:flutter_mall/view/mine/mine.dart';

///
/// 底部导航页-切换页面
///
/// 作者：刘飞华
/// 日期：2023/11/21 17:17
///
final pages = [
  const HomePage(), //首页
  const Categories(), //分类
  const Cart(), //购物车
  const Mine() //个人主页
];

///
/// 底部导航-图标和文字定义
///
/// 作者：刘飞华
/// 日期：2023/11/21 17:17
///
List<BottomNavigationBarItem> items() {
  return [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: '首页',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.category),
      label: '分类',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.shopping_cart),
      label: '购物车',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: '我的',
    ),
  ];
}
