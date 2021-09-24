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
    Map<int, Color> color = {
      50: Color.fromRGBO(136, 14, 79, .1),
      100: Color.fromRGBO(136, 14, 79, .2),
      200: Color.fromRGBO(136, 14, 79, .3),
      300: Color.fromRGBO(136, 14, 79, .4),
      400: Color.fromRGBO(136, 14, 79, .5),
      500: Color.fromRGBO(136, 14, 79, .6),
      600: Color.fromRGBO(136, 14, 79, .7),
      700: Color.fromRGBO(136, 14, 79, .8),
      800: Color.fromRGBO(136, 14, 79, .9),
      900: Color.fromRGBO(136, 14, 79, 1),
    };
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => ProductProvider(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: MaterialColor(0xff1a1c20, color),
          accentColor: MaterialColor(0xfff9813a, color),

        ),
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
