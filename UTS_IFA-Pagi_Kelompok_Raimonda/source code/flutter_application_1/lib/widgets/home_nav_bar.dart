import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeNavBar extends StatelessWidget {
  const HomeNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      height: 70,
      decoration: BoxDecoration(color: Color(0xff232227), boxShadow: [
        BoxShadow(color: Color(0xff232227), spreadRadius: 1, blurRadius: 8)
      ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.mail,
            color: Colors.white,
            size: 30,
          ),
          Icon(
            Icons.favorite_outline,
            color: Colors.white,
            size: 30,
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Color.fromRGBO(138, 92, 227, 1.0),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Icon(
              CupertinoIcons.cart_fill,
              color: Colors.white,
              size: 30,
            ),
          ),
          Icon(
            Icons.notifications,
            color: Colors.white,
            size: 30,
          ),
          Icon(
            Icons.person,
            color: Colors.white,
            size: 30,
          )
        ],
      ),
    );
  }
}
