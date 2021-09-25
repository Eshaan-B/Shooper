import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import '../providers/ProductProvider.dart';

class AddProduct extends StatefulWidget {
  static const routeName = '/addProducts';

  const AddProduct({Key? key}) : super(key: key);

  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  String _barcodeResult = 'null';
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController quantityController = TextEditingController();

  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    if (!mounted) return;

    setState(() {
      _barcodeResult = barcodeScanRes;
    });
  }

  bool isValid() {
    return nameController.text.isNotEmpty &&
        priceController.text.isNotEmpty &&
        quantityController.text.isNotEmpty &&
        _barcodeResult != 'null';
  }

  void addProduct() {
    if (isValid()) {
      //add product
      Provider.of<ProductProvider>(context, listen: false).addProduct(
        id: _barcodeResult,
        quantity: int.parse(quantityController.text),
        name: nameController.text,
        price: double.parse(priceController.text),
      );
      print("Added product");
      Navigator.of(context).pop();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content:
            Text("Please make sure all the fields are filled up correctly"),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add product")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter  Product name',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 150,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: priceController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Price per item',
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    width: 100,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: quantityController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Quantity',
                      ),
                    ),
                  ),
                  Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: scanBarcodeNormal,
                        child: Icon(Icons.qr_code_scanner),
                      ),
                      Text("ID: $_barcodeResult")
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Spacer(),
                  ElevatedButton(
                    onPressed: addProduct,
                    child: Text('SAVE'),
                  ),
                  Spacer()
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
