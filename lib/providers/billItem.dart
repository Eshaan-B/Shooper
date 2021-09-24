import 'package:flutter/foundation.dart';

import 'ProductProvider.dart';
import 'product.dart';

class BillItem with ChangeNotifier {
  String? id;
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
