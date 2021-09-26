import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/ProductProvider.dart';
import '../widgets/BillListView.dart';
import '../widgets/bill-header.dart';
import '../providers/billItem.dart';

class BillingScreen extends StatefulWidget {
  const BillingScreen({Key? key}) : super(key: key);
  static const routeName = '/billingScreen';

  @override
  _BillingScreenState createState() => _BillingScreenState();
}

class _BillingScreenState extends State<BillingScreen> {
  @override
  Widget build(BuildContext context) {
    var data = Provider.of<ProductProvider>(context);
    return Scaffold(
      body: Column(
        children: [
          Header(),
          Container(child: TestBillList()),
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
                onPressed: () => data.addBillItem('000', 1),
                child: const Icon(Icons.add),
                backgroundColor: Colors.orangeAccent,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              heroTag: 'PlaceOrder',
              onPressed: () => data.submitOrder(),
              child: const Icon(Icons.shopping_cart),
              backgroundColor: Colors.orangeAccent,
            ),
          ),
        ],
      ),
    );
  }
}
