import 'package:flutter/material.dart';
import 'package:grocery_app/models/grocery.dart';

class GroceryCardItem extends StatelessWidget {
  final Grocery grocery;
  GroceryCardItem({this.grocery});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      height: MediaQuery.of(context).size.height / 3,
      decoration: BoxDecoration(
          color: Colors.grey, borderRadius: BorderRadius.circular(20)),
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            margin: const EdgeInsets.all(10),
            child: Text(
              grocery.name.toUpperCase(),
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  letterSpacing: 2.0,
                  fontFamily: 'RobotoCondensed'),
            ),
          ),
        ],
      ),
    );
  }
}
