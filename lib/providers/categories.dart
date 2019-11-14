import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:grocery_app/models/category.dart';
import 'package:grocery_app/utils/constant.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Categories extends ChangeNotifier {
  List<Category> _categories = [];

  UnmodifiableListView<Category> get categories =>
      UnmodifiableListView(_categories);

  Future<void> getCategories() async {
    try {
      const url = kUrl;
      final response = await http.get('$url/api/category');
      final data = json.decode(response.body) as Map<String, dynamic>;
      final allCategories = data['data'];
      List<Category> loadedCategories = [];

      // if (_categories.length < 1) {
      //   return;
      // }

      allCategories.forEach((category) {
        final cat = Category(
          id: category['_id'],
          name: category['name'],
          grocery: category['grocery'],
          userId: category['userId'],
        );

        loadedCategories.add(cat);
      });

      _categories = loadedCategories;

      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
