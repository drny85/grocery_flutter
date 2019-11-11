import 'package:grocery_app/models/item_model.dart';

class RespondeModel {
  final bool success;
  final int count;
  final List<Item> data;

  RespondeModel({this.success, this.count, this.data});
}
