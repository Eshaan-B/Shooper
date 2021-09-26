import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
    FirebaseFirestore.instance
        .collection('products')
        .doc(this.id)
        .update({'quantity': this.quantity + 1});
    quantity = quantity + 1;

    notifyListeners();
  }

  void decrementQuantity() {
    FirebaseFirestore.instance
        .collection('products')
        .doc(this.id)
        .update({'quantity': this.quantity - 1});
    quantity = quantity - 1;
    notifyListeners();
  }
}
