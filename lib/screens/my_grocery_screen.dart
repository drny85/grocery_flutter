import 'package:flutter/material.dart';

class MyGroceryScreen extends StatefulWidget {
  @override
  _MyGroceryScreenState createState() => _MyGroceryScreenState();
}

class _MyGroceryScreenState extends State<MyGroceryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('My Grocery'),
      ),
    );
  }
}
