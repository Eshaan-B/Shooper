import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/ProductProvider.dart';

import 'screens/shopInfo.dart';
import 'screens/SplashScreen.dart';
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
          ShopInfo.routeName: (ctx) => ShopInfo(),
          TabsScreen.routeName: (ctx) => TabsScreen(),
          BillingScreen.routeName: (ctx) => BillingScreen(),
          StockScreen.routeName: (ctx) => StockScreen(),

        },
      ),
    );
  }
}
