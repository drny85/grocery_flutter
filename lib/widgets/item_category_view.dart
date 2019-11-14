import 'package:flutter/material.dart';
import 'package:grocery_app/models/item_model.dart';

import 'product_cart_item.dart';

class ItemCategoriesView extends StatelessWidget {
  final List<Item> items;
  final String categoryName;
  ItemCategoriesView({this.items, this.categoryName});
  @override
  Widget build(BuildContext context) {
    return items.length > 0
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 25.0, left: 10.0),
                child: Text(
                  '$categoryName (${items.length})',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              Container(
                height: 275,
                padding: const EdgeInsets.all(4),
                //margin: const EdgeInsets.all(10.0),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: items.length, //DUMMY_DATA.length,
                  itemBuilder: (ctx, index) {
                    final item = items[index];
                    return items.length > 0 ? ProductCardItem(item, 320) : null;
                  },
                ),
              ),
            ],
          )
        : Container();
  }
}
