import 'package:flutter/material.dart';
//import '../DUMMY_DATA.dart';
import '../widgets/product_cart_item.dart';
import 'package:grocery_app/providers/item_service.dart';
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
      Provider.of<ItemService>(context, listen: false).getItems();
    });
  }

  void getItems() async {
    //final response = Provider.of(context)
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    //Provider.of<ItemService>(context).getItems();
  }

  @override
  Widget build(BuildContext context) {
    final items = Provider.of<ItemService>(context).items;
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.grey.withOpacity(0.2),
                ),
                child: Icon(
                  Icons.audiotrack,
                  color: Theme.of(context).accentColor,
                  size: 30.0,
                ),
              ),
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.grey.withOpacity(0.2),
                ),
                child: Icon(
                  Icons.restaurant,
                  color: Theme.of(context).accentColor,
                  size: 30.0,
                ),
              ),
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.grey.withOpacity(0.2),
                ),
                child: Icon(
                  Icons.home,
                  color: Theme.of(context).accentColor,
                  size: 30.0,
                ),
              ),
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.grey.withOpacity(0.2),
                ),
                child: Icon(
                  Icons.hotel,
                  color: Theme.of(context).accentColor,
                  size: 30.0,
                ),
              ),
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.grey.withOpacity(0.2),
                ),
                child: Icon(
                  Icons.fastfood,
                  color: Theme.of(context).accentColor,
                  size: 30.0,
                ),
              ),
            ],
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
