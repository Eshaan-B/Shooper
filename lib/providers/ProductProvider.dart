import 'package:flutter/foundation.dart';

import 'billItem.dart';
import 'product.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _productItems = [];
  List<BillItem> _billItems = [
    BillItem(id: '000', quantity: 2, name: 'Maggi', price: 10, totalAmount: 10),
    BillItem(id: '000', quantity: 2, name: 'Maggi', price: 10, totalAmount: 10),
    BillItem(id: '000', quantity: 2, name: 'Maggi', price: 10, totalAmount: 10),
    BillItem(id: '000', quantity: 2, name: 'Maggi', price: 10, totalAmount: 10),
    BillItem(id: '000', quantity: 2, name: 'Maggi', price: 10, totalAmount: 10),
  ];

  List<Product> get productItems {
    return [..._productItems];
  }

  List<BillItem> get billItems {
    return [..._billItems];
  }

  //##############  PRODUCTS  ###################################

  Product findProductById(String id) {
    return _productItems.firstWhere((product) => product.id == id);
  }

  void addProduct(
      {required String id,
      required String name,
      required double price,
      required int quantity}) {
    _productItems
        .add(Product(id: id, name: name, price: price, quantity: quantity));
    notifyListeners();
  }

  void deleteProduct(String id) {
    _productItems.removeWhere((product) => product.id == id);
    notifyListeners();
  }

  //####################  BILLING  ##############################

  void addBillItem(String id) {
    int _prodIndex = _productItems.indexWhere((element) => element.id == id);
    //if product is not available
    if (_prodIndex < 0) {
      print("Product not found");
      return;
    }

    //if product is available
    Product prod = _productItems[_prodIndex];
    _billItems.add(BillItem(
      id: id,
      price: prod.price,
      name: prod.name,
      quantity: 1,
      totalAmount: prod.price,
    ));
    prod.decrementQuantity();
    if (prod.quantity <= 0) _productItems.removeAt(_prodIndex);
    notifyListeners();
  }

  void removeBillItem(String id) {
    _billItems.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  void incrementBillItem(String id) {
    BillItem billItem = _billItems.firstWhere((element) => element.id == id);
    int prodIndex = _productItems.indexWhere((element) => element.id == id);
    //if products aren't available
    if (prodIndex <= 0) {
      print("No more products left");
    }
    // if more such products are available
    billItem.incrementQuantity();
    _productItems[prodIndex].decrementQuantity();
  }
}
