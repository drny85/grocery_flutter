import 'package:flutter/material.dart';

import 'package:grocery_app/models/item_model.dart';
import 'package:grocery_app/utils/constant.dart';
//import 'package:grocery_app/models/response_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
//import 'dart:async';

class Items extends ChangeNotifier {
  List<Item> _items = [];

  List<Item> get items {
    return _items;
  }

  Future<void> getItems() async {
    try {
      final url = kUrl;
      final response = await http.get('$url/api/item');
      final data = json.decode(response.body) as Map<String, dynamic>;
      //final List<Item> loadedItems = [];
      final allItems = data['data'];

      allItems.forEach((item) {
        final pr = item['price'];
        items.add(
          Item(
            id: item['_id'],
            name: item['name'],
            description: item['description'],
            price: double.parse(pr),
            imageURL: item['imageURL'],
            category: item['grocery'],
            userId: item['userId'],
            grocery: item['grocery'],
          ),
        );
      });

      notifyListeners();
    } catch (e) {
      print(e);
      notifyListeners();
    }

    notifyListeners();

    //return loadedItems;
  }

  Future<void> getItemsByGrocery(String groceryId) async {
    try {
      final url = kUrl;
      final response = await http.get('$url/api/item/grocery/$groceryId');
      final data = json.decode(response.body);
      final allItems = data['data'];
      List<Item> loadedItems = [];

      allItems.forEach((item) {
        loadedItems.add(
          Item(
            id: item['_id'],
            name: item['name'],
            price: double.parse(item['price']),
            description: item['description'],
            imageURL: item['imageURL'],
            grocery: item['grocery'],
            userId: item['userId'],
            category: item['category'],
          ),
        );
      });

      _items = loadedItems;

      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
