import 'package:flutter/material.dart';
import 'package:grocery_app/models/item_model.dart';
//import 'package:grocery_app/models/response_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
//import 'dart:async';

class ItemService extends ChangeNotifier {
  List<Item> _items = [];

  List<Item> get items {
    return _items;
  }

  void getItems() async {
    try {
      final response = await http.get('http://59bbce8f.ngrok.io/api/item');
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
    } catch (e) {
      print(e);
    }

    notifyListeners();

    //return loadedItems;
  }
}
