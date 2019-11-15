import 'package:flutter/material.dart';

import 'package:grocery_app/models/cart_model.dart';
import 'package:grocery_app/models/category.dart';
import 'package:grocery_app/models/item_model.dart';
import 'package:grocery_app/utils/constant.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class ShoppingCart extends ChangeNotifier {
  Cart cart = Cart(id: '', items: [], quantity: 0, totalPrice: 0);

  Future<void> addToCart(Item item) async {
    try {
      String cartId;
      SharedPreferences prefs = await SharedPreferences.getInstance();

      if (!prefs.containsKey('grocery_cartId')) {
        cartId = '';
        print("NO");
      }
      if (prefs.containsKey('grocery_cartId')) {
        final found = await json.decode(prefs.getString('grocery_cartId'));
        cartId = found['cartId'];
      }
      //print(cartId);
      Map<String, String> headers = {"Content-type": "application/json"};
      var encodeItem = json.encode(
        {
          'item': {
            '_id': item.id,
            'name': item.name,
            'description': item.description,
            'price': item.price,
            'imageURL': item.imageURL,
            'grocery': item.grocery,
            'category': item.category.id,
            'userId': item.userId,
          },
          'cartId': cartId
        },
      );

      http.Response response =
          await http.post('$kUrl/api/cart', body: encodeItem, headers: headers);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final loadedId = data['data'];
        getCart(loadedId);

        if (!prefs.containsKey('grocery_cartId')) {
          final carIdData = json.encode({'cartId': loadedId});
          await prefs.setString('grocery_cartId', carIdData);
        }
      }

      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<void> getCart(String cartId) async {
    try {
      final http.Response response = await http.get('$kUrl/api/cart/$cartId');
      if (response.statusCode == 200) {
        final cartData = json.decode(response.body);
        final loadCart = cartData['data'] as Map<String, dynamic>;
        cart = Cart(
          id: loadCart['_id'],
          items: loadCart['items'].map((item) {
            return Item(
              id: item['_id'],
              name: item['name'],
              description: item['description'],
              price: item['price'],
              imageURL: item['imageURL'],
              grocery: item['grocery'],
              category: Category(
                id: item['grocery']['_id'],
                name: item['grocery']['name'],
                grocery: item['grocery'],
                userId: item['grocery']['userId'],
              ),
              userId: item['userId'],
            );
          }),
        );
      }
      print(cart.items);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<void> clearCart() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      final found = await json.decode(prefs.getString('grocery_cartId'));
      final cartId = found['cartId'];
      http.Response response = await http.delete('$kUrl/api/cart/$cartId');
      if (response.statusCode == 200) {
        prefs.remove('grocery_cartId');
      }
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
