import 'package:flutter/material.dart';

import 'ShopInfo.dart';
import 'BillingScreen.dart';
import 'StockScreen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);
  static const routeName = '/tabsScreen';

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 1;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  final List<Map<String, dynamic>> _pages = [
    {
      'page': StockScreen(),
      'title': "Available stock",
    },
    {
      'page': BillingScreen(),
      'title': "QuickBill",
    },
    {
      'page': ShopInfo(),
      'title': "About",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title'].toString(),),
        centerTitle: true,
      ),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        elevation: 5,
        backgroundColor: Colors.tealAccent,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        selectedItemColor: Colors.blue,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.store_mall_directory_rounded),
            label: "Stock",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long_sharp),
            label: "Billing",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            label: "User Info",
          ),
        ],
      ),
    );
  }
}
