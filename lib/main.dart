import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/product.dart';
import 'providers/ProductProvider.dart';
import 'providers/billItem.dart';

import 'screens/userScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => ProductProvider(),
        ),
      ],
      child: MaterialApp(routes: {
        '/': (ctx) => UserScreen(),
      }),
    );
  }
}
