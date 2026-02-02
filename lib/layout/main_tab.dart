import 'package:flutter/material.dart';

import 'bottom_navigation_bar.dart';


///
/// 底部导航
///
/// 作者：刘飞华
/// 日期：2023/11/21 17:17
///
// 参考https://blog.csdn.net/sinat_41144773/article/details/129906589实现
class MainTab extends StatefulWidget {
  const MainTab({super.key});

  @override
  State<MainTab> createState() => _MainTabState();
}

class _MainTabState extends State<MainTab> {
  int _bottomNavigationIndex = 0; //底部导航的索引
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pages[_bottomNavigationIndex], //页面切换
        bottomNavigationBar: _bottomNavigationBar() //底部导航
        );
  }

  //底部导航-样式
  BottomNavigationBar _bottomNavigationBar() {
    return BottomNavigationBar(
      items: items(),
      //底部导航-图标和文字的定义，封装到函数里
      currentIndex: _bottomNavigationIndex,
      onTap: (flag) {
        setState(() {
          _bottomNavigationIndex = flag; //使用底部导航索引
        });
      },
      //onTap 点击切换页面
      fixedColor: Color(int.parse('fa436a', radix: 16)).withAlpha(255),
      //样式：图标选中时的颜色：蓝色
      type: BottomNavigationBarType.fixed, //样式：选中图标后的样式是固定的
    );
  }
}
