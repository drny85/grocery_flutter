import 'package:flutter/material.dart';
import '../DUMMY_DATA.dart';
import '../widgets/product_cart_item.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
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
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Container(
                  height: 200,
                  padding: const EdgeInsets.all(4),
                  //margin: const EdgeInsets.all(10.0),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: DUMMY_DATA.length,
                    itemBuilder: (ctx, index) {
                      final item = DUMMY_DATA[index];
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
