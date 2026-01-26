import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mall/address_add.dart';
import 'package:flutter_mall/config/service_url.dart';
import 'package:flutter_mall/utils/http_util.dart';

import 'model/address_list.dart';

///
/// 收货地址列表页面
///
/// 作者：刘飞华
/// 日期：2023/11/21 17:17
///
class AddressList extends StatefulWidget {
  const AddressList({super.key});

  @override
  State<AddressList> createState() => _AddressListState();
}

class _AddressListState extends State<AddressList> {
  List<AddressListData> addressListData = [];

  @override
  void initState() {
    super.initState();
    queryAddressList();
  }

  void queryAddressList() async {
    Response result = await HttpUtil.get(addressListDataUrl);
    AddressListModel addressListModel = AddressListModel.fromJson(result.data);
    setState(() {
      addressListData = addressListModel.data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "收货地址",
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: addressListData.length,
                itemBuilder: (BuildContext context, int index) {
                  AddressListData data = addressListData[index];
                  var boxDecoration = BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Color(
                        int.parse('fa436a', radix: 16),
                      ).withAlpha(255),
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(2)),
                  );
                  return Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          width: 1,
                          color: Color(
                            int.parse('f5f5f5', radix: 16),
                          ).withAlpha(255),
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Visibility(
                                    visible: data.isDefault == 1,
                                    child: Container(
                                      margin: const EdgeInsets.only(right: 3),
                                      decoration: boxDecoration,
                                      child: Text(
                                        "默认",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Color(
                                            int.parse('fa436a', radix: 16),
                                          ).withAlpha(255),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      "${data.province} ${data.city} ${data.district} ${data.detailAddress}",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Color(
                                          int.parse('303133', radix: 16),
                                        ).withAlpha(255),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "${data.receiverName} ${data.receiverPhone}",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(
                                    int.parse('909399', radix: 16),
                                  ).withAlpha(255),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const AddressAdd(),
                                  ),
                                );
                              },
                              child: Image.asset(
                                "images/edit.png",
                                height: 20,
                                width: 22,
                              ),
                            ),
                            const SizedBox(width: 15),
                            Image.asset(
                              "images/delete.png",
                              height: 20,
                              width: 22,
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const AddressAdd()),
                );
              },
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                height: 50,
                margin: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Color(int.parse('fa436a', radix: 16)).withAlpha(255),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  '新增地址',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
