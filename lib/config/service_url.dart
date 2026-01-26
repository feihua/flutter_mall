///
/// 接口地址
///
/// 作者：刘飞华
/// 日期：2023/11/21 17:17
///
///

// const baseUrl = "http://10.168.96.23:9999";
const baseUrl = "http://129.204.203.29/app";
// 首页
const homeDataUrl = "$baseUrl/api/home/index";
// 品牌列表
const brandListDataUrl = "$baseUrl/api/brand/queryBrandList";
// 品牌详情
const brandDetailDataUrl = "$baseUrl/api/brand/queryBrandProductList?brandId=";
// 分类
const categoriesDataUrl = "$baseUrl/api/product/queryProductCateList";
// 购物车
const cartDataUrl = "$baseUrl/api/cart/queryCartList";
// 添加商品进购物车
const cartAddUrl = "$baseUrl/api/cart/addCart";
// 商品列表
const productListDataUrl = "$baseUrl/api/product/queryProductList?productCategoryId=";
// 商品详情
const productDetailDataUrl = "$baseUrl/api/product/queryProductDetail?productId=";
// 通知消息
const messageListDataUrl = "$baseUrl/api/member/message/list/";
// 优惠券
const couponDataUrl = "$baseUrl/api/member/coupon/queryCouponList?useStatus=";
// 订单列表
const orderListDataUrl = "$baseUrl/api/order/queryOrderList?status=";
// 订单详情
const orderDetailDataUrl = "$baseUrl/api/order/queryOrderDetail?orderId=";
// 收货地址列表
const addressListDataUrl = "$baseUrl/api/member/queryAddressList";
// 添加会员地址
const addAddressDataUrl = "$baseUrl/api/member/addAddress ";
// 我的足迹
const historyListDataUrl = "$baseUrl/api/history/queryReadHistoryList";
// 我的收藏
const collectionListDataUrl = "$baseUrl/api/collection/queryCollectionList";
// 我的关注
const focusOnListDataUrl = "$baseUrl/api/member/attention/queryAttentionList";
// 登录
const loginDataUrl = "$baseUrl/api/member/login";
// 获取用户信息
const memberInfoDataUrl = "$baseUrl/api/member/info";
