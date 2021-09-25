import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BillItem with ChangeNotifier {
  String? id; //barcode result
  String? name;
  double? price;
  int? quantity;
  double? totalAmount;

  BillItem({
    this.id,
    this.price,
    this.name,
    this.quantity,
    this.totalAmount,
  });

  void incrementQuantity() {
    quantity = quantity! + 1;
    notifyListeners();
  }

  void decrementQuantity() {
    quantity = quantity! - 1;
    notifyListeners();
  }
}

class BillItemWidget extends StatelessWidget {
  late BillItem item;

  BillItemWidget(BillItem billItem) {
    this.item = billItem;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ClipRRect(
      child: Row(
        children: [
          Text(item.name as String),
          Text(item.price as String),
          Text(item.quantity as String),
          Text(item.totalAmount as String),
        ],
      ),
    ));
  }
}
