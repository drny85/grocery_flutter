import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:grocery_app/models/category.dart';
import 'package:grocery_app/utils/constant.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Categories extends ChangeNotifier {
  final List<Category> _categories = [];

  UnmodifiableListView<Category> get categories =>
      UnmodifiableListView(_categories);

  void getCategories() async {
    try {
      const url = kUrl;
      final response = await http.get('$url/api/category');
      final data = json.decode(response.body);
      final allCategories = data['data'];

      if (_categories.length < 1) {
        return;
      }

      allCategories.forEach((category) {
        final cat = Category(
          id: category['_id'],
          name: category['name'],
          grocery: category['grocery'],
          userId: category['userId'],
        );

        _categories.add(cat);
      });

      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
