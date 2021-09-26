import './billItem.dart';

class Bill {
  String billNumber;
  List<BillItem> billItems = [];

  Bill(this.billNumber);

  void appendBillItem(BillItem item) {
    print('Adding');
    billItems.insert(0, item);
  }

  void sell() {
    //TODO: ADD Code to make a sale
    billItems = [];
  }
}

Bill getBillByID(String billID) {
  switch (billID) {
    case 'Bill 2':
      return bill2;
    case 'Bill 3':
      return bill3;
    default:
      return bill1;
  }
}
