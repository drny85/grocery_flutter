import 'dart:collection';

import 'package:flutter/material.dart';
import '../models/grocery.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Groceries extends ChangeNotifier {
  List<Grocery> _groceries = [];

  UnmodifiableListView<Grocery> get groceries =>
      UnmodifiableListView(_groceries);

  Future<void> getGroceries() async {
    try {
      final url = 'https://ac48112f.ngrok.io/api/grocery';
      final response = await http.get(url);
      final data = json.decode(response.body) as Map<String, dynamic>;
      final allGroceries = data['data'];
      List<Grocery> loadedGroceries = [];
      //print(data);

      allGroceries.forEach((grocery) {
        final tempGrocery = Grocery(
            id: grocery['_id'],
            name: grocery['name'],
            address: grocery['address'],
            city: grocery['city'],
            state: grocery['state'],
            imageURL: grocery['imageURL'],
            zipcode: grocery['zipcode'],
            phone: grocery['phone']);
        //userId: grocery['userId'],
        //createdAt: grocery['createdAt']);
        //items: grocery['items']);
        loadedGroceries.add(tempGrocery);
      });
      _groceries = loadedGroceries;
      notifyListeners();
    } catch (e) {
      print(e);
      notifyListeners();
    }
  }
}
