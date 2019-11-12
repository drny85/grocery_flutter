import 'package:flutter/material.dart';
//import 'package:grocery_app/models/category.dart';
import 'package:grocery_app/providers/categories.dart';
import 'package:grocery_app/providers/groceries.dart';

import '../widgets/product_cart_item.dart';
import 'package:grocery_app/providers/items.dart';
import 'package:provider/provider.dart';
import 'dart:async';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // void getItem() async {
  //   http.Response response =
  //       await http.get('https://59bbce8f.ngrok.io/api/item');
  //       print(json.decode(response.body));
  // }

  @override
  void initState() {
    super.initState();
    // getItem();
    //Provider.of<ItemService>(context).getItems();
    Future.delayed(Duration.zero).then((_) async {
      Provider.of<Items>(context, listen: false).getItems();
      Provider.of<Groceries>(context, listen: false).getGroceries();
      Provider.of<Categories>(context, listen: false).getCategories();
    });
  }

  void getItems() async {
    //final response = Provider.of(context)
  }

  @override
  Widget build(BuildContext context) {
    final items = Provider.of<Items>(context).items;

    return Scaffold(
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              'What are you craving for today?',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Most Popular',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
                      return ProductCardItem(item);
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
