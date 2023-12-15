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
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // 初始化SharedPreferences
  await SharedPreferencesUtil.init();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Counter()),
        ChangeNotifierProvider(create: (_) => CartModel()),
      ],
      child: MaterialApp(
        navigatorKey: NavKey.navKey,
        title: 'shopping',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        home: const Welcome(),
      ),
    );
  }
}
