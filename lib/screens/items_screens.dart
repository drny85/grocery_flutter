import 'package:flutter/material.dart';

import 'package:grocery_app/providers/categories.dart';
import 'package:grocery_app/widgets/item_category_view.dart';

import '../widgets/product_cart_item.dart';
import 'package:grocery_app/providers/items.dart';
import 'package:provider/provider.dart';

class ItemsScreen extends StatefulWidget {
  final String groceryName;

  ItemsScreen([this.groceryName]);
  @override
  _ItemsScreenState createState() => _ItemsScreenState();
}

class _ItemsScreenState extends State<ItemsScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero).then((_) {
      Provider.of<Categories>(context).getCategories();
    });
  }

  @override
  Widget build(BuildContext context) {
    final items = Provider.of<Items>(context).items;
    final categories = Provider.of<Categories>(context).categories;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.groceryName.toUpperCase()),
      ),
      body: items.length < 1
          ? Center(
              child: Text('No Items added yet'),
            )
          : ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    'What are you craving for today?',
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0, left: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          'Most Popular (${items.length})',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                      Container(
                        height: 300,
                        padding: const EdgeInsets.all(4),
                        //margin: const EdgeInsets.all(10.0),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: items.length, //DUMMY_DATA.length,
                          itemBuilder: (ctx, index) {
                            final item = items[index];
                            return ProductCardItem(item, 250.0);
                          },
                        ),
                      ),
                      Divider(
                        height: 2.0,
                        color: Colors.grey,
                      ),
                      for (var i = 0; i < categories.length; i++)
                        ItemCategoriesView(
                          items: items.where((item) {
                            final category = categories[i];

                            return item.category.name == category.name;
                          }).toList(),
                          categoryName: categories[i].name.toUpperCase(),
                        ),
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
