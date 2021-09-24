import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/product.dart';
import 'providers/ProductProvider.dart';
import 'providers/billItem.dart';

import 'screens/SplashScreen.dart';
import 'screens/ShopInfo.dart';
import 'screens/BillingScreen.dart';
import 'screens/StockScreen.dart';
import 'screens/TabsScreen.dart';

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
      child: MaterialApp(
        home: SplashScreen(),
        routes: {
          TabsScreen.routeName: (ctx) => TabsScreen(),
          BillingScreen.routeName: (ctx) => BillingScreen(),
          ShopInfo.routeName: (ctx) => ShopInfo(),
          StockScreen.routeName: (ctx) => StockScreen(),

        },
      ),
    );
  }
}
