import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import '../providers/ProductProvider.dart';
import '../providers/billItem.dart';
import 'BillItemWidget.dart';
import 'package:provider/provider.dart';

class TestBillList extends StatefulWidget {
  const TestBillList({Key? key}) : super(key: key);

  @override
  _TestBillListState createState() => _TestBillListState();
}

class _TestBillListState extends State<TestBillList> {
  @override
  Widget build(BuildContext context) {
    List<BillItem> billItems = Provider.of<ProductProvider>(context).billItems;

    return Container(
      height: MediaQuery.of(context).size.height - 300,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return ChangeNotifierProvider.value(
            value: billItems[index],
            child: BillItemWidget(),
          );
        },
        itemCount: billItems.length,
      ),
    );
  }
}
