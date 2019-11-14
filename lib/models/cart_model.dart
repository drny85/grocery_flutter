import 'item_model.dart';

class Cart {
  final String id;
  final List<Item> items;
  final int quantity;
  final double totalPrice;

  Cart({
    this.id,
    this.items,
    this.quantity,
    this.totalPrice,
  });
}
