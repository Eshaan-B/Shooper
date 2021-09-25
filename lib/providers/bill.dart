import './billItem.dart';

enum BillNumber {
  Bill1,
  Bill2,
  Bill3,
}

class Bill {
  BillNumber billNumber;
  List<BillItem> billItems = [];

  Bill(this.billNumber);

  void appendBillItem(BillItem item) {
    billItems.insert(billItems.length, item);
  }
}
