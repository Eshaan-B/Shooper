import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/userScreen';
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<SplashScreen> {
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
