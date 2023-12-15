import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mall/config/constant_param.dart';
import 'package:flutter_mall/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../config/nav_key.dart';

///
/// http工具类
///
/// 作者：刘飞华
/// 日期：2023/11/21 17:17
///
class HttpUtil {
  static Dio? _dio;

  static Dio get dio {
    if (_dio == null) {
      // 配置Dio实例
      BaseOptions options = BaseOptions(
        baseUrl: "https://api.example.com", // 你的API地址
        connectTimeout: const Duration(milliseconds: 5000), // 设置连接超时时间为5秒
        receiveTimeout: const Duration(milliseconds: 5000), // 设置接收数据超时时间为5秒
      );

      _dio = Dio(options);

      // 可以添加拦截器、日志等其他配置

      // 添加请求拦截器
      _dio!.interceptors.add(InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          if (kDebugMode) {
            print("\n");
            print("\n");
            print("========================请求数据===================");
            print("url=${options.uri.toString()}");
            print("params=${options.data}");
          }

          // 在请求之前做一些操作，比如添加token等
          return handler.next(options);
        },
        onResponse: (Response response, ResponseInterceptorHandler handler) {
          if (kDebugMode) {
            print("\n");
            print("\n");
            print("========================响应数据===================");
            print("code=${response.statusCode}");
            print("response=${response.data}");
            print("==================================================");
            print("\n");
            print("\n");
            print("\n");
          }

          // 在响应之前做一些操作
          return handler.next(response);
        },
        onError: (DioException e, ErrorInterceptorHandler handler) {
          // 在错误之前做一些操作
          if (e.response?.statusCode == 401) {
            Navigator.of(NavKey.navKey.currentState!.context).push(
              MaterialPageRoute(
                builder: (context) => const Login(),
              ),
            );
            return;
          }
          return handler.next(e);
        },
      ));
    }

    return _dio!;
  }

  // 封装GET请求
  static Future<Response> get(String path, {Map<String, dynamic>? queryParameters}) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      Map<String, dynamic> header = <String, dynamic>{};
      header["Authorization"] = prefs.getString(token);

      Response response = await dio.get(
        path,
        queryParameters: queryParameters,
        options: Options(headers: header),
      );
      return response;
    } catch (e) {
      throw e;
    }
  }

  // 封装POST请求，数据以JSON格式发送
  static Future<Response> post(String path, {Map<String, dynamic>? data}) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      Map<String, dynamic> header = <String, dynamic>{};
      header["Authorization"] = prefs.getString(token);

      Response response = await dio.post(
        path,
        data: jsonEncode(data),
        options: Options(contentType: 'application/json', headers: header),
      );
      return response;
    } catch (e) {
      throw e;
    }
  }

  // 封装POST请求，数据以form表单格式发送
  static Future<Response> postForm(String path, {Map<String, dynamic>? data}) async {
    try {
      Response response = await dio.post(
        path,
        queryParameters: data,
      );
      return response;
    } catch (e) {
      throw e;
    }
  }
}
