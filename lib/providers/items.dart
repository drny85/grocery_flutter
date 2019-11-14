import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:grocery_app/models/category.dart';

import 'package:grocery_app/models/item_model.dart';
import 'package:grocery_app/utils/constant.dart';
//import 'package:grocery_app/models/response_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
//import 'dart:async';

class Items extends ChangeNotifier {
  List<Item> _items = [];

  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);

  Future<void> getItems() async {
    try {
      final url = kUrl;
      final response = await http.get('$url/api/item');
      final data = json.decode(response.body) as Map<String, dynamic>;
      final List<Item> loadedItems = [];
      final allItems = data['data'];

      allItems.forEach((item) {
        final pr = item['price'];
        loadedItems.add(
          Item(
            id: item['_id'],
            name: item['name'],
            description: item['description'],
            price: double.parse(pr),
            imageURL: item['imageURL'],
            category: Category(
                id: item['grocery']['_id'],
                name: item['grocery']['name'],
                grocery: item['grocery']['grocery'],
                userId: item['grocery']['userId']),
            userId: item['userId'],
            grocery: item['grocery'],
          ),
        );
      });

      _items = loadedItems;

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
            category: Category(
                id: item['category']['_id'],
                name: item['category']['name'],
                grocery: item['category']['grocery'],
                userId: item['category']['userId']),
          ),
        );
      });

      print(loadedItems);

      _items = loadedItems;

      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
