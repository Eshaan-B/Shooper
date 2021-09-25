import 'package:flutter/foundation.dart';

class Product with ChangeNotifier {
  String id; // qr code
  String name;
  double price;
  int quantity;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.quantity,
  });

  void incrementQuantity() {
    quantity = quantity + 1;
    notifyListeners();
  }

  void decrementQuantity() {
    quantity = quantity - 1;
    notifyListeners();
  }
}
