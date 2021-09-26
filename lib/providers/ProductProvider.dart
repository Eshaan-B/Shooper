import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'billItem.dart';
import 'product.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _productItems = [];
  List<BillItem> _billItems = [];
  var history = [
    {'time': '2021-09-26 23:04:38.168', 'total': 1200},
    {'time': '2021-09-26 23:04:38.168', 'total': 1200},
    {'time': '2021-09-26 23:04:38.168', 'total': 1200},
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

    try {
      _productItems = [];
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

  void deleteProduct(Product prod) {
    prod.decrementQuantity();
    _productItems.removeWhere((product) => product.id == prod.id);
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
    BillItem item = BillItem(
      id: id,
      price: prod.price,
      name: prod.name,
      quantity: 1,
      totalAmount: prod.price,
    );

    _billItems.insert(0, item);
    prod.decrementQuantity();
    if (prod.quantity <= 0) _productItems.removeAt(_prodIndex);
    notifyListeners();
  }

  void removeBillItem(BillItem bill) {
    Product prod = productItems.firstWhere((element) => element.id == bill.id);
    for (int i = 0; i < bill.quantity; i++) prod.incrementQuantity();
    _billItems.removeWhere((element) => element.id == bill.id);

    notifyListeners();
  }

  void incrementBillItem(BillItem billItem) {
    int prodIndex =
        _productItems.indexWhere((element) => element.id == billItem.id);
    //if products aren't available
    if (prodIndex < 0) {
      print("No more products left");
      return;
    }
    // if more such products are available
    billItem.incrementQuantity();
    if (_productItems[prodIndex].quantity > 1)
      _productItems[prodIndex].decrementQuantity();
    else
      deleteProduct(_productItems[prodIndex]);
    notifyListeners();
  }

  void decrementBillItem(BillItem billItem) {
    int prodIndex =
        _productItems.indexWhere((element) => element.id == billItem.id);
    billItem.decrementQuantity();
    if (prodIndex < 0) {
      Product newProd = Product(
          price: billItem.price,
          name: billItem.name,
          quantity: 1,
          id: billItem.id);
      _productItems.add(newProd);
    } else {
      _productItems[prodIndex].incrementQuantity();
    }
    if (billItem.quantity <= 0) removeBillItem(billItem);
    notifyListeners();
  }

  double getTotal() {
    double total = 0;
    _billItems.forEach((item) {
      total += item.totalAmount;
    });
    return total;
  }

  void submitOrder() {
    double total = getTotal();
    _billItems.forEach((item) {
      total += item.totalAmount;
    });
    FirebaseFirestore.instance.collection('orders').add(
      {
        'date': DateTime.now().toIso8601String(),
        'total': total,
      },
    ).then((value) {
      print('Order placed wit htotal = $total');
    }).catchError((err) {
      print("ERROR WHILE ORDERING");
      print(err);
    });
    _billItems = [];
    notifyListeners();
  }

  //#################################History######################################
  void addToHistory(String time, double total) {
    history.insert(0, {'time': time, 'total': total});
  }
}
