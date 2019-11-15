import 'package:flutter/material.dart';
import 'package:grocery_app/providers/cart.dart';
import 'package:provider/provider.dart';

class ShoppingCartScreen extends StatefulWidget {
  @override
  _ShoppingCartScreenState createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlatButton.icon(
          icon: Icon(
            Icons.clear_all,
            size: 20,
          ),
          label: Text('Clear Cart'),
          onPressed: () {
            Provider.of<ShoppingCart>(context).clearCart();
          },
        ),
      ),
    );
  }
}
