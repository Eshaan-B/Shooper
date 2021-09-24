import 'package:flutter/foundation.dart';

class Product with ChangeNotifier {
  String? id; // qr code
  String? name;
  double? price;
  int? quantity;

  Product({
    this.id,
    this.name,
    this.price,
    this.quantity,
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
