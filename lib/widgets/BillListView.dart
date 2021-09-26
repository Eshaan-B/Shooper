import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import '../providers/ProductProvider.dart';
import '../providers/billItem.dart';
import 'BillItemWidget.dart';
import 'package:provider/provider.dart';
import '../providers/bill.dart';

class TestBillList extends StatefulWidget {
  Bill currbill;
  TestBillList(this.currbill, {Key? key}) : super(key: key);
  @override
  _TestBillListState createState() => _TestBillListState(currbill);
}

class _TestBillListState extends State<TestBillList> {
  Bill currBill;
  _TestBillListState(this.currBill); //Default Bill

  @override
  Widget build(BuildContext context) {
    currBill.billItems = Provider.of<ProductProvider>(context).billItems;
    print(currBill.billItems);
    return Container(
      height: MediaQuery.of(context).size.height - 300,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return ChangeNotifierProvider.value(
            value: currBill.billItems[index],
            child: BillItemWidget(),
          );
        },
        itemCount: currBill.billItems.length,
      ),
    );
  }
}
