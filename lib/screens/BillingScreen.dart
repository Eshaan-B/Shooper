import 'package:flutter/material.dart';

class BillingScreen extends StatefulWidget {
  const BillingScreen({Key? key}) : super(key: key);
  static const routeName = '/billingScreen';

  @override
  _BillingScreenState createState() => _BillingScreenState();
}

class _BillingScreenState extends State<BillingScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('BillingScreen'));
  }
}
