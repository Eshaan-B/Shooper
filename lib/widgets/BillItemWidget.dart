import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/ProductProvider.dart';
import '../providers/billItem.dart';

class BillItemWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final item = Provider.of<BillItem>(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: 60,
        child: Card(
          color: Colors.white60,
          elevation: 5,
          child: Row(
            children: [
              Expanded(
                child: Text(
                  item.name,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
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
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Provider.of<ProductProvider>(context, listen: false)
                            .decrementBillItem(item);
                      },
                      child: Icon(
                        Icons.remove_circle,
                        size: 20,
                        color: Colors.redAccent,
                      ),
                    ),
                    Spacer(),
                    Text(
                      item.quantity.toString(),
                      textAlign: TextAlign.center,
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        if (Provider.of<ProductProvider>(context, listen: false)
                                .productItems
                                .indexWhere(
                                    (element) => element.id == item.id) <
                            0) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("No more of this products left"),
                          ));
                        }
                        Provider.of<ProductProvider>(context, listen: false)
                            .incrementBillItem(item);
                      },
                      child: Icon(
                        Icons.add_circle,
                        size: 20,
                        color: Colors.blue,
                      ),
                    ),
                  ],
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
      ),
    );
  }
}
