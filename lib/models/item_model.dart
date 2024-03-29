import 'package:flutter/widgets.dart';
import 'package:grocery_app/models/category.dart';

class Item {
  final String id;
  final String name;
  final double price;
  final String description;
  final Category category;
  final String imageURL;
  final String grocery;
  final String userId;

  const Item(
      {@required this.id,
      @required this.name,
      this.description,
      @required this.grocery,
      @required this.imageURL,
      @required this.price,
      @required this.category,
      this.userId});
}
