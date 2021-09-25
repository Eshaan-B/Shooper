import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/ProductProvider.dart';
import '../providers/billItem.dart';

class BillItemWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final item = Provider.of<BillItem>(context);
    return Container(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Card(
            elevation: 4,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    item.name,
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: Text(
                    item.price.toString(),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: Text(
                    item.quantity.toString(),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: Text(
                    item.totalAmount.toString(),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
