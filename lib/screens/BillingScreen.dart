import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../providers/ProductProvider.dart';
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
    List<BillItem> billItems = Provider
        .of<ProductProvider>(context)
        .billItems;

    //use ListViewBuilder to render billItems
    //Dismissible option
    return Center(child:Text("Billitems"));
  }
}
