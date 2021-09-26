import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../providers/ProductProvider.dart';

import 'AddProduct.dart';
import '../widgets/ProductItem.dart';

class StockScreen extends StatefulWidget {
  static const routeName = '/stockScreen';

  @override
  _StockScreenState createState() => _StockScreenState();
}

class _StockScreenState extends State<StockScreen> {
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ProductProvider>(context);
    final products = productsData.productItems;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(AddProduct.routeName);
        },
        child: Icon(Icons.add),
      ),
      body: (products.length <= 0)
          ? Center(
              child: Container(
                child: Text(
                  "No items in shop.\n Click on the '+' icon to add items",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            )
          : GridView.builder(
              itemCount: products.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1 / 1,
                crossAxisSpacing: 5,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, i) {
                return ChangeNotifierProvider.value(
                  value: products[i],
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ProductItem(),
                  ),
                );
              }),
    );
  }
}
