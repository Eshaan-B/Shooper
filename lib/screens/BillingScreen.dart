import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shooper/providers/bill.dart';
import '../providers/ProductProvider.dart';
import '../widgets/BillListView.dart';
import '../providers/bill.dart';
import '../widgets/bill-header.dart';
import '../providers/billItem.dart';

var bill1 = Bill('Bill 1');
var bill2 = Bill('Bill 2');
var bill3 = Bill('Bill 3');

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

class BillingScreen extends StatefulWidget {
  const BillingScreen({Key? key}) : super(key: key);
  static const routeName = '/billingScreen';

  @override
  _BillingScreenState createState() => _BillingScreenState();
}

class _BillingScreenState extends State<BillingScreen> {
  //Making Bills in state:
  var currBill = getBillByID('Bill 1');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          DropdownButton<String>(
            value: currBill.billNumber,
            icon: const Icon(Icons.arrow_downward),
            iconSize: 24,
            elevation: 16,
            style: const TextStyle(color: Colors.deepPurple),
            underline: Container(
              height: 2,
              color: Colors.deepPurpleAccent,
            ),
            onChanged: (String? newValue) {
              setState(() {
                currBill.billNumber = newValue!;
              }); //Dosent Work
            },
            items: <String>['Bill 1', 'Bill 2', 'Bill 3']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          Header(),
          Container(child: TestBillList(currBill)),
        ],
      ),
      floatingActionButton: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 28.0),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: FloatingActionButton(
                heroTag: 'AddBillItem',
                onPressed: () => {
                  currBill.appendBillItem(BillItem(
                      id: '000',
                      quantity: 2,
                      name: 'Maggi',
                      price: 10,
                      totalAmount: 10))
                },
                child: const Icon(Icons.add),
                backgroundColor: Colors.green,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              heroTag: 'PlaceOrder',
              onPressed: () => {currBill.sell()},
              child: const Icon(Icons.shopping_cart),
              backgroundColor: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
