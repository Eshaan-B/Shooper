import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BillItem with ChangeNotifier {
  String id; //barcode result
  String name;
  double price;
  int quantity;
  double totalAmount;

  BillItem({
    required this.id,
    required this.price,
    required this.name,
    required this.quantity,
    required this.totalAmount,
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

