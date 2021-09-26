import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'billItem.dart';
import 'product.dart';
import 'bill.dart';

class ProductProvider with ChangeNotifier {
  List<Bill> billsList = [Bill('Bill 1'), Bill('Bill 2'), Bill('Bill 3')];
  List<Product> _productItems = [];
  List<BillItem> _billItems = [
    BillItem(
        id: '000',
        quantity: 2,
        name: 'Maggi with a long name',
        price: 10,
        totalAmount: 10),
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

  Future<void> fetchProducts() async {
    //set _ProductItems;
    List<Product> _tempProducts = _productItems;
    _productItems = [];
    try {
      await FirebaseFirestore.instance
          .collection('products')
          .get()
          .then((data) {
        data.docs.forEach((document) {
          _productItems.add(
            Product(
              id: document['id'],
              name: document['name'],
              price: document['price'],
              quantity: document['quantity'],
            ),
          );
        });
      }).catchError((err) => throw err);

      print("fetching complete");
    } catch (err) {
      _productItems = _tempProducts;
      print("Error in fetching!!");
      print(err);
      throw err;
    }
    notifyListeners();
  }

  void addProduct(
      {required String id,
      required String name,
      required double price,
      required int quantity}) async {
    int _prodIndex = _productItems.indexWhere((element) => element.id == id);
    //if product already exists
    if (_prodIndex >= 0) {
      _productItems[_prodIndex].incrementQuantity();
      FirebaseFirestore.instance
          .collection('products')
          .doc(id)
          .update({'quantity': _productItems[_prodIndex].quantity + quantity});
      _productItems[_prodIndex].quantity += quantity;
      return;
    }
    Product prod =
        Product(id: id, name: name, price: price, quantity: quantity);
    try {
      await FirebaseFirestore.instance.collection('products').doc(id).set({
        'id': id,
        'name': name,
        'price': price,
        'quantity': quantity,
      });
      _productItems.add(prod);
      print("Product successfully added");
    } catch (err) {
      print(err);
    }

    notifyListeners();
  }

  void deleteProduct(String id) {
    _productItems.removeWhere((product) => product.id == id);
    notifyListeners();
  }

  //####################  BILLING  ##############################

  void addBillItem(String id, String billId, int quant) {
    int _prodIndex = _productItems.indexWhere((element) => element.id == id);
    //if product is not available
    if (_prodIndex <= 0) {
      print("Product not found");
      return;
    }

    //if product is available
    Product prod = _productItems[_prodIndex];
    BillItem item = BillItem(
      id: id,
      price: prod.price,
      name: prod.name,
      quantity: quant,
      totalAmount: prod.price,
    );
    _billItems.add(item);

    Bill billList =
        billsList.firstWhere((element) => element.billNumber == billId);
    billList.appendBillItem(item);

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
