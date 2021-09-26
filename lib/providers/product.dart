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
    this.quantity = this.quantity + 1;

    notifyListeners();
  }

  void decrementQuantity() {
    if (this.quantity - 1 <= 0) {
      FirebaseFirestore.instance
          .collection('products')
          .doc(this.id)
          .delete()
          .then((value) => print('Product deleted'));
    }
    FirebaseFirestore.instance
        .collection('products')
        .doc(this.id)
        .update({'quantity': this.quantity - 1});
    this.quantity = this.quantity - 1;

    notifyListeners();
  }
}
