import 'package:flutter/foundation.dart';

import '../model/cart_list.dart';

///
/// 购物车的状态
///
/// 作者：刘飞华
/// 日期：2023/11/21 17:17
///
class CartModel with ChangeNotifier, DiagnosticableTreeMixin {
  // 购物车所有商品
  Map<int, CartData> allCartProduct = <int, CartData>{};

  // 购物车选中的商品
  Map<int, CartData> checkCartProduct = <int, CartData>{};

  // 选择商品的价格总和
  double allProductPrice = 0;

  // 初始化购物车商品数据到状态管理中
  void setCartListData(List<CartData> cartListData) {
    for (var cart in cartListData) {
      allCartProduct[cart.productId] = cart;
      checkCartProduct[cart.productId] = cart;
    }
    notifyListeners();
  }

  // 设置商品选择是否选择的状态
  void setCartItemStatus(int productId) {
    if (checkCartProduct[productId] != null) {
      checkCartProduct.remove(productId);
    } else {
      checkCartProduct[productId] = allCartProduct[productId]!;
    }
    notifyListeners();
  }

  // 点击全选或者反选
  void setAllStatus() {
    if (checkCartProduct.length == allCartProduct.length) {
      checkCartProduct.clear();
    } else {
      checkCartProduct = Map.from(allCartProduct);
    }
    notifyListeners();
  }

  // 获取全选或者反选状态显示
  bool getAllStatus() {
    return checkCartProduct.length == allCartProduct.length;
  }

  // 判断购物车中商品前面的图标是否被选择
  bool getProductIsCheck(int productId) {
    return checkCartProduct[productId] != null;
  }

  // 获取所有商品
  List<CartData> getAllProduct() {
    List<CartData> list = [];
    allCartProduct.forEach((key, value) {
      list.add(value);
    });
    return list;
  }

  // 获取选择中的商品
  List<CartData> getCheckProduct() {
    List<CartData> list = [];
    checkCartProduct.forEach((key, value) {
      list.add(value);
    });
    return list;
  }

  // 计算所选中的商品的价格
  double getProductAllPrice() {
    allProductPrice = 0;
    checkCartProduct.forEach((key, value) {
      // 商品价格总和
      allProductPrice = allProductPrice + value.price;
    });

    return allProductPrice;
  }

  /// Makes `cartListData` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<Map<int, CartData>>('allCartProduct', allCartProduct));
    properties.add(DiagnosticsProperty<Map<int, CartData>>('checkCartProduct', checkCartProduct));
    properties.add(DoubleProperty('allProductPrice', allProductPrice));
  }
}
