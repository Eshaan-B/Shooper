import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../providers/ProductProvider.dart';
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
    return GridView.builder(
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
        });
  }
}
