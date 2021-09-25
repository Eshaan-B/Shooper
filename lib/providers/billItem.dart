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
  final BillItem item;
  BillItemWidget(this.item);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Card(
        elevation: 4,
        child: Row(
          children: [
            Expanded(
              child: Text(
                item.name as String,
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: Text(
                (item.price as double).toString(),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: Text(
                (item.quantity as int).toString(),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: Text(
                (item.totalAmount as double).toString(),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
