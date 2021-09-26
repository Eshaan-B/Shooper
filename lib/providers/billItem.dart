import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shooper/providers/ProductProvider.dart';

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

  void getTotal() {
    this.totalAmount = this.price * this.quantity;
    notifyListeners();
  }

  void incrementQuantity() {
    quantity = quantity + 1;
    getTotal();
    notifyListeners();
  }

  void decrementQuantity() {
    quantity = quantity - 1;
    getTotal();
    notifyListeners();
  }
}
