import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              'Name',
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Text(
              'Price',
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Text(
              'Quantity',
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Text(
              'Total',
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
