///
/// 订单状态相关
///
/// 作者：刘飞华
/// 日期：2023/11/21 17:17
///
// 状态转换
String getOrderStatusTxt(int status) {
  //0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单',
  Map statusMap = <int, String>{};
  statusMap[0] = "等待付款";
  statusMap[1] = "待发货";
  statusMap[2] = "等待收货";
  statusMap[3] = "交易完成";
  statusMap[4] = "已关闭";
  statusMap[5] = "无效订单";

  return statusMap[status];
}
