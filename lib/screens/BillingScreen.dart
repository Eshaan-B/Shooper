import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/ProductProvider.dart';

import '../widgets/bill-header.dart';
import '../providers/billItem.dart';
import '../widgets/listview.dart';

class BillingScreen extends StatefulWidget {
  const BillingScreen({Key? key}) : super(key: key);
  static const routeName = '/billingScreen';

  @override
  _BillingScreenState createState() => _BillingScreenState();
}

class _BillingScreenState extends State<BillingScreen> {
  @override
  Widget build(BuildContext context) {
    var dropdownValue = 'Bill 1'; //Default not Hardcoded
    //use ListViewBuilder to render billItems
    //Dismissible option
    return Scaffold(
      body: Column(
        children: [
          DropdownButton<String>(
            value: dropdownValue,
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
                dropdownValue = newValue!;
              });
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
          Container(
            child: Text('Table Comes Here'),
            decoration: new BoxDecoration(color: Colors.green),
            width: double.infinity,
            margin: EdgeInsets.only(left: 24, right: 24),
          ),
          Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.bottomLeft,
                child: FloatingActionButton(
                  onPressed: () => print('add'),
                  child: const Icon(Icons.add_circle_sharp),
                  backgroundColor: Colors.green,
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  onPressed: () => print('Buy'),
                  child: const Icon(Icons.shopping_cart),
                  backgroundColor: Colors.green,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
