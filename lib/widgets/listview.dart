import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/billItem.dart';
import '../providers/ProductProvider.dart';

class TableList extends StatelessWidget {
  const TableList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<BillItem> billItems = Provider.of<ProductProvider>(context).billItems;
    return SingleChildScrollView(
      child: ListView.builder(
        itemCount: billItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(billItems[index].name as String),
          );
        },
      ),
    );
  }
}
