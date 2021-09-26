import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import '../providers/ProductProvider.dart';

import 'BillItemWidget.dart';
import 'package:provider/provider.dart';

class TestBillList extends StatefulWidget {
  TestBillList({Key? key}) : super(key: key);
  @override
  _TestBillListState createState() => _TestBillListState();
}

class _TestBillListState extends State<TestBillList> {
  _TestBillListState();

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<ProductProvider>(context);
    var bill = data.billItems;
    return Container(
      height: MediaQuery.of(context).size.height - 300,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return ChangeNotifierProvider.value(
            value: bill[index],
            child: Dismissible(
              child: BillItemWidget(),
              background: Container(
                color: Colors.red,
              ),
              key: ValueKey('Delete'),
              onDismissed: (direction) {
                data.removeBillItem(index);
              },
            ),
          );
        },
        itemCount: data.billItems.length,
      ),
    );
  }
}
