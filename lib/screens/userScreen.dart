import 'package:flutter/material.dart';

class UserScreen extends StatefulWidget {
  static const routeName='/userScreen';
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Test"),
      ),
    );
  }
}
