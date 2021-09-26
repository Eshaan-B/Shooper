import './billItem.dart';
import 'package:flutter/foundation.dart';

class Bill with ChangeNotifier {
  String billNumber;
  List<BillItem> billItems = [];

  Bill(this.billNumber);

  void appendBillItem(BillItem item) {
    print('Adding');
    billItems.insert(0, item);
    notifyListeners();
  }

  void sell() {
    //TODO: ADD Code to make a sale
    billItems = [];
  }
}
