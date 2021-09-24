import 'package:flutter/material.dart';
import 'dart:async';

import 'shopInfo.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/splashScreen';

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 4),
        () => Navigator.of(context).pushReplacementNamed(ShopInfo.routeName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('assets/local-shop.png'),
            ),
            Text(
              'Shooper App',
              style: TextStyle(
                fontSize: 28,
                fontFamily: 'sans-serif',
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
