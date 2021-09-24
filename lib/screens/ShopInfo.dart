import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class User {
  final String userName;
  final String mobileNo;
  final String email;
  final String imageSrc;

  User(
    this.userName,
    this.mobileNo,
    this.email,
    this.imageSrc,
  );
}

class ShopInfo extends StatefulWidget {
  static const routeName = "/shopInfo";

  @override
  State<StatefulWidget> createState() {
    // ignore: todo
    //TODO : ADD logic to put in values
    var owner = User('shop_keeper', '0123456789', 'user@shop.com',
        'assets/default_userIcon.png');
    // ignore: no_logic_in_create_state, prefer_const_constructors
    return ShopInfoState(true, owner);
  }
}

class ShopInfoState extends State<ShopInfo> {
  final bool userLoggedIn;
  final User owner;

  ShopInfoState(this.userLoggedIn, this.owner);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        margin: const EdgeInsets.only(top: 12),
        child: Column(
          children: [
            ClipOval(
              child: Image(image: AssetImage(owner.imageSrc)),
            ),
            Container(
              child: Text(
                owner.userName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),
              margin: const EdgeInsets.all(28),
              width: double.infinity,
              alignment: Alignment.center,
            ),
            Container(
              child: Row(
                children: [
                  const Text(
                    'Mobile Number : ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    owner.mobileNo,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(left: 28),
            ),
            Container(
              child: Row(
                children: [
                  const Text(
                    'Email Address   : ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    owner.email,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(left: 28),
            ),
          ],
        ),
      ),
    );
  }
}
