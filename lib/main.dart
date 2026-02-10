import 'package:flutter/material.dart';
import 'package:flutter_mall/provider/cart_model.dart';
import 'package:flutter_mall/provider/counter.dart';
import 'package:flutter_mall/utils/shared_preferences_util.dart';
import 'package:flutter_mall/welcome.dart';
import 'package:provider/provider.dart';

import 'config/nav_key.dart';

///
/// 应用入口页面
///
/// 作者：刘飞华
/// 日期：2023/11/21 17:17
///
// 程序的入口点
void main() async {
  // 确保Flutter的绑定被初始化，以便在主函数中使用Flutter的特性
  WidgetsFlutterBinding.ensureInitialized();
  // 初始化SharedPreferences
  await SharedPreferencesUtil.init();
  // 启动应用程序
  runApp(const MyApp());
}

// MyApp类是应用的根部件
class MyApp extends StatelessWidget {
  // 构造函数，使用super.key来初始化StatelessWidget的key属性
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 使用MultiProvider来管理应用的状态
    return MultiProvider(
      providers: [
        // 提供一个Counter实例
        ChangeNotifierProvider(create: (_) => Counter()),
        // 提供一个CartModel实例
        ChangeNotifierProvider(create: (_) => CartModel()),
      ],
      child: MaterialApp(
        // 设置全局的navigatorKey，以便在应用的任何地方进行导航
        navigatorKey: NavKey.navKey,
        title: 'shopping',
        theme: ThemeData(
          // 设置应用的主题颜色和使用Material 3设计
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        // 设置应用的首页为Welcome部件
        home: const Welcome(),
      ),
    );
  }
}
