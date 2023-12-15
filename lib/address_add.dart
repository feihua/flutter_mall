import 'package:flutter/material.dart';
import 'package:flutter_mall/address_list.dart';

///
/// 添加收货地址页面
///
/// 作者：刘飞华
/// 日期：2023/11/21 17:17
///
class AddressAdd extends StatefulWidget {
  const AddressAdd({super.key});

  @override
  State<AddressAdd> createState() => _AddressAddState();
}

class _AddressAddState extends State<AddressAdd> {
  @override
  Widget build(BuildContext context) {
    var textStyle = TextStyle(fontSize: 15, color: Color(int.parse('303133', radix: 16)).withAlpha(255));
    var border = BorderSide(width: 1, color: Color(int.parse('f5f5f5', radix: 16)).withAlpha(255));
    var boxDecoration = BoxDecoration(color: Colors.white, border: Border(bottom: border));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("新增收货地址", style: TextStyle(fontSize: 16, color: Colors.black)),
        centerTitle: true,
      ),
      body: Container(
        color: Color(int.parse('f5f5f5', radix: 16)).withAlpha(255),
        // padding: const EdgeInsets.symmetric(horizontal: 15),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 5),
              padding: const EdgeInsets.all(15),
              decoration: boxDecoration,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text("姓名", style: textStyle),
                  ),
                  Expanded(
                    flex: 4,
                    child: Text("小李", style: textStyle),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: boxDecoration,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text("手机号码", style: textStyle),
                  ),
                  Expanded(
                    flex: 4,
                    child: Text("18613030352", style: textStyle),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: boxDecoration,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text("邮政编码", style: textStyle),
                  ),
                  Expanded(
                    flex: 4,
                    child: Text("518000", style: textStyle),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: boxDecoration,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text("所在区域", style: textStyle),
                  ),
                  Expanded(
                    flex: 4,
                    child: Text("广东省 深圳市 福田区", style: textStyle),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: boxDecoration,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text("详细地址", style: textStyle),
                  ),
                  Expanded(
                    flex: 4,
                    child: Text("东晓街道", style: textStyle),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              margin: const EdgeInsets.only(top: 8, bottom: 20),
              padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
              // height: 54,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text("设为默认", style: textStyle),
                  ),
                  Switch(
                    value: true,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    onChanged: (value) {
                      print("click the default");
                    },
                    activeColor: Colors.white,
                    activeTrackColor: Color(int.parse('fa436a', radix: 16)).withAlpha(255),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pop(
                  MaterialPageRoute(
                    builder: (context) => const AddressList(),
                  ),
                );
              },
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                height: 40,
                margin: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Color(int.parse('fa436a', radix: 16)).withAlpha(255),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Text(
                  '提交',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
