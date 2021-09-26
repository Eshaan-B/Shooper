import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import '../providers/ProductProvider.dart';
import '../widgets/BillListView.dart';
import '../widgets/bill-header.dart';
import '../providers/billItem.dart';
import 'package:flutter/services.dart';

class BillingScreen extends StatefulWidget {
  const BillingScreen({Key? key}) : super(key: key);
  static const routeName = '/billingScreen';

  @override
  _BillingScreenState createState() => _BillingScreenState();
}

class _BillingScreenState extends State<BillingScreen> {
  String _scanBarcode = 'Unknown';

  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);

      print(barcodeScanRes);
      if (Provider.of<ProductProvider>(context, listen: false)
              .productItems
              .indexWhere(
                  (element) => element.id == barcodeScanRes.toString()) <
          0) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("This item is not in your stock")));
      }
      Provider.of<ProductProvider>(context, listen: false)
          .addBillItem(barcodeScanRes.toString());
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

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
                onPressed: () async {
                  await scanBarcodeNormal();
                },
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
