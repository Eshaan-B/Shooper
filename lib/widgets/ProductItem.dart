import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'package:provider/provider.dart';
import '../providers/product.dart';
import '../providers/ProductProvider.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({Key? key}) : super(key: key);

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: Image.network(
          'https://www.christinascucina.com/wp-content/uploads/2017/10/fullsizeoutput_6b2a-720x405.jpeg',
          fit: BoxFit.cover,
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black54,
          title: Text(
            product.name.toString(),
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: [
              GestureDetector(
                onTap: () {
                  if (product.quantity <= 1) {
                    Provider.of<ProductProvider>(context, listen: false)
                        .deleteProduct(product);
                  } else {
                    Provider.of<Product>(context, listen: false)
                        .decrementQuantity();
                  }
                },
                child: Icon(
                  Icons.remove_circle,
                  size: 25,
                  color: Colors.redAccent,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Provider.of<Product>(context, listen: false)
                      .incrementQuantity();
                },
                child: Icon(
                  Icons.add_circle,
                  size: 25,
                  color: Colors.greenAccent,
                ),
              ),
              Consumer<Product>(
                builder: (ctx, prod, child) => ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Container(
                    width: 25,
                    height: 25,
                    color: Colors.orangeAccent,
                    child: Center(
                      child: Text(
                        prod.quantity.toString(),
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
